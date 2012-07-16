package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class GLCodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [GLCodeInstanceList: GLCode.list(params), GLCodeInstanceTotal: GLCode.count()]
    }

    def create = {
        def GLCodeInstance = new GLCode()
        GLCodeInstance.properties = params
        return [GLCodeInstance: GLCodeInstance]
    }

    def save = {
        def GLCodeInstance = new GLCode(params)
		
		GLCodeInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		GLCodeInstance.status = Constants.STATUS_ACTIVE
		
        if (GLCodeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'GLCode.label', default: 'GLCode'), GLCodeInstance.id])}"
            redirect(action: "show", id: GLCodeInstance.id)
        }
        else {
            render(view: "create", model: [GLCodeInstance: GLCodeInstance])
        }
    }

    def show = {
        def GLCodeInstance = GLCode.get(params.id)
        if (!GLCodeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
            redirect(action: "list")
        }
        else {
            [GLCodeInstance: GLCodeInstance]
        }
    }

    def edit = {
        def GLCodeInstance = GLCode.get(params.id)
        if (!GLCodeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [GLCodeInstance: GLCodeInstance]
        }
    }

    def update = {
        def GLCodeInstance = GLCode.get(params.id)
        if (GLCodeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (GLCodeInstance.version > version) {
                    
                    GLCodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'GLCode.label', default: 'GLCode')] as Object[], "Another user has updated this GLCode while you were editing")
                    render(view: "edit", model: [GLCodeInstance: GLCodeInstance])
                    return
                }
            }
            GLCodeInstance.properties = params
            if (!GLCodeInstance.hasErrors() && GLCodeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'GLCode.label', default: 'GLCode'), GLCodeInstance.id])}"
                redirect(action: "show", id: GLCodeInstance.id)
            }
            else {
                render(view: "edit", model: [GLCodeInstance: GLCodeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def GLCodeInstance = GLCode.get(params.id)
        if (GLCodeInstance) {
            try {
                GLCodeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[GLCodeInstanceList: GLCode.list(params), GLCodeInstanceTotal: GLCode.count()]
	}

	def create_m = {
		def GLCodeInstance = new GLCode()
		GLCodeInstance.properties = params
		return [GLCodeInstance: GLCodeInstance]
	}

	def save_m = {
		def GLCodeInstance = new GLCode(params)
		if (GLCodeInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'GLCode.label', default: 'GLCode'), GLCodeInstance.id])}"
			redirect(action: "show_m", id: GLCodeInstance.id)
		}
		else {
			render(view: "create_m", model: [GLCodeInstance: GLCodeInstance])
		}
	}

	def show_m = {
		def GLCodeInstance = GLCode.get(params.id)
		if (!GLCodeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[GLCodeInstance: GLCodeInstance]
		}
	}

	def edit_m = {
		def GLCodeInstance = GLCode.get(params.id)
		if (!GLCodeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [GLCodeInstance: GLCodeInstance]
		}
	}

	def update_m = {
		def GLCodeInstance = GLCode.get(params.id)
		if (GLCodeInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (GLCodeInstance.version > version) {
					
					GLCodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'GLCode.label', default: 'GLCode')] as Object[], "Another user has updated this GLCode while you were editing")
					render(view: "edit_m", model: [GLCodeInstance: GLCodeInstance])
					return
				}
			}
			GLCodeInstance.properties = params
			if (!GLCodeInstance.hasErrors() && GLCodeInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'GLCode.label', default: 'GLCode'), GLCodeInstance.id])}"
				redirect(action: "show_m", id: GLCodeInstance.id)
			}
			else {
				render(view: "edit_m", model: [GLCodeInstance: GLCodeInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def GLCodeInstance = GLCode.get(params.id)
		if (GLCodeInstance) {
			try {
				GLCodeInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'GLCode.label', default: 'GLCode'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
