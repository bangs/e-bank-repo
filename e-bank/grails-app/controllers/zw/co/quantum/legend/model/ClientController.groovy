package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.Constants;

class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clientInstanceList: Client.list(params), clientInstanceTotal: Client.count()]
    }

    def show = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
        else {
            [clientInstance: clientInstance]
        }
    }
	
	def create = {
		redirect(action: "register", params: params)
	}

    def edit = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [clientInstance: clientInstance]
        }
    }

    def update = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientInstance.version > version) {
                    
                    clientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'client.label', default: 'Client')] as Object[], "Another user has updated this Client while you were editing")
                    render(view: "edit", model: [clientInstance: clientInstance])
                    return
                }
            }
            clientInstance.properties = params
            if (!clientInstance.hasErrors() && clientInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])}"
                redirect(action: "show", id: clientInstance.id)
            }
            else {
                render(view: "edit", model: [clientInstance: clientInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            try {
                clientInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[clientInstanceList: Client.list(params), clientInstanceTotal: Client.count()]
	}

	def register() { }
	
	def next() {
		
		def clientType = params.type
		
		if (!clientType) {			
			flash.message = "Please select the client type then click next."
			redirect(action: "register")
			return
		}
		
		def controllerValue, actionValue = 'create'
				
		switch(clientType) {
			case Constants.CLIENT_TYPE_INDIVIDUAL : controllerValue = 'individualClient'; break
			case Constants.CLIENT_TYPE_GROUP : controllerValue = 'clientGroup'; break
			case Constants.CLIENT_TYPE_CORPORATE : controllerValue = 'corporateClient'; break
			default: controllerValue = 'client'; actionValue = 'register'; break
		}
		
		println ("############# Controller: ${controllerValue} Action: ${actionValue}")
		
		redirect(controller: controllerValue, action: actionValue)
		
	}
	
}
