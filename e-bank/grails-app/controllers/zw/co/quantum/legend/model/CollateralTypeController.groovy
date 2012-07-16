package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class CollateralTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [collateralTypeInstanceList: CollateralType.list(params), collateralTypeInstanceTotal: CollateralType.count()]
    }

    def create = {
        def collateralTypeInstance = new CollateralType()
        collateralTypeInstance.properties = params
        return [collateralTypeInstance: collateralTypeInstance]
    }

    def save = {
        def collateralTypeInstance = new CollateralType(params)
		
		collateralTypeInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		collateralTypeInstance.status = Constants.STATUS_ACTIVE
		
        if (collateralTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), collateralTypeInstance.id])}"
            redirect(action: "show", id: collateralTypeInstance.id)
        }
        else {
            render(view: "create", model: [collateralTypeInstance: collateralTypeInstance])
        }
    }

    def show = {
        def collateralTypeInstance = CollateralType.get(params.id)
        if (!collateralTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [collateralTypeInstance: collateralTypeInstance]
        }
    }

    def edit = {
        def collateralTypeInstance = CollateralType.get(params.id)
        if (!collateralTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [collateralTypeInstance: collateralTypeInstance]
        }
    }

    def update = {
        def collateralTypeInstance = CollateralType.get(params.id)
        if (collateralTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (collateralTypeInstance.version > version) {
                    
                    collateralTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'collateralType.label', default: 'CollateralType')] as Object[], "Another user has updated this CollateralType while you were editing")
                    render(view: "edit", model: [collateralTypeInstance: collateralTypeInstance])
                    return
                }
            }
            collateralTypeInstance.properties = params
            if (!collateralTypeInstance.hasErrors() && collateralTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), collateralTypeInstance.id])}"
                redirect(action: "show", id: collateralTypeInstance.id)
            }
            else {
                render(view: "edit", model: [collateralTypeInstance: collateralTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def collateralTypeInstance = CollateralType.get(params.id)
        if (collateralTypeInstance) {
            try {
                collateralTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[collateralTypeInstanceList: CollateralType.list(params), collateralTypeInstanceTotal: CollateralType.count()]
	}

	def create_m = {
		def collateralTypeInstance = new CollateralType()
		collateralTypeInstance.properties = params
		return [collateralTypeInstance: collateralTypeInstance]
	}

	def save_m = {
		def collateralTypeInstance = new CollateralType(params)
		if (collateralTypeInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), collateralTypeInstance.id])}"
			redirect(action: "show_m", id: collateralTypeInstance.id)
		}
		else {
			render(view: "create_m", model: [collateralTypeInstance: collateralTypeInstance])
		}
	}

	def show_m = {
		def collateralTypeInstance = CollateralType.get(params.id)
		if (!collateralTypeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[collateralTypeInstance: collateralTypeInstance]
		}
	}

	def edit_m = {
		def collateralTypeInstance = CollateralType.get(params.id)
		if (!collateralTypeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [collateralTypeInstance: collateralTypeInstance]
		}
	}

	def update_m = {
		def collateralTypeInstance = CollateralType.get(params.id)
		if (collateralTypeInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (collateralTypeInstance.version > version) {
					
					collateralTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'collateralType.label', default: 'CollateralType')] as Object[], "Another user has updated this CollateralType while you were editing")
					render(view: "edit_m", model: [collateralTypeInstance: collateralTypeInstance])
					return
				}
			}
			collateralTypeInstance.properties = params
			if (!collateralTypeInstance.hasErrors() && collateralTypeInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), collateralTypeInstance.id])}"
				redirect(action: "show_m", id: collateralTypeInstance.id)
			}
			else {
				render(view: "edit_m", model: [collateralTypeInstance: collateralTypeInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def collateralTypeInstance = CollateralType.get(params.id)
		if (collateralTypeInstance) {
			try {
				collateralTypeInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'collateralType.label', default: 'CollateralType'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
