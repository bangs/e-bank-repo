package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class LatenessDormancyDefController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [latenessDormancyDefInstanceList: LatenessDormancyDef.list(params), latenessDormancyDefInstanceTotal: LatenessDormancyDef.count()]
    }

    def create = {
        def latenessDormancyDefInstance = new LatenessDormancyDef()
        latenessDormancyDefInstance.properties = params
        return [latenessDormancyDefInstance: latenessDormancyDefInstance]
    }

    def save = {
        def latenessDormancyDefInstance = new LatenessDormancyDef(params)
		
		latenessDormancyDefInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		latenessDormancyDefInstance.status = Constants.STATUS_ACTIVE
		
        if (latenessDormancyDefInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), latenessDormancyDefInstance.id])}"
            redirect(action: "show", id: latenessDormancyDefInstance.id)
        }
        else {
            render(view: "create", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
        }
    }

    def show = {
        def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
        if (!latenessDormancyDefInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
            redirect(action: "list")
        }
        else {
            [latenessDormancyDefInstance: latenessDormancyDefInstance]
        }
    }

    def edit = {
        def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
        if (!latenessDormancyDefInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [latenessDormancyDefInstance: latenessDormancyDefInstance]
        }
    }

    def update = {
        def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
        if (latenessDormancyDefInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (latenessDormancyDefInstance.version > version) {
                    
                    latenessDormancyDefInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')] as Object[], "Another user has updated this LatenessDormancyDef while you were editing")
                    render(view: "edit", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
                    return
                }
            }
            latenessDormancyDefInstance.properties = params
            if (!latenessDormancyDefInstance.hasErrors() && latenessDormancyDefInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), latenessDormancyDefInstance.id])}"
                redirect(action: "show", id: latenessDormancyDefInstance.id)
            }
            else {
                render(view: "edit", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
        if (latenessDormancyDefInstance) {
            try {
                latenessDormancyDefInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[latenessDormancyDefInstanceList: LatenessDormancyDef.list(params), latenessDormancyDefInstanceTotal: LatenessDormancyDef.count()]
	}

	def create_m = {
		def latenessDormancyDefInstance = new LatenessDormancyDef()
		latenessDormancyDefInstance.properties = params
		return [latenessDormancyDefInstance: latenessDormancyDefInstance]
	}

	def save_m = {
		def latenessDormancyDefInstance = new LatenessDormancyDef(params)
		if (latenessDormancyDefInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), latenessDormancyDefInstance.id])}"
			redirect(action: "show_m", id: latenessDormancyDefInstance.id)
		}
		else {
			render(view: "create_m", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
		}
	}

	def show_m = {
		def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
		if (!latenessDormancyDefInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[latenessDormancyDefInstance: latenessDormancyDefInstance]
		}
	}

	def edit_m = {
		def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
		if (!latenessDormancyDefInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [latenessDormancyDefInstance: latenessDormancyDefInstance]
		}
	}

	def update_m = {
		def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
		if (latenessDormancyDefInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (latenessDormancyDefInstance.version > version) {
					
					latenessDormancyDefInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')] as Object[], "Another user has updated this LatenessDormancyDef while you were editing")
					render(view: "edit_m", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
					return
				}
			}
			latenessDormancyDefInstance.properties = params
			if (!latenessDormancyDefInstance.hasErrors() && latenessDormancyDefInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), latenessDormancyDefInstance.id])}"
				redirect(action: "show_m", id: latenessDormancyDefInstance.id)
			}
			else {
				render(view: "edit_m", model: [latenessDormancyDefInstance: latenessDormancyDefInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def latenessDormancyDefInstance = LatenessDormancyDef.get(params.id)
		if (latenessDormancyDefInstance) {
			try {
				latenessDormancyDefInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
