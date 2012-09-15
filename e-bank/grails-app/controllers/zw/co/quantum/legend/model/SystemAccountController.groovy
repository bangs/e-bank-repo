package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.Response;

class SystemAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def accountService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [systemAccountInstanceList: SystemAccount.list(params), systemAccountInstanceTotal: SystemAccount.count()]
    }

    def create = {
        def systemAccountInstance = new SystemAccount()
        systemAccountInstance.properties = params
        return [systemAccountInstance: systemAccountInstance]
    }

    def save = {
        def systemAccountInstance = new SystemAccount(params)
		
		def ownerType = params.ownerType
		def owner, ownerClass
		
		if ('INSTITUTION'.equals(ownerType)) {
			owner = Institution.get(params.'institution.id')
		} else if ('BRANCH'.equals(ownerType)){
			owner = Branch.get(params.'branch.id')
		} else {
			flash.message = 'Unrecognised owner type'
			render(view: "create", model: [systemAccountInstance: systemAccountInstance])
			return
		}
		
		ownerClass = owner.class.simpleName.toUpperCase()
		
		systemAccountInstance.ownerId = owner.id
		systemAccountInstance.ownerType = ownerClass
		systemAccountInstance.ownerClass = ownerClass
		systemAccountInstance.accountName = owner.toString()
		
		Response resp = accountService.registerAccount(systemAccountInstance)
		
       flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: systemAccountInstance.id)
        }
        else {
			systemAccountInstance = (SystemAccount) resp.principal
            render(view: "create", model: [systemAccountInstance: systemAccountInstance])
			return
        }
    }

    def show = {
        def systemAccountInstance = SystemAccount.get(params.id)
        if (!systemAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [systemAccountInstance: systemAccountInstance]
        }
    }

    def edit = {
        def systemAccountInstance = SystemAccount.get(params.id)
        if (!systemAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [systemAccountInstance: systemAccountInstance]
        }
    }

    def update = {
        def systemAccountInstance = SystemAccount.get(params.id)
        if (systemAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (systemAccountInstance.version > version) {
                    
                    systemAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'systemAccount.label', default: 'SystemAccount')] as Object[], "Another user has updated this SystemAccount while you were editing")
                    render(view: "edit", model: [systemAccountInstance: systemAccountInstance])
                    return
                }
            }
            systemAccountInstance.properties = params
            if (!systemAccountInstance.hasErrors() && systemAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), systemAccountInstance.id])}"
                redirect(action: "show", id: systemAccountInstance.id)
            }
            else {
                render(view: "edit", model: [systemAccountInstance: systemAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def systemAccountInstance = SystemAccount.get(params.id)
        if (systemAccountInstance) {
            try {
                systemAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemAccount.label', default: 'SystemAccount'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def processOwnerTypeValueChange() {
		
		def value = params.ownerType
		
		def template = "/home/blank"
		
		if ('INSTITUTION'.equals(value)) {
			
			template = '/institution/institution_select'
			
		} else if ('BRANCH'.equals(value)) {
		
			template = '/branch/branch_select'
		
		}

		render template: template, model: [:]
		
	}
	
	def search() {
		
		def systemAccountList = SystemAccount.withCriteria {
			
			if (params.'branch.id') {
				eq('branch.id', params.'branch.id'.toLong())
			}
			if (params.type) {
				eq('type', params.type)
			}
			if (params.accountNumber) {
				eq('accountNumber', params.accountNumber)
			}
		}
			
		println systemAccountList?.size()
		
		if (systemAccountList) {
			flash.message = "${systemAccountList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[systemAccountInstanceList: systemAccountList, systemAccountInstanceTotal: systemAccountList?.size()]

	}
}
