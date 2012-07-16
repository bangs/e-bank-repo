package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class FinancialAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [financialAccountInstanceList: FinancialAccount.list(params), financialAccountInstanceTotal: FinancialAccount.count()]
    }

    def create = {

    }

    def show = {
        def financialAccountInstance = FinancialAccount.get(params.id)
        
		def controllerValue
		
		if (financialAccountInstance instanceof LoanAccount) {
			controllerValue = 'loanAccount'
		} else if (financialAccountInstance instanceof SavingsAccount) {
			controllerValue = 'savingsAccount'
		} else {
			controllerValue = 'systemAccount'
		}
		
		redirect(controller: controllerValue, action:'show', params: params)
		
    }

    def edit = {
        def financialAccountInstance = FinancialAccount.get(params.id)
        if (!financialAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [financialAccountInstance: financialAccountInstance]
        }
    }

    def update = {
        def financialAccountInstance = FinancialAccount.get(params.id)
        if (financialAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (financialAccountInstance.version > version) {
                    
                    financialAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'financialAccount.label', default: 'FinancialAccount')] as Object[], "Another user has updated this FinancialAccount while you were editing")
                    render(view: "edit", model: [financialAccountInstance: financialAccountInstance])
                    return
                }
            }
            financialAccountInstance.properties = params
            if (!financialAccountInstance.hasErrors() && financialAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), financialAccountInstance.id])}"
                redirect(action: "show", id: financialAccountInstance.id)
            }
            else {
                render(view: "edit", model: [financialAccountInstance: financialAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def financialAccountInstance = FinancialAccount.get(params.id)
        if (financialAccountInstance) {
            try {
                financialAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'financialAccount.label', default: 'FinancialAccount'), params.id])}"
            redirect(action: "list")
        }
    }

	def next() {
		
		def superType = params.superType
		
		if (!superType) {
			flash.message = "Please select the account type then click next."
			redirect(action: "create")
			return
		}
		
		def controllerValue, actionValue = 'create'
				
		switch(superType) {
			case Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_LOAN : controllerValue = 'loanAccount'; break
			case Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_SAVINGS : controllerValue = 'savingsAccount'; break
			case Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_SYSTEM : controllerValue = 'systemAccount'; break
			default: controllerValue = 'financialAccount'; actionValue = 'create'; break
		}
		
		println ("############# Controller: ${controllerValue} Action: ${actionValue}")
		
		redirect(controller: controllerValue, action: actionValue)
		
	}
	
	def approveList() {
		
		User user = User.get(springSecurityService.principal.id)
		
		def approveList = LoanAccount.findAllByStatusAndBranch(Constants.STATUS_PENDING_APPROVAL, user.branch)
		approveList?.addAll(SavingsAccount.findAllByStatusAndBranch(Constants.STATUS_PENDING_APPROVAL, user.branch))
		
		flash.message = approveList? "${approveList.size()} result(s) found." : "No results found."
		
		[ financialAccountInstanceList: approveList ]
		
	}

}
