package zw.co.quantum.legend.model

import zw.co.quantum.legend.util.*;
import zw.co.quantum.legend.util.DateUtil;

class IndividualClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def clientService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [individualClientInstanceList: IndividualClient.list(params), individualClientInstanceTotal: IndividualClient.count()]
    }

    def create = {
        def individualClientInstance = new IndividualClient()
        individualClientInstance.properties = params
        return [individualClientInstance: individualClientInstance]
    }

    def save = {
		
        def individualClientInstance = new IndividualClient(params)
				
		individualClientInstance = (IndividualClient) clientService.populateAddresses(individualClientInstance, params)
		
		Response resp = clientService.registerClient(individualClientInstance)
				
		flash.message = resp.message
		
        if (resp.isSuccess()) {
            redirect(action: "show", id: individualClientInstance.id)
        }
        else {
			individualClientInstance = (IndividualClient) resp.principal
            render(view: "create", model: [individualClientInstance: individualClientInstance])
        }
    }

    def show = {
        def individualClientInstance = IndividualClient.get(params.id)
        if (!individualClientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
            redirect(action: "list")
        }
        else {
            [individualClientInstance: individualClientInstance]
        }
    }

    def edit = {
        def individualClientInstance = IndividualClient.get(params.id)
        if (!individualClientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [individualClientInstance: individualClientInstance]
        }
    }

    def update = {
        def individualClientInstance = IndividualClient.get(params.id)
        if (individualClientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (individualClientInstance.version > version) {
                    
                    individualClientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'individualClient.label', default: 'IndividualClient')] as Object[], "Another user has updated this IndividualClient while you were editing")
                    render(view: "edit", model: [individualClientInstance: individualClientInstance])
                    return
                }
            }
            individualClientInstance.properties = params
            if (!individualClientInstance.hasErrors() && individualClientInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), individualClientInstance.id])}"
                redirect(action: "show", id: individualClientInstance.id)
            }
            else {
                render(view: "edit", model: [individualClientInstance: individualClientInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def individualClientInstance = IndividualClient.get(params.id)
        if (individualClientInstance) {
            try {
                individualClientInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'individualClient.label', default: 'IndividualClient'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def addAccount() {
				
		def individualClient = IndividualClient.findByClientNo(params.id)
		
		session.clientNo = individualClient.clientNo
		session.clientType = individualClient.type
		session.clientName = "${individualClient.lastName} ${individualClient.firstName}"
		
		redirect(controller:'financialAccount', action:'create')
		
	}
	
	def search() {
		
		def individualClientList = IndividualClient.withCriteria {
			
			if (params.'branch.id') {
				eq('branch.id', params.'branch.id'.toLong())
			}
			if (params.type) {
				eq('type', 'INDIVIDUAL')
			}
			if (params.lastName) {
				ilike('lastName', "%${params.lastName}%")
			}
			if (params.firstName) {
				ilike('firstName', "%${params.firstName}%")
			}
		}
			
		println individualClientList?.size()
		
		if (individualClientList) {
			flash.message = "${individualClientList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
			
		render template:"listbody", model:[individualClientInstanceList: individualClientList, individualClientInstanceTotal: individualClientList?.size()]

	}
	

}
