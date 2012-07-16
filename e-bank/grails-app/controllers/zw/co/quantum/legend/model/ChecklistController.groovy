package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class ChecklistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = { 
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [checklistInstanceList: Checklist.list(params), checklistInstanceTotal: Checklist.count()]
    }

    def create = {
        def checklistInstance = new Checklist()
        checklistInstance.properties = params
        return [checklistInstance: checklistInstance]
    }

    def save = {
        def checklistInstance = new Checklist(params)
		
		checklistInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		checklistInstance.status = Constants.STATUS_ACTIVE
		
        if (checklistInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'checklist.label', default: 'Checklist'), checklistInstance.id])}"
            redirect(action: "show", id: checklistInstance.id)
        }
        else {
            render(view: "create", model: [checklistInstance: checklistInstance])
        }
    }

    def show = {
        def checklistInstance = Checklist.get(params.id)
        if (!checklistInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
            redirect(action: "list")
        }
        else {
            [checklistInstance: checklistInstance]
        }
    }

    def edit = {
        def checklistInstance = Checklist.get(params.id)
        if (!checklistInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [checklistInstance: checklistInstance]
        }
    }

    def update = {
        def checklistInstance = Checklist.get(params.id)
        if (checklistInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (checklistInstance.version > version) {
                    
                    checklistInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'checklist.label', default: 'Checklist')] as Object[], "Another user has updated this Checklist while you were editing")
                    render(view: "edit", model: [checklistInstance: checklistInstance])
                    return
                }
            }
            checklistInstance.properties = params
            if (!checklistInstance.hasErrors() && checklistInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'checklist.label', default: 'Checklist'), checklistInstance.id])}"
                redirect(action: "show", id: checklistInstance.id)
            }
            else {
                render(view: "edit", model: [checklistInstance: checklistInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def checklistInstance = Checklist.get(params.id)
        if (checklistInstance) {
            try {
                checklistInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[checklistInstanceList: Checklist.list(params), checklistInstanceTotal: Checklist.count()]
	}

	def create_m = {
		def checklistInstance = new Checklist()
		checklistInstance.properties = params
		return [checklistInstance: checklistInstance]
	}

	def save_m = {
		def checklistInstance = new Checklist(params)
		if (checklistInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'checklist.label', default: 'Checklist'), checklistInstance.id])}"
			redirect(action: "show_m", id: checklistInstance.id)
		}
		else {
			render(view: "create_m", model: [checklistInstance: checklistInstance])
		}
	}

	def show_m = {
		def checklistInstance = Checklist.get(params.id)
		if (!checklistInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[checklistInstance: checklistInstance]
		}
	}

	def edit_m = {
		def checklistInstance = Checklist.get(params.id)
		if (!checklistInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [checklistInstance: checklistInstance]
		}
	}

	def update_m = {
		def checklistInstance = Checklist.get(params.id)
		if (checklistInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (checklistInstance.version > version) {
					
					checklistInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'checklist.label', default: 'Checklist')] as Object[], "Another user has updated this Checklist while you were editing")
					render(view: "edit_m", model: [checklistInstance: checklistInstance])
					return
				}
			}
			checklistInstance.properties = params
			if (!checklistInstance.hasErrors() && checklistInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'checklist.label', default: 'Checklist'), checklistInstance.id])}"
				redirect(action: "show_m", id: checklistInstance.id)
			}
			else {
				render(view: "edit_m", model: [checklistInstance: checklistInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def checklistInstance = Checklist.get(params.id)
		if (checklistInstance) {
			try {
				checklistInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklist.label', default: 'Checklist'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
