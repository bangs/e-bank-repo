package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class FundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fundInstanceList: Fund.list(params), fundInstanceTotal: Fund.count()]
    }

    def create = {
        def fundInstance = new Fund()
        fundInstance.properties = params
        return [fundInstance: fundInstance]
    }

    def save = {
        def fundInstance = new Fund(params)
		
		fundInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		fundInstance.status = Constants.STATUS_ACTIVE
		
        if (fundInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])}"
            redirect(action: "show", id: fundInstance.id)
        }
        else {
            render(view: "create", model: [fundInstance: fundInstance])
        }
    }

    def show = {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fundInstance: fundInstance]
        }
    }

    def edit = {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fundInstance: fundInstance]
        }
    }

    def update = {
        def fundInstance = Fund.get(params.id)
        if (fundInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fundInstance.version > version) {
                    
                    fundInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fund.label', default: 'Fund')] as Object[], "Another user has updated this Fund while you were editing")
                    render(view: "edit", model: [fundInstance: fundInstance])
                    return
                }
            }
            fundInstance.properties = params
            if (!fundInstance.hasErrors() && fundInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])}"
                redirect(action: "show", id: fundInstance.id)
            }
            else {
                render(view: "edit", model: [fundInstance: fundInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fundInstance = Fund.get(params.id)
        if (fundInstance) {
            try {
                fundInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[fundInstanceList: Fund.list(params), fundInstanceTotal: Fund.count()]
	}

	def create_m = {
		def fundInstance = new Fund()
		fundInstance.properties = params
		return [fundInstance: fundInstance]
	}

	def save_m = {
		def fundInstance = new Fund(params)
		if (fundInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])}"
			redirect(action: "show_m", id: fundInstance.id)
		}
		else {
			render(view: "create_m", model: [fundInstance: fundInstance])
		}
	}

	def show_m = {
		def fundInstance = Fund.get(params.id)
		if (!fundInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[fundInstance: fundInstance]
		}
	}

	def edit_m = {
		def fundInstance = Fund.get(params.id)
		if (!fundInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [fundInstance: fundInstance]
		}
	}

	def update_m = {
		def fundInstance = Fund.get(params.id)
		if (fundInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (fundInstance.version > version) {
					
					fundInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fund.label', default: 'Fund')] as Object[], "Another user has updated this Fund while you were editing")
					render(view: "edit_m", model: [fundInstance: fundInstance])
					return
				}
			}
			fundInstance.properties = params
			if (!fundInstance.hasErrors() && fundInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])}"
				redirect(action: "show_m", id: fundInstance.id)
			}
			else {
				render(view: "edit_m", model: [fundInstance: fundInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def fundInstance = Fund.get(params.id)
		if (fundInstance) {
			try {
				fundInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
