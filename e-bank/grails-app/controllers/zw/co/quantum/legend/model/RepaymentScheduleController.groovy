package zw.co.quantum.legend.model

class RepaymentScheduleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [repaymentScheduleInstanceList: RepaymentSchedule.list(params), repaymentScheduleInstanceTotal: RepaymentSchedule.count()]
    }

    def create = {
        def repaymentScheduleInstance = new RepaymentSchedule()
        repaymentScheduleInstance.properties = params
        return [repaymentScheduleInstance: repaymentScheduleInstance]
    }

    def save = {
        def repaymentScheduleInstance = new RepaymentSchedule(params)
        if (repaymentScheduleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), repaymentScheduleInstance.id])}"
            redirect(action: "show", id: repaymentScheduleInstance.id)
        }
        else {
            render(view: "create", model: [repaymentScheduleInstance: repaymentScheduleInstance])
        }
    }

    def show = {
        def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
        if (!repaymentScheduleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [repaymentScheduleInstance: repaymentScheduleInstance]
        }
    }

    def edit = {
        def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
        if (!repaymentScheduleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [repaymentScheduleInstance: repaymentScheduleInstance]
        }
    }

    def update = {
        def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
        if (repaymentScheduleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (repaymentScheduleInstance.version > version) {
                    
                    repaymentScheduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')] as Object[], "Another user has updated this RepaymentSchedule while you were editing")
                    render(view: "edit", model: [repaymentScheduleInstance: repaymentScheduleInstance])
                    return
                }
            }
            repaymentScheduleInstance.properties = params
            if (!repaymentScheduleInstance.hasErrors() && repaymentScheduleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), repaymentScheduleInstance.id])}"
                redirect(action: "show", id: repaymentScheduleInstance.id)
            }
            else {
                render(view: "edit", model: [repaymentScheduleInstance: repaymentScheduleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
        if (repaymentScheduleInstance) {
            try {
                repaymentScheduleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[repaymentScheduleInstanceList: RepaymentSchedule.list(params), repaymentScheduleInstanceTotal: RepaymentSchedule.count()]
	}

	def create_m = {
		def repaymentScheduleInstance = new RepaymentSchedule()
		repaymentScheduleInstance.properties = params
		return [repaymentScheduleInstance: repaymentScheduleInstance]
	}

	def save_m = {
		def repaymentScheduleInstance = new RepaymentSchedule(params)
		if (repaymentScheduleInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), repaymentScheduleInstance.id])}"
			redirect(action: "show_m", id: repaymentScheduleInstance.id)
		}
		else {
			render(view: "create_m", model: [repaymentScheduleInstance: repaymentScheduleInstance])
		}
	}

	def show_m = {
		def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
		if (!repaymentScheduleInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[repaymentScheduleInstance: repaymentScheduleInstance]
		}
	}

	def edit_m = {
		def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
		if (!repaymentScheduleInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [repaymentScheduleInstance: repaymentScheduleInstance]
		}
	}

	def update_m = {
		def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
		if (repaymentScheduleInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (repaymentScheduleInstance.version > version) {
					
					repaymentScheduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')] as Object[], "Another user has updated this RepaymentSchedule while you were editing")
					render(view: "edit_m", model: [repaymentScheduleInstance: repaymentScheduleInstance])
					return
				}
			}
			repaymentScheduleInstance.properties = params
			if (!repaymentScheduleInstance.hasErrors() && repaymentScheduleInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), repaymentScheduleInstance.id])}"
				redirect(action: "show_m", id: repaymentScheduleInstance.id)
			}
			else {
				render(view: "edit_m", model: [repaymentScheduleInstance: repaymentScheduleInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def repaymentScheduleInstance = RepaymentSchedule.get(params.id)
		if (repaymentScheduleInstance) {
			try {
				repaymentScheduleInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
