package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.Response;

class ClientGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def clientService 
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clientGroupInstanceList: ClientGroup.list(params), clientGroupInstanceTotal: ClientGroup.count()]
    }

    def create = {
        def clientGroupInstance = new ClientGroup()
        clientGroupInstance.properties = params
        return [clientGroupInstance: clientGroupInstance]
    }

    def save = {
		
        def clientGroupInstance = new ClientGroup(params)
		
		clientGroupInstance = (ClientGroup) clientService.populateAddresses(clientGroupInstance, params)
		
		Response resp = clientService.registerClient(clientGroupInstance)
				
		flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: clientGroupInstance.id)
        }
        else {
			clientGroupInstance = (ClientGroup) resp.principal
            render(view: "create", model: [clientGroupInstance: clientGroupInstance])
        }
    }

    def show = {
        def clientGroupInstance = ClientGroup.get(params.id)
        if (!clientGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [clientGroupInstance: clientGroupInstance]
        }
    }

    def edit = {
        def clientGroupInstance = ClientGroup.get(params.id)
        if (!clientGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [clientGroupInstance: clientGroupInstance]
        }
    }

    def update = {
        def clientGroupInstance = ClientGroup.get(params.id)
        if (clientGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientGroupInstance.version > version) {
                    
                    clientGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clientGroup.label', default: 'ClientGroup')] as Object[], "Another user has updated this ClientGroup while you were editing")
                    render(view: "edit", model: [clientGroupInstance: clientGroupInstance])
                    return
                }
            }
            clientGroupInstance.properties = params
            if (!clientGroupInstance.hasErrors() && clientGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), clientGroupInstance.id])}"
                redirect(action: "show", id: clientGroupInstance.id)
            }
            else {
                render(view: "edit", model: [clientGroupInstance: clientGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clientGroupInstance = ClientGroup.get(params.id)
        if (clientGroupInstance) {
            try {
                clientGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[clientGroupInstanceList: ClientGroup.list(params), clientGroupInstanceTotal: ClientGroup.count()]
	}

	def create_m = {
		def clientGroupInstance = new ClientGroup()
		clientGroupInstance.properties = params
		return [clientGroupInstance: clientGroupInstance]
	}

	def save_m = {
		def clientGroupInstance = new ClientGroup(params)
		if (clientGroupInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), clientGroupInstance.id])}"
			redirect(action: "show_m", id: clientGroupInstance.id)
		}
		else {
			render(view: "create_m", model: [clientGroupInstance: clientGroupInstance])
		}
	}

	def show_m = {
		def clientGroupInstance = ClientGroup.get(params.id)
		if (!clientGroupInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[clientGroupInstance: clientGroupInstance]
		}
	}

	def edit_m = {
		def clientGroupInstance = ClientGroup.get(params.id)
		if (!clientGroupInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [clientGroupInstance: clientGroupInstance]
		}
	}

	def update_m = {
		def clientGroupInstance = ClientGroup.get(params.id)
		if (clientGroupInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (clientGroupInstance.version > version) {
					
					clientGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clientGroup.label', default: 'ClientGroup')] as Object[], "Another user has updated this ClientGroup while you were editing")
					render(view: "edit_m", model: [clientGroupInstance: clientGroupInstance])
					return
				}
			}
			clientGroupInstance.properties = params
			if (!clientGroupInstance.hasErrors() && clientGroupInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), clientGroupInstance.id])}"
				redirect(action: "show_m", id: clientGroupInstance.id)
			}
			else {
				render(view: "edit_m", model: [clientGroupInstance: clientGroupInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def clientGroupInstance = ClientGroup.get(params.id)
		if (clientGroupInstance) {
			try {
				clientGroupInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientGroup.label', default: 'ClientGroup'), params.id])}"
			redirect(action: "list_m")
		}
	}

	
	def addAccount() {
		
		def clientGroup = ClientGroup.findByClientNo(params.id)
		
		session.clientNo = clientGroup.clientNo
		session.clientType = clientGroup.type
		session.clientName = "${clientGroup.name}"
		
		redirect(controller:'financialAccount', action:'create')
		
	}

}
