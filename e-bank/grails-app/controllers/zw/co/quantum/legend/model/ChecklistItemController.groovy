package zw.co.quantum.legend.model

class ChecklistItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [checklistItemInstanceList: ChecklistItem.list(params), checklistItemInstanceTotal: ChecklistItem.count()]
    }

    def create = {
        def checklistItemInstance = new ChecklistItem()
        checklistItemInstance.properties = params
        return [checklistItemInstance: checklistItemInstance]
    }

    def save = {
        def checklistItemInstance = new ChecklistItem(params)
        if (checklistItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), checklistItemInstance.id])}"
            redirect(action: "show", id: checklistItemInstance.id)
        }
        else {
            render(view: "create", model: [checklistItemInstance: checklistItemInstance])
        }
    }

    def show = {
        def checklistItemInstance = ChecklistItem.get(params.id)
        if (!checklistItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [checklistItemInstance: checklistItemInstance]
        }
    }

    def edit = {
        def checklistItemInstance = ChecklistItem.get(params.id)
        if (!checklistItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [checklistItemInstance: checklistItemInstance]
        }
    }

    def update = {
        def checklistItemInstance = ChecklistItem.get(params.id)
        if (checklistItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (checklistItemInstance.version > version) {
                    
                    checklistItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'checklistItem.label', default: 'ChecklistItem')] as Object[], "Another user has updated this ChecklistItem while you were editing")
                    render(view: "edit", model: [checklistItemInstance: checklistItemInstance])
                    return
                }
            }
            checklistItemInstance.properties = params
            if (!checklistItemInstance.hasErrors() && checklistItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), checklistItemInstance.id])}"
                redirect(action: "show", id: checklistItemInstance.id)
            }
            else {
                render(view: "edit", model: [checklistItemInstance: checklistItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def checklistItemInstance = ChecklistItem.get(params.id)
        if (checklistItemInstance) {
            try {
                checklistItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[checklistItemInstanceList: ChecklistItem.list(params), checklistItemInstanceTotal: ChecklistItem.count()]
	}

	def create_m = {
		def checklistItemInstance = new ChecklistItem()
		checklistItemInstance.properties = params
		return [checklistItemInstance: checklistItemInstance]
	}

	def save_m = {
		def checklistItemInstance = new ChecklistItem(params)
		if (checklistItemInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), checklistItemInstance.id])}"
			redirect(action: "show_m", id: checklistItemInstance.id)
		}
		else {
			render(view: "create_m", model: [checklistItemInstance: checklistItemInstance])
		}
	}

	def show_m = {
		def checklistItemInstance = ChecklistItem.get(params.id)
		if (!checklistItemInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[checklistItemInstance: checklistItemInstance]
		}
	}

	def edit_m = {
		def checklistItemInstance = ChecklistItem.get(params.id)
		if (!checklistItemInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [checklistItemInstance: checklistItemInstance]
		}
	}

	def update_m = {
		def checklistItemInstance = ChecklistItem.get(params.id)
		if (checklistItemInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (checklistItemInstance.version > version) {
					
					checklistItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'checklistItem.label', default: 'ChecklistItem')] as Object[], "Another user has updated this ChecklistItem while you were editing")
					render(view: "edit_m", model: [checklistItemInstance: checklistItemInstance])
					return
				}
			}
			checklistItemInstance.properties = params
			if (!checklistItemInstance.hasErrors() && checklistItemInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), checklistItemInstance.id])}"
				redirect(action: "show_m", id: checklistItemInstance.id)
			}
			else {
				render(view: "edit_m", model: [checklistItemInstance: checklistItemInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def checklistItemInstance = ChecklistItem.get(params.id)
		if (checklistItemInstance) {
			try {
				checklistItemInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checklistItem.label', default: 'ChecklistItem'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
