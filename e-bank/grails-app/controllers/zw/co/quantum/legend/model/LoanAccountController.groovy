package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;
import zw.co.quantum.legend.util.Response;

class LoanAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
	def clientService
	
	def accountService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [loanAccountInstanceList: LoanAccount.list(params), loanAccountInstanceTotal: LoanAccount.count()]
    }

    def create = {
        def loanAccountInstance = new LoanAccount()
        loanAccountInstance.properties = params
        return [loanAccountInstance: loanAccountInstance]
    }

    def save = {
		
        def loanAccountInstance = new LoanAccount(params)
		
		loanAccountInstance = clientService.populateClientInfo(loanAccountInstance, session.clientNo)
		
		Response resp = accountService.registerAccount(loanAccountInstance)  
		
		flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: loanAccountInstance.id)
        }
        else {
			loanAccountInstance = (LoanAccount) resp.principal
            render(view: "create", model: [loanAccountInstance: loanAccountInstance])
			return
        }
		
		//remove session objects
		session.removeAttribute('clientNo')
		session.removeAttribute('clientType')
		session.removeAttribute('clientName')
		
    }

    def show = {
        def loanAccountInstance = LoanAccount.get(params.id)
        if (!loanAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [loanAccountInstance: loanAccountInstance]
        }
    }

    def edit = {
        def loanAccountInstance = LoanAccount.get(params.id)
        if (!loanAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [loanAccountInstance: loanAccountInstance]
        }
    }

    def update = {
        def loanAccountInstance = LoanAccount.get(params.id)
        if (loanAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (loanAccountInstance.version > version) {
                    
                    loanAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'loanAccount.label', default: 'LoanAccount')] as Object[], "Another user has updated this LoanAccount while you were editing")
                    render(view: "edit", model: [loanAccountInstance: loanAccountInstance])
                    return
                }
            }
            loanAccountInstance.properties = params
            if (!loanAccountInstance.hasErrors() && loanAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), loanAccountInstance.id])}"
                redirect(action: "show", id: loanAccountInstance.id)
            }
            else {
                render(view: "edit", model: [loanAccountInstance: loanAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def loanAccountInstance = LoanAccount.get(params.id)
        if (loanAccountInstance) {
            try {
                loanAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loanAccount.label', default: 'LoanAccount'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def repaymentSchedule() {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def loanAccountInstance = LoanAccount.get(params.id)
		
		def  repaymentScheduleInstanceList = RepaymentSchedule.findAllByLoanAccount(loanAccountInstance)
		
        [ loanAccountInstance: loanAccountInstance, repaymentScheduleInstanceList: repaymentScheduleInstanceList ]
		
	}
	
	def approve() {
        def loanAccountInstance = LoanAccount.get(params.id)
		loanAccountInstance.status = Constants.STATUS_PENDING_DISBURSEMENT
		if (!loanAccountInstance.save(flush: true)) {
			loanAccountInstance.errors.allErrors.each { println it }
			flash.message = 'Error occured during approval'
			render(view:'show', model: [ loanAccountInstance: loanAccountInstance ])
		} else {
			flash.message = 'Loan account approved successfuly'
			render(view:'show', model: [ loanAccountInstance: loanAccountInstance ])
		}
	}

	def disburseList() {
		
		User user = User.get(springSecurityService.principal.id)
		
		def disburseList = LoanAccount.findAllByStatusAndBranch(Constants.STATUS_PENDING_DISBURSEMENT, user.branch)
		
		flash.message = disburseList? "${disburseList.size()} result(s) found." : "No results found."
		
		[ financialAccountInstanceList: disburseList ]
		
	}
	
	def disburseLoan() {
		
		def loanAccountInstance = LoanAccount.get(params.id)
		
		Response resp = accountService.disburseLoan(loanAccountInstance)
		
		flash.message = resp.message
		
		if (resp.isSuccess()) {
			render(view:'show', model: [ loanAccountInstance: loanAccountInstance ])
		} else {
			loanAccountInstance = (LoanAccount) resp.principal
			render(view:'show', model: [ loanAccountInstance: loanAccountInstance ])
			return
		}
		
	}
	
	def transactionHistory() {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def loanAccountInstance = LoanAccount.get(params.id)
		
		def  postingInstanceList = Posting.findAllByAccountNumber(loanAccountInstance.accountNumber)
		
		[ loanAccountInstance: loanAccountInstance, postingInstanceList: postingInstanceList, postingInstanceTotal: postingInstanceList?.size() ]
		
	}
	
	def applyPayment() {
		
		[ loanAccountInstance: LoanAccount.get(params.id) ]
		
	}
	
	def postPayment() {
		
		def loanAccountInstance = LoanAccount.get(params.id)
		
		Date transactionDate = params.transactionDate
		
		Response resp = accountService.postPayment(loanAccountInstance, transactionDate, 
														params.amount.toBigDecimal(), params.paymentType, params.receiptNo)
		
		flash.message = resp.message
		
		if (resp.isSuccess()) {
			redirect(action:'show', id: loanAccountInstance.id )
		} else {
			loanAccountInstance = (LoanAccount) resp.principal
			render(view:'applyPayment', model: [ loanAccountInstance: loanAccountInstance ])
			return
		}
						
	}
	
	def search() {
		
		def loanAccountList = LoanAccount.withCriteria {
			
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
			
		println loanAccountList?.size()
		
		if (loanAccountList) {
			flash.message = "${loanAccountList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[loanAccountInstanceList: loanAccountList, loanAccountInstanceTotal: loanAccountList?.size()]

	}
	
	
}
