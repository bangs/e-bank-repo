package zw.co.quantum.legend.auth

class UserRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userRoleInstanceList: UserRole.list(params), userRoleInstanceTotal: UserRole.count()]
    }

    def create = {
        def userRoleInstance = new UserRole()
        userRoleInstance.properties = params
        return [userRoleInstance: userRoleInstance]
    }

    def save = {
        def userRoleInstance = new UserRole(params)
        if (userRoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
            redirect(action: "show", id: userRoleInstance.id)
        }
        else {
            render(view: "create", model: [userRoleInstance: userRoleInstance])
        }
    }

    def show = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userRoleInstance: userRoleInstance]
        }
    }

    def edit = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userRoleInstance: userRoleInstance]
        }
    }

    def update = {
        def userRoleInstance = UserRole.get(params.id)
        if (userRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userRoleInstance.version > version) {
                    
                    userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRole.label', default: 'UserRole')] as Object[], "Another user has updated this UserRole while you were editing")
                    render(view: "edit", model: [userRoleInstance: userRoleInstance])
                    return
                }
            }
            userRoleInstance.properties = params
            if (!userRoleInstance.hasErrors() && userRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
                redirect(action: "show", id: userRoleInstance.id)
            }
            else {
                render(view: "edit", model: [userRoleInstance: userRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userRoleInstance = UserRole.get(params.id)
        if (userRoleInstance) {
            try {
                userRoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[userRoleInstanceList: UserRole.list(params), userRoleInstanceTotal: UserRole.count()]
	}

	def create_m = {
		def userRoleInstance = new UserRole()
		userRoleInstance.properties = params
		return [userRoleInstance: userRoleInstance]
	}

	def save_m = {
		def userRoleInstance = new UserRole(params)
		if (userRoleInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
			redirect(action: "show_m", id: userRoleInstance.id)
		}
		else {
			render(view: "create_m", model: [userRoleInstance: userRoleInstance])
		}
	}

	def show_m = {
		def userRoleInstance = UserRole.get(params.id)
		if (!userRoleInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[userRoleInstance: userRoleInstance]
		}
	}

	def edit_m = {
		def userRoleInstance = UserRole.get(params.id)
		if (!userRoleInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [userRoleInstance: userRoleInstance]
		}
	}

	def update_m = {
		def userRoleInstance = UserRole.get(params.id)
		if (userRoleInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userRoleInstance.version > version) {
					
					userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRole.label', default: 'UserRole')] as Object[], "Another user has updated this UserRole while you were editing")
					render(view: "edit_m", model: [userRoleInstance: userRoleInstance])
					return
				}
			}
			userRoleInstance.properties = params
			if (!userRoleInstance.hasErrors() && userRoleInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
				redirect(action: "show_m", id: userRoleInstance.id)
			}
			else {
				render(view: "edit_m", model: [userRoleInstance: userRoleInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def userRoleInstance = UserRole.get(params.id)
		if (userRoleInstance) {
			try {
				userRoleInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
