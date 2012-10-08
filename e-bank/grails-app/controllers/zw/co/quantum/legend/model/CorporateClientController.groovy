package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.Response;

class CorporateClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def clientService 
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [corporateClientInstanceList: CorporateClient.list(params), corporateClientInstanceTotal: CorporateClient.count()]
    }

    def create = {
        def corporateClientInstance = new CorporateClient()
        corporateClientInstance.properties = params
        return [corporateClientInstance: corporateClientInstance]
    }

    def save = {
        def corporateClientInstance = new CorporateClient(params)
		
        corporateClientInstance = (CorporateClient) clientService.populateAddresses(corporateClientInstance, params)
		
		Response resp = clientService.registerClient(corporateClientInstance)
				
		flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: corporateClientInstance.id)
        }
        else {
			corporateClientInstance = (CorporateClient) resp.principal
            render(view: "create", model: [corporateClientInstance: corporateClientInstance])
        }
    }

    def show = {
        def corporateClientInstance = CorporateClient.get(params.id)
        if (!corporateClientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
            redirect(action: "list")
        }
        else {
            [corporateClientInstance: corporateClientInstance]
        }
    }

    def edit = {
        def corporateClientInstance = CorporateClient.get(params.id)
        if (!corporateClientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [corporateClientInstance: corporateClientInstance]
        }
    }

    def update = {
        def corporateClientInstance = CorporateClient.get(params.id)
        if (corporateClientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (corporateClientInstance.version > version) {
                    
                    corporateClientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'corporateClient.label', default: 'CorporateClient')] as Object[], "Another user has updated this CorporateClient while you were editing")
                    render(view: "edit", model: [corporateClientInstance: corporateClientInstance])
                    return
                }
            }
            corporateClientInstance.properties = params
            if (!corporateClientInstance.hasErrors() && corporateClientInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), corporateClientInstance.id])}"
                redirect(action: "show", id: corporateClientInstance.id)
            }
            else {
                render(view: "edit", model: [corporateClientInstance: corporateClientInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def corporateClientInstance = CorporateClient.get(params.id)
        if (corporateClientInstance) {
            try {
                corporateClientInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[corporateClientInstanceList: CorporateClient.list(params), corporateClientInstanceTotal: CorporateClient.count()]
	}

	def create_m = {
		def corporateClientInstance = new CorporateClient()
		corporateClientInstance.properties = params
		return [corporateClientInstance: corporateClientInstance]
	}

	def save_m = {
		def corporateClientInstance = new CorporateClient(params)
		if (corporateClientInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), corporateClientInstance.id])}"
			redirect(action: "show_m", id: corporateClientInstance.id)
		}
		else {
			render(view: "create_m", model: [corporateClientInstance: corporateClientInstance])
		}
	}

	def show_m = {
		def corporateClientInstance = CorporateClient.get(params.id)
		if (!corporateClientInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[corporateClientInstance: corporateClientInstance]
		}
	}

	def edit_m = {
		def corporateClientInstance = CorporateClient.get(params.id)
		if (!corporateClientInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [corporateClientInstance: corporateClientInstance]
		}
	}

	def update_m = {
		def corporateClientInstance = CorporateClient.get(params.id)
		if (corporateClientInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (corporateClientInstance.version > version) {
					
					corporateClientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'corporateClient.label', default: 'CorporateClient')] as Object[], "Another user has updated this CorporateClient while you were editing")
					render(view: "edit_m", model: [corporateClientInstance: corporateClientInstance])
					return
				}
			}
			corporateClientInstance.properties = params
			if (!corporateClientInstance.hasErrors() && corporateClientInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), corporateClientInstance.id])}"
				redirect(action: "show_m", id: corporateClientInstance.id)
			}
			else {
				render(view: "edit_m", model: [corporateClientInstance: corporateClientInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def corporateClientInstance = CorporateClient.get(params.id)
		if (corporateClientInstance) {
			try {
				corporateClientInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corporateClient.label', default: 'CorporateClient'), params.id])}"
			redirect(action: "list_m")
		}
	}
	
	def addAccount() {
		
		def corporateClient = CorporateClient.findByClientNo(params.id)
		
		session.clientNo = corporateClient.clientNo
		session.clientType = corporateClient.type
		session.clientName = "${corporateClient.name}"
		
		redirect(controller:'financialAccount', action:'create')
		
	}
	
	def search() {
		
		def corporateClientList = CorporateClient.withCriteria {
			
			if (params.'branch.id') {
				eq('branch.id', params.'branch.id'.toLong())
			}
			if (params.type) {
				eq('type', 'CORPORATE')
			}
			if (params.name) {
				ilike('name', "%${params.name}%")
			}
		}
			
		println corporateClientList?.size()
		
		if (corporateClientList) {
			flash.message = "${corporateClientList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[corporateClientInstanceList: corporateClientList, corporateClientInstanceTotal: corporateClientList?.size()]

	}
	

}
