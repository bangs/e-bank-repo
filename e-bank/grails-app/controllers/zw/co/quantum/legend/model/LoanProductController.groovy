package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class LoanProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [loanProductInstanceList: LoanProduct.list(params), loanProductInstanceTotal: LoanProduct.count()]
    }

    def create = {
        def loanProductInstance = new LoanProduct()
        loanProductInstance.properties = params
        return [loanProductInstance: loanProductInstance]
    }

    def save = {
        def loanProductInstance = new LoanProduct(params)
		
		loanProductInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		loanProductInstance.status = Constants.STATUS_ACTIVE
		
        if (loanProductInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), loanProductInstance.id])}"
            redirect(action: "show", id: loanProductInstance.id)
        }
        else {
            render(view: "create", model: [loanProductInstance: loanProductInstance])
        }
    }

    def show = {
        def loanProductInstance = LoanProduct.get(params.id)
        if (!loanProductInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
            redirect(action: "list")
        }
        else {
            [loanProductInstance: loanProductInstance]
        }
    }

    def edit = {
        def loanProductInstance = LoanProduct.get(params.id)
        if (!loanProductInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [loanProductInstance: loanProductInstance]
        }
    }

    def update = {
        def loanProductInstance = LoanProduct.get(params.id)
        if (loanProductInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (loanProductInstance.version > version) {
                    
                    loanProductInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'loanProduct.label', default: 'LoanProduct')] as Object[], "Another user has updated this LoanProduct while you were editing")
                    render(view: "edit", model: [loanProductInstance: loanProductInstance])
                    return
                }
            }
            loanProductInstance.properties = params
            if (!loanProductInstance.hasErrors() && loanProductInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), loanProductInstance.id])}"
                redirect(action: "show", id: loanProductInstance.id)
            }
            else {
                render(view: "edit", model: [loanProductInstance: loanProductInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def loanProductInstance = LoanProduct.get(params.id)
        if (loanProductInstance) {
            try {
                loanProductInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanProduct.label', default: 'LoanProduct'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def search() {
		
		def loanProductList = LoanProduct.withCriteria {
			
			if (params.'category.id') {
				eq('category.id', params.'category.id'.toLong())
			}
			if (params.interestRateType) {
				eq('interestRateType', params.interestRateType)
			}
			if (params.canWaiveInterest) {
				eq('canWaiveInterestOnLoanRepayment', params.canWaiveInterest.toBoolean())
			}
		}
			
		println loanProductList?.size()
		
		if (loanProductList) {
			flash.message = "${loanProductList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[loanProductInstanceList: loanProductList, loanProductInstanceTotal: loanProductList?.size()]

	}
	
}
