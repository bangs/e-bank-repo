package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;

class BulletinController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bulletinInstanceList: Bulletin.list(params), bulletinInstanceTotal: Bulletin.count()]
    }

    def create = {
        def bulletinInstance = new Bulletin()
        bulletinInstance.properties = params
        return [bulletinInstance: bulletinInstance]
    }

    def save = {
        def bulletinInstance = new Bulletin(params)
		
		bulletinInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		
        if (bulletinInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), bulletinInstance.id])}"
            redirect(action: "show", id: bulletinInstance.id)
        }
        else {
            render(view: "create", model: [bulletinInstance: bulletinInstance])
        }
    }

    def show = {
        def bulletinInstance = Bulletin.get(params.id)
        if (!bulletinInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bulletinInstance: bulletinInstance]
        }
    }

    def edit = {
        def bulletinInstance = Bulletin.get(params.id)
        if (!bulletinInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bulletinInstance: bulletinInstance]
        }
    }

    def update = {
        def bulletinInstance = Bulletin.get(params.id)
        if (bulletinInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bulletinInstance.version > version) {
                    
                    bulletinInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bulletin.label', default: 'Bulletin')] as Object[], "Another user has updated this Bulletin while you were editing")
                    render(view: "edit", model: [bulletinInstance: bulletinInstance])
                    return
                }
            }
            bulletinInstance.properties = params
            if (!bulletinInstance.hasErrors() && bulletinInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), bulletinInstance.id])}"
                redirect(action: "show", id: bulletinInstance.id)
            }
            else {
                render(view: "edit", model: [bulletinInstance: bulletinInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bulletinInstance = Bulletin.get(params.id)
        if (bulletinInstance) {
            try {
                bulletinInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[bulletinInstanceList: Bulletin.list(params), bulletinInstanceTotal: Bulletin.count()]
	}

	def create_m = {
		def bulletinInstance = new Bulletin()
		bulletinInstance.properties = params
		return [bulletinInstance: bulletinInstance]
	}

	def save_m = {
		def bulletinInstance = new Bulletin(params)
		if (bulletinInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), bulletinInstance.id])}"
			redirect(action: "show_m", id: bulletinInstance.id)
		}
		else {
			render(view: "create_m", model: [bulletinInstance: bulletinInstance])
		}
	}

	def show_m = {
		def bulletinInstance = Bulletin.get(params.id)
		if (!bulletinInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[bulletinInstance: bulletinInstance]
		}
	}

	def edit_m = {
		def bulletinInstance = Bulletin.get(params.id)
		if (!bulletinInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [bulletinInstance: bulletinInstance]
		}
	}

	def update_m = {
		def bulletinInstance = Bulletin.get(params.id)
		if (bulletinInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (bulletinInstance.version > version) {
					
					bulletinInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bulletin.label', default: 'Bulletin')] as Object[], "Another user has updated this Bulletin while you were editing")
					render(view: "edit_m", model: [bulletinInstance: bulletinInstance])
					return
				}
			}
			bulletinInstance.properties = params
			if (!bulletinInstance.hasErrors() && bulletinInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), bulletinInstance.id])}"
				redirect(action: "show_m", id: bulletinInstance.id)
			}
			else {
				render(view: "edit_m", model: [bulletinInstance: bulletinInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def bulletinInstance = Bulletin.get(params.id)
		if (bulletinInstance) {
			try {
				bulletinInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bulletin.label', default: 'Bulletin'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
