package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;

class HolidayController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [holidayInstanceList: Holiday.list(params), holidayInstanceTotal: Holiday.count()]
    }

    def create = {
        def holidayInstance = new Holiday()
        holidayInstance.properties = params
        return [holidayInstance: holidayInstance]
    }

    def save = {
        def holidayInstance = new Holiday(params)
		
		holidayInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		
        if (holidayInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'holiday.label', default: 'Holiday'), holidayInstance.id])}"
            redirect(action: "show", id: holidayInstance.id)
        }
        else {
            render(view: "create", model: [holidayInstance: holidayInstance])
        }
    }

    def show = {
        def holidayInstance = Holiday.get(params.id)
        if (!holidayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
            redirect(action: "list")
        }
        else {
            [holidayInstance: holidayInstance]
        }
    }

    def edit = {
        def holidayInstance = Holiday.get(params.id)
        if (!holidayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [holidayInstance: holidayInstance]
        }
    }

    def update = {
        def holidayInstance = Holiday.get(params.id)
        if (holidayInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (holidayInstance.version > version) {
                    
                    holidayInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'holiday.label', default: 'Holiday')] as Object[], "Another user has updated this Holiday while you were editing")
                    render(view: "edit", model: [holidayInstance: holidayInstance])
                    return
                }
            }
            holidayInstance.properties = params
            if (!holidayInstance.hasErrors() && holidayInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'holiday.label', default: 'Holiday'), holidayInstance.id])}"
                redirect(action: "show", id: holidayInstance.id)
            }
            else {
                render(view: "edit", model: [holidayInstance: holidayInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def holidayInstance = Holiday.get(params.id)
        if (holidayInstance) {
            try {
                holidayInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[holidayInstanceList: Holiday.list(params), holidayInstanceTotal: Holiday.count()]
	}

	def create_m = {
		def holidayInstance = new Holiday()
		holidayInstance.properties = params
		return [holidayInstance: holidayInstance]
	}

	def save_m = {
		def holidayInstance = new Holiday(params)
		if (holidayInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'holiday.label', default: 'Holiday'), holidayInstance.id])}"
			redirect(action: "show_m", id: holidayInstance.id)
		}
		else {
			render(view: "create_m", model: [holidayInstance: holidayInstance])
		}
	}

	def show_m = {
		def holidayInstance = Holiday.get(params.id)
		if (!holidayInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[holidayInstance: holidayInstance]
		}
	}

	def edit_m = {
		def holidayInstance = Holiday.get(params.id)
		if (!holidayInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [holidayInstance: holidayInstance]
		}
	}

	def update_m = {
		def holidayInstance = Holiday.get(params.id)
		if (holidayInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (holidayInstance.version > version) {
					
					holidayInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'holiday.label', default: 'Holiday')] as Object[], "Another user has updated this Holiday while you were editing")
					render(view: "edit_m", model: [holidayInstance: holidayInstance])
					return
				}
			}
			holidayInstance.properties = params
			if (!holidayInstance.hasErrors() && holidayInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'holiday.label', default: 'Holiday'), holidayInstance.id])}"
				redirect(action: "show_m", id: holidayInstance.id)
			}
			else {
				render(view: "edit_m", model: [holidayInstance: holidayInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def holidayInstance = Holiday.get(params.id)
		if (holidayInstance) {
			try {
				holidayInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'holiday.label', default: 'Holiday'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
