package zw.co.quantum.legend.model

class InstitutionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [institutionInstanceList: Institution.list(params), institutionInstanceTotal: Institution.count()]
    }

    def create = {
        def institutionInstance = new Institution()
        institutionInstance.properties = params
        return [institutionInstance: institutionInstance]
    }

    def save = {
        def institutionInstance = new Institution(params)
		
		institutionInstance.address = new Address(
			street: params.street,
			suburb: params.suburb,
			city: params.city,
			country: params.country,
			telephone: params.telephone
		).save(flush: true)
		
		institutionInstance.status = 'ACTIVE'
		
        if (institutionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])}"
            redirect(action: "show", id: institutionInstance.id)
        }
        else {
            render(view: "create", model: [institutionInstance: institutionInstance])
        }
    }

    def show = {
        def institutionInstance = Institution.get(params.id)
        if (!institutionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
            redirect(action: "list")
        }
        else {
            [institutionInstance: institutionInstance]
        }
    }

    def edit = {
        def institutionInstance = Institution.get(params.id)
        if (!institutionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [institutionInstance: institutionInstance]
        }
    }

    def update = {
        def institutionInstance = Institution.get(params.id)
        if (institutionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (institutionInstance.version > version) {
                    
                    institutionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'institution.label', default: 'Institution')] as Object[], "Another user has updated this Institution while you were editing")
                    render(view: "edit", model: [institutionInstance: institutionInstance])
                    return
                }
            }
            institutionInstance.properties = params
            if (!institutionInstance.hasErrors() && institutionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])}"
                redirect(action: "show", id: institutionInstance.id)
            }
            else {
                render(view: "edit", model: [institutionInstance: institutionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def institutionInstance = Institution.get(params.id)
        if (institutionInstance) {
            try {
                institutionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[institutionInstanceList: Institution.list(params), institutionInstanceTotal: Institution.count()]
	}

	def create_m = {
		def institutionInstance = new Institution()
		institutionInstance.properties = params
		return [institutionInstance: institutionInstance]
	}

	def save_m = {
		def institutionInstance = new Institution(params)
		if (institutionInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])}"
			redirect(action: "show_m", id: institutionInstance.id)
		}
		else {
			render(view: "create_m", model: [institutionInstance: institutionInstance])
		}
	}

	def show_m = {
		def institutionInstance = Institution.get(params.id)
		if (!institutionInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[institutionInstance: institutionInstance]
		}
	}

	def edit_m = {
		def institutionInstance = Institution.get(params.id)
		if (!institutionInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [institutionInstance: institutionInstance]
		}
	}

	def update_m = {
		def institutionInstance = Institution.get(params.id)
		if (institutionInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (institutionInstance.version > version) {
					
					institutionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'institution.label', default: 'Institution')] as Object[], "Another user has updated this Institution while you were editing")
					render(view: "edit_m", model: [institutionInstance: institutionInstance])
					return
				}
			}
			institutionInstance.properties = params
			if (!institutionInstance.hasErrors() && institutionInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])}"
				redirect(action: "show_m", id: institutionInstance.id)
			}
			else {
				render(view: "edit_m", model: [institutionInstance: institutionInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def institutionInstance = Institution.get(params.id)
		if (institutionInstance) {
			try {
				institutionInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
