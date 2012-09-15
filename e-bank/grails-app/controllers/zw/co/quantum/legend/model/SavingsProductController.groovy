package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class SavingsProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [savingsProductInstanceList: SavingsProduct.list(params), savingsProductInstanceTotal: SavingsProduct.count()]
    }

    def create = {
        def savingsProductInstance = new SavingsProduct()
        savingsProductInstance.properties = params
        return [savingsProductInstance: savingsProductInstance]
    }

    def save = {
        def savingsProductInstance = new SavingsProduct(params)
		
		savingsProductInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		savingsProductInstance.status = Constants.STATUS_ACTIVE
		
        if (savingsProductInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), savingsProductInstance.id])}"
            redirect(action: "show", id: savingsProductInstance.id)
        }
        else {
            render(view: "create", model: [savingsProductInstance: savingsProductInstance])
        }
    }

    def show = {
        def savingsProductInstance = SavingsProduct.get(params.id)
        if (!savingsProductInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
            redirect(action: "list")
        }
        else {
            [savingsProductInstance: savingsProductInstance]
        }
    }

    def edit = {
        def savingsProductInstance = SavingsProduct.get(params.id)
        if (!savingsProductInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [savingsProductInstance: savingsProductInstance]
        }
    }

    def update = {
        def savingsProductInstance = SavingsProduct.get(params.id)
        if (savingsProductInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (savingsProductInstance.version > version) {
                    
                    savingsProductInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'savingsProduct.label', default: 'SavingsProduct')] as Object[], "Another user has updated this SavingsProduct while you were editing")
                    render(view: "edit", model: [savingsProductInstance: savingsProductInstance])
                    return
                }
            }
            savingsProductInstance.properties = params
            if (!savingsProductInstance.hasErrors() && savingsProductInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), savingsProductInstance.id])}"
                redirect(action: "show", id: savingsProductInstance.id)
            }
            else {
                render(view: "edit", model: [savingsProductInstance: savingsProductInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def savingsProductInstance = SavingsProduct.get(params.id)
        if (savingsProductInstance) {
            try {
                savingsProductInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsProduct.label', default: 'SavingsProduct'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def search() {
		
		def savingsProductList = SavingsProduct.withCriteria {
			
			if (params.'category.id') {
				eq('category.id', params.'category.id'.toLong())
			}
		}
			
		println savingsProductList?.size()
		
		if (savingsProductList) {
			flash.message = "${savingsProductList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[savingsProductInstanceList: savingsProductList, savingsProductInstanceTotal: savingsProductList?.size()]

	}

}
