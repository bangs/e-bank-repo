package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class FeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [feeInstanceList: Fee.list(params), feeInstanceTotal: Fee.count()]
    }

    def create = {
        def feeInstance = new Fee()
        feeInstance.properties = params
        return [feeInstance: feeInstance]
    }

    def save = {
        def feeInstance = new Fee(params)
		
		feeInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		feeInstance.status = Constants.STATUS_ACTIVE
		
        if (feeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fee.label', default: 'Fee'), feeInstance.id])}"
            redirect(action: "show", id: feeInstance.id)
        }
        else {
            render(view: "create", model: [feeInstance: feeInstance])
        }
    }

    def show = {
        def feeInstance = Fee.get(params.id)
        if (!feeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
            redirect(action: "list")
        }
        else {
            [feeInstance: feeInstance]
        }
    }

    def edit = {
        def feeInstance = Fee.get(params.id)
        if (!feeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [feeInstance: feeInstance]
        }
    }

    def update = {
        def feeInstance = Fee.get(params.id)
        if (feeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (feeInstance.version > version) {
                    
                    feeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fee.label', default: 'Fee')] as Object[], "Another user has updated this Fee while you were editing")
                    render(view: "edit", model: [feeInstance: feeInstance])
                    return
                }
            }
            feeInstance.properties = params
            if (!feeInstance.hasErrors() && feeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fee.label', default: 'Fee'), feeInstance.id])}"
                redirect(action: "show", id: feeInstance.id)
            }
            else {
                render(view: "edit", model: [feeInstance: feeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def feeInstance = Fee.get(params.id)
        if (feeInstance) {
            try {
                feeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[feeInstanceList: Fee.list(params), feeInstanceTotal: Fee.count()]
	}

	def create_m = {
		def feeInstance = new Fee()
		feeInstance.properties = params
		return [feeInstance: feeInstance]
	}

	def save_m = {
		def feeInstance = new Fee(params)
		if (feeInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'fee.label', default: 'Fee'), feeInstance.id])}"
			redirect(action: "show_m", id: feeInstance.id)
		}
		else {
			render(view: "create_m", model: [feeInstance: feeInstance])
		}
	}

	def show_m = {
		def feeInstance = Fee.get(params.id)
		if (!feeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[feeInstance: feeInstance]
		}
	}

	def edit_m = {
		def feeInstance = Fee.get(params.id)
		if (!feeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [feeInstance: feeInstance]
		}
	}

	def update_m = {
		def feeInstance = Fee.get(params.id)
		if (feeInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (feeInstance.version > version) {
					
					feeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fee.label', default: 'Fee')] as Object[], "Another user has updated this Fee while you were editing")
					render(view: "edit_m", model: [feeInstance: feeInstance])
					return
				}
			}
			feeInstance.properties = params
			if (!feeInstance.hasErrors() && feeInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fee.label', default: 'Fee'), feeInstance.id])}"
				redirect(action: "show_m", id: feeInstance.id)
			}
			else {
				render(view: "edit_m", model: [feeInstance: feeInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def feeInstance = Fee.get(params.id)
		if (feeInstance) {
			try {
				feeInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fee.label', default: 'Fee'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
