package zw.co.quantum.legend.auth

import zw.co.quantum.legend.util.Constants;

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
		
        if (userInstance.save()) {
			
			def roles = params.roles
			
			if (roles instanceof String) {
				println roles
				UserRole.create(userInstance, Role.findByAuthority(roles.toString()), true)
			} else {
				roles?.each { role ->
					println role
					UserRole.create(userInstance, Role.findByAuthority(role.toString()), true)
				}
			}
			
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
		
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
			
			def roles = params.roles
			
			if (roles instanceof String) {
				println roles
				if (!userInstance.hasRole(roles.toString())) {
					UserRole.create(userInstance, Role.findByAuthority(roles.toString()), true)
				}
			} else {
				roles?.each { role ->
					println role
					if (!userInstance.hasRole(role)) {
						UserRole.create(userInstance, Role.findByAuthority(role.toString()), true)
					}
				}
			}
			
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def search() {
				
		def userList = User.withCriteria {
						
			if (params.'branch.id') {
				eq('branch.id', params.'branch.id'.toLong())
			}
			if (params.username) {
				ilike('username', "%${params.username}%")
			}
			if (params.lastName) {
				ilike('lastName', "%${params.lastName}%")
			}
		}
		
		println userList?.size()
		
		if (userList) {
			flash.message = "${userList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"listbody", model:[userInstanceList: userList, userInstanceTotal: userList?.size()]
		
	}

}
