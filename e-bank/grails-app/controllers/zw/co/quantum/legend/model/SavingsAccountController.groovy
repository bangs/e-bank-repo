package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.Constants;
import zw.co.quantum.legend.util.Response;

class SavingsAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def accountService
	
	def clientService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [savingsAccountInstanceList: SavingsAccount.list(params), savingsAccountInstanceTotal: SavingsAccount.count()]
    }

    def create = {
        def savingsAccountInstance = new SavingsAccount()
        savingsAccountInstance.properties = params
        return [savingsAccountInstance: savingsAccountInstance]
    }

    def save = {
        def savingsAccountInstance = new SavingsAccount(params)
		
		savingsAccountInstance = clientService.populateClientInfo(savingsAccountInstance, session.clientNo)
		
		Response resp = accountService.registerAccount(savingsAccountInstance)  
		
		flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: savingsAccountInstance.id)
        }
        else {
			savingsAccountInstance = (SavingsAccount) resp.principal
            render(view: "create", model: [savingsAccountInstance: savingsAccountInstance])
        }
		
		//remove session objects
		session.removeAttribute('clientNo')
		session.removeAttribute('clientType')
		session.removeAttribute('clientName')
		
    }

    def show = {
        def savingsAccountInstance = SavingsAccount.get(params.id)
        if (!savingsAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [savingsAccountInstance: savingsAccountInstance]
        }
    }

    def edit = {
        def savingsAccountInstance = SavingsAccount.get(params.id)
        if (!savingsAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [savingsAccountInstance: savingsAccountInstance]
        }
    }

    def update = {
        def savingsAccountInstance = SavingsAccount.get(params.id)
        if (savingsAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (savingsAccountInstance.version > version) {
                    
                    savingsAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'savingsAccount.label', default: 'SavingsAccount')] as Object[], "Another user has updated this SavingsAccount while you were editing")
                    render(view: "edit", model: [savingsAccountInstance: savingsAccountInstance])
                    return
                }
            }
            savingsAccountInstance.properties = params
            if (!savingsAccountInstance.hasErrors() && savingsAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), savingsAccountInstance.id])}"
                redirect(action: "show", id: savingsAccountInstance.id)
            }
            else {
                render(view: "edit", model: [savingsAccountInstance: savingsAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def savingsAccountInstance = SavingsAccount.get(params.id)
        if (savingsAccountInstance) {
            try {
                savingsAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def approve() {
		def savingsAccountInstance = SavingsAccount.get(params.id)
		savingsAccountInstance.status = Constants.STATUS_ACTIVE
		if (!savingsAccountInstance.save(flush: true)) {
			savingsAccountInstance.errors.allErrors.each { println it }
			flash.message = 'Error occured during approval'
			render(view:'show', model: [ savingsAccountInstance: savingsAccountInstance ])
		} else {
			flash.message = 'Savings account approved successfuly'
			render(view:'show', model: [ savingsAccountInstance: savingsAccountInstance ])
		}
	}
	

}
