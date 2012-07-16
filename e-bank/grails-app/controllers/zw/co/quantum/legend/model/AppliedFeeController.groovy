package zw.co.quantum.legend.model

class AppliedFeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [appliedFeeInstanceList: AppliedFee.list(params), appliedFeeInstanceTotal: AppliedFee.count()]
    }

    def create = {
        def appliedFeeInstance = new AppliedFee()
        appliedFeeInstance.properties = params
        return [appliedFeeInstance: appliedFeeInstance]
    }

    def save = {
        def appliedFeeInstance = new AppliedFee(params)
        if (appliedFeeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), appliedFeeInstance.id])}"
            redirect(action: "show", id: appliedFeeInstance.id)
        }
        else {
            render(view: "create", model: [appliedFeeInstance: appliedFeeInstance])
        }
    }

    def show = {
        def appliedFeeInstance = AppliedFee.get(params.id)
        if (!appliedFeeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
            redirect(action: "list")
        }
        else {
            [appliedFeeInstance: appliedFeeInstance]
        }
    }

    def edit = {
        def appliedFeeInstance = AppliedFee.get(params.id)
        if (!appliedFeeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [appliedFeeInstance: appliedFeeInstance]
        }
    }

    def update = {
        def appliedFeeInstance = AppliedFee.get(params.id)
        if (appliedFeeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (appliedFeeInstance.version > version) {
                    
                    appliedFeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appliedFee.label', default: 'AppliedFee')] as Object[], "Another user has updated this AppliedFee while you were editing")
                    render(view: "edit", model: [appliedFeeInstance: appliedFeeInstance])
                    return
                }
            }
            appliedFeeInstance.properties = params
            if (!appliedFeeInstance.hasErrors() && appliedFeeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), appliedFeeInstance.id])}"
                redirect(action: "show", id: appliedFeeInstance.id)
            }
            else {
                render(view: "edit", model: [appliedFeeInstance: appliedFeeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def appliedFeeInstance = AppliedFee.get(params.id)
        if (appliedFeeInstance) {
            try {
                appliedFeeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[appliedFeeInstanceList: AppliedFee.list(params), appliedFeeInstanceTotal: AppliedFee.count()]
	}

	def create_m = {
		def appliedFeeInstance = new AppliedFee()
		appliedFeeInstance.properties = params
		return [appliedFeeInstance: appliedFeeInstance]
	}

	def save_m = {
		def appliedFeeInstance = new AppliedFee(params)
		if (appliedFeeInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), appliedFeeInstance.id])}"
			redirect(action: "show_m", id: appliedFeeInstance.id)
		}
		else {
			render(view: "create_m", model: [appliedFeeInstance: appliedFeeInstance])
		}
	}

	def show_m = {
		def appliedFeeInstance = AppliedFee.get(params.id)
		if (!appliedFeeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[appliedFeeInstance: appliedFeeInstance]
		}
	}

	def edit_m = {
		def appliedFeeInstance = AppliedFee.get(params.id)
		if (!appliedFeeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [appliedFeeInstance: appliedFeeInstance]
		}
	}

	def update_m = {
		def appliedFeeInstance = AppliedFee.get(params.id)
		if (appliedFeeInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (appliedFeeInstance.version > version) {
					
					appliedFeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appliedFee.label', default: 'AppliedFee')] as Object[], "Another user has updated this AppliedFee while you were editing")
					render(view: "edit_m", model: [appliedFeeInstance: appliedFeeInstance])
					return
				}
			}
			appliedFeeInstance.properties = params
			if (!appliedFeeInstance.hasErrors() && appliedFeeInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), appliedFeeInstance.id])}"
				redirect(action: "show_m", id: appliedFeeInstance.id)
			}
			else {
				render(view: "edit_m", model: [appliedFeeInstance: appliedFeeInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def appliedFeeInstance = AppliedFee.get(params.id)
		if (appliedFeeInstance) {
			try {
				appliedFeeInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appliedFee.label', default: 'AppliedFee'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
