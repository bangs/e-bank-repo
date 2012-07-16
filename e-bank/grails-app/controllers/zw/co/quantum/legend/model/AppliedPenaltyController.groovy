package zw.co.quantum.legend.model

class AppliedPenaltyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [appliedPenaltyInstanceList: AppliedPenalty.list(params), appliedPenaltyInstanceTotal: AppliedPenalty.count()]
    }

    def create = {
        def appliedPenaltyInstance = new AppliedPenalty()
        appliedPenaltyInstance.properties = params
        return [appliedPenaltyInstance: appliedPenaltyInstance]
    }

    def save = {
        def appliedPenaltyInstance = new AppliedPenalty(params)
        if (appliedPenaltyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), appliedPenaltyInstance.id])}"
            redirect(action: "show", id: appliedPenaltyInstance.id)
        }
        else {
            render(view: "create", model: [appliedPenaltyInstance: appliedPenaltyInstance])
        }
    }

    def show = {
        def appliedPenaltyInstance = AppliedPenalty.get(params.id)
        if (!appliedPenaltyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
            redirect(action: "list")
        }
        else {
            [appliedPenaltyInstance: appliedPenaltyInstance]
        }
    }

    def edit = {
        def appliedPenaltyInstance = AppliedPenalty.get(params.id)
        if (!appliedPenaltyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [appliedPenaltyInstance: appliedPenaltyInstance]
        }
    }

    def update = {
        def appliedPenaltyInstance = AppliedPenalty.get(params.id)
        if (appliedPenaltyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (appliedPenaltyInstance.version > version) {
                    
                    appliedPenaltyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appliedPenalty.label', default: 'AppliedPenalty')] as Object[], "Another user has updated this AppliedPenalty while you were editing")
                    render(view: "edit", model: [appliedPenaltyInstance: appliedPenaltyInstance])
                    return
                }
            }
            appliedPenaltyInstance.properties = params
            if (!appliedPenaltyInstance.hasErrors() && appliedPenaltyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), appliedPenaltyInstance.id])}"
                redirect(action: "show", id: appliedPenaltyInstance.id)
            }
            else {
                render(view: "edit", model: [appliedPenaltyInstance: appliedPenaltyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def appliedPenaltyInstance = AppliedPenalty.get(params.id)
        if (appliedPenaltyInstance) {
            try {
                appliedPenaltyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[appliedPenaltyInstanceList: AppliedPenalty.list(params), appliedPenaltyInstanceTotal: AppliedPenalty.count()]
	}

	def create_m = {
		def appliedPenaltyInstance = new AppliedPenalty()
		appliedPenaltyInstance.properties = params
		return [appliedPenaltyInstance: appliedPenaltyInstance]
	}

	def save_m = {
		def appliedPenaltyInstance = new AppliedPenalty(params)
		if (appliedPenaltyInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), appliedPenaltyInstance.id])}"
			redirect(action: "show_m", id: appliedPenaltyInstance.id)
		}
		else {
			render(view: "create_m", model: [appliedPenaltyInstance: appliedPenaltyInstance])
		}
	}

	def show_m = {
		def appliedPenaltyInstance = AppliedPenalty.get(params.id)
		if (!appliedPenaltyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[appliedPenaltyInstance: appliedPenaltyInstance]
		}
	}

	def edit_m = {
		def appliedPenaltyInstance = AppliedPenalty.get(params.id)
		if (!appliedPenaltyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [appliedPenaltyInstance: appliedPenaltyInstance]
		}
	}

	def update_m = {
		def appliedPenaltyInstance = AppliedPenalty.get(params.id)
		if (appliedPenaltyInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (appliedPenaltyInstance.version > version) {
					
					appliedPenaltyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appliedPenalty.label', default: 'AppliedPenalty')] as Object[], "Another user has updated this AppliedPenalty while you were editing")
					render(view: "edit_m", model: [appliedPenaltyInstance: appliedPenaltyInstance])
					return
				}
			}
			appliedPenaltyInstance.properties = params
			if (!appliedPenaltyInstance.hasErrors() && appliedPenaltyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), appliedPenaltyInstance.id])}"
				redirect(action: "show_m", id: appliedPenaltyInstance.id)
			}
			else {
				render(view: "edit_m", model: [appliedPenaltyInstance: appliedPenaltyInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def appliedPenaltyInstance = AppliedPenalty.get(params.id)
		if (appliedPenaltyInstance) {
			try {
				appliedPenaltyInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
