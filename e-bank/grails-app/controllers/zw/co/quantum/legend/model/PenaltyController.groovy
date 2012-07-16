package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class PenaltyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [penaltyInstanceList: Penalty.list(params), penaltyInstanceTotal: Penalty.count()]
    }

    def create = {
        def penaltyInstance = new Penalty()
        penaltyInstance.properties = params
        return [penaltyInstance: penaltyInstance]
    }

    def save = {
        def penaltyInstance = new Penalty(params)
		
		penaltyInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		penaltyInstance.status = Constants.STATUS_ACTIVE
		
        if (penaltyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'penalty.label', default: 'Penalty'), penaltyInstance.id])}"
            redirect(action: "show", id: penaltyInstance.id)
        }
        else {
            render(view: "create", model: [penaltyInstance: penaltyInstance])
        }
    }

    def show = {
        def penaltyInstance = Penalty.get(params.id)
        if (!penaltyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
            redirect(action: "list")
        }
        else {
            [penaltyInstance: penaltyInstance]
        }
    }

    def edit = {
        def penaltyInstance = Penalty.get(params.id)
        if (!penaltyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [penaltyInstance: penaltyInstance]
        }
    }

    def update = {
        def penaltyInstance = Penalty.get(params.id)
        if (penaltyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (penaltyInstance.version > version) {
                    
                    penaltyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'penalty.label', default: 'Penalty')] as Object[], "Another user has updated this Penalty while you were editing")
                    render(view: "edit", model: [penaltyInstance: penaltyInstance])
                    return
                }
            }
            penaltyInstance.properties = params
            if (!penaltyInstance.hasErrors() && penaltyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'penalty.label', default: 'Penalty'), penaltyInstance.id])}"
                redirect(action: "show", id: penaltyInstance.id)
            }
            else {
                render(view: "edit", model: [penaltyInstance: penaltyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def penaltyInstance = Penalty.get(params.id)
        if (penaltyInstance) {
            try {
                penaltyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[penaltyInstanceList: Penalty.list(params), penaltyInstanceTotal: Penalty.count()]
	}

	def create_m = {
		def penaltyInstance = new Penalty()
		penaltyInstance.properties = params
		return [penaltyInstance: penaltyInstance]
	}

	def save_m = {
		def penaltyInstance = new Penalty(params)
		if (penaltyInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'penalty.label', default: 'Penalty'), penaltyInstance.id])}"
			redirect(action: "show_m", id: penaltyInstance.id)
		}
		else {
			render(view: "create_m", model: [penaltyInstance: penaltyInstance])
		}
	}

	def show_m = {
		def penaltyInstance = Penalty.get(params.id)
		if (!penaltyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[penaltyInstance: penaltyInstance]
		}
	}

	def edit_m = {
		def penaltyInstance = Penalty.get(params.id)
		if (!penaltyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [penaltyInstance: penaltyInstance]
		}
	}

	def update_m = {
		def penaltyInstance = Penalty.get(params.id)
		if (penaltyInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (penaltyInstance.version > version) {
					
					penaltyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'penalty.label', default: 'Penalty')] as Object[], "Another user has updated this Penalty while you were editing")
					render(view: "edit_m", model: [penaltyInstance: penaltyInstance])
					return
				}
			}
			penaltyInstance.properties = params
			if (!penaltyInstance.hasErrors() && penaltyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'penalty.label', default: 'Penalty'), penaltyInstance.id])}"
				redirect(action: "show_m", id: penaltyInstance.id)
			}
			else {
				render(view: "edit_m", model: [penaltyInstance: penaltyInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def penaltyInstance = Penalty.get(params.id)
		if (penaltyInstance) {
			try {
				penaltyInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'penalty.label', default: 'Penalty'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
