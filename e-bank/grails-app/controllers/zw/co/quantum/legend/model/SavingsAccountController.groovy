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
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [savingsAccountInstanceList: SavingsAccount.list(params), savingsAccountInstanceTotal: SavingsAccount.count()]
    }

    def create = {
        def savingsAccountInstance = new SavingsAccount()
        savingsAccountInstance.properties = params
        return [savingsAccountInstance: savingsAccountInstance]
    }

    def save = {
        def savingsAccountInstance = new SavingsAccount(params)
		
		if (!session.clientNo) {
			flash.message = 'No client selected'
			render(view: "create", model: [savingsAccountInstance: savingsAccountInstance])
			return
		}
		
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
	
	def search() {
		
		def savingsAccountList = SavingsAccount.withCriteria {
			
			if (params.'branch.id') {
				eq('branch.id', params.'branch.id'.toLong())
			}
			if (params.type) {
				eq('type', params.type)
			}
			if (params.accountNumber) {
				eq('accountNumber', params.accountNumber)
			}
			if (params.accountName) {
				ilike('accountName', "%${params.accountName}%")
			}
		}
			
		println savingsAccountList?.size()
		
		if (savingsAccountList) {
			flash.message = "${savingsAccountList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[savingsAccountInstanceList: savingsAccountList, savingsAccountInstanceTotal: savingsAccountList?.size()]

	}
	
	def transactionHistory() {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def savingsAccountInstance = SavingsAccount.get(params.id)
		
		def  postingInstanceList = Posting.findAllByAccountNumber(savingsAccountInstance.accountNumber)
		
		[ savingsAccountInstance: savingsAccountInstance, postingInstanceList: postingInstanceList, postingInstanceTotal: postingInstanceList?.size() ]
		
	}
	
	def applyTransaction() {
		
		[ savingsAccountInstance: SavingsAccount.get(params.id) ]
		
	}
	
	def postTransaction() {
		
		def savingsAccountInstance = SavingsAccount.get(params.id)
		
		System.out.println("%% savingsAccountInstance: " + savingsAccountInstance);
		
		try {
			
			Date transactionDate = params.transactionDate
					
			if (!params.amount) {
				flash.message = 'Amount is not valid'
				redirect(action: 'applyTransaction', id: params.id)
				return
			}
			
			Response resp = accountService.performTransaction(savingsAccountInstance, transactionDate, 
																params.amount?.toBigDecimal(), params.paymentType, params.transactionType)
			
			flash.message = resp.message
			
			if (resp.isSuccess()) {
				redirect(action:'show', id: savingsAccountInstance.id )
			} else {
				savingsAccountInstance = (SavingsAccount) resp.principal
			redirect(action: 'applyTransaction', id: params.id)
				return
			}
			
		} catch (Exception e) {
			flash.message = 'Error occured. One or more of the values you entered is/are invalid'
			redirect(action: 'applyTransaction', id: params.id)
			return
		}
						
	}
	
}
