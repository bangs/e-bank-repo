package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class PaymentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentTypeInstanceList: PaymentType.list(params), paymentTypeInstanceTotal: PaymentType.count()]
    }

    def create = {
        def paymentTypeInstance = new PaymentType()
        paymentTypeInstance.properties = params
        return [paymentTypeInstance: paymentTypeInstance]
    }

    def save = {
        def paymentTypeInstance = new PaymentType(params)
		
		paymentTypeInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		paymentTypeInstance.status = Constants.STATUS_ACTIVE
		
        if (paymentTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), paymentTypeInstance.id])}"
            redirect(action: "show", id: paymentTypeInstance.id)
        }
        else {
            render(view: "create", model: [paymentTypeInstance: paymentTypeInstance])
        }
    }

    def show = {
        def paymentTypeInstance = PaymentType.get(params.id)
        if (!paymentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paymentTypeInstance: paymentTypeInstance]
        }
    }

    def edit = {
        def paymentTypeInstance = PaymentType.get(params.id)
        if (!paymentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paymentTypeInstance: paymentTypeInstance]
        }
    }

    def update = {
        def paymentTypeInstance = PaymentType.get(params.id)
        if (paymentTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paymentTypeInstance.version > version) {
                    
                    paymentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paymentType.label', default: 'PaymentType')] as Object[], "Another user has updated this PaymentType while you were editing")
                    render(view: "edit", model: [paymentTypeInstance: paymentTypeInstance])
                    return
                }
            }
            paymentTypeInstance.properties = params
            if (!paymentTypeInstance.hasErrors() && paymentTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), paymentTypeInstance.id])}"
                redirect(action: "show", id: paymentTypeInstance.id)
            }
            else {
                render(view: "edit", model: [paymentTypeInstance: paymentTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paymentTypeInstance = PaymentType.get(params.id)
        if (paymentTypeInstance) {
            try {
                paymentTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[paymentTypeInstanceList: PaymentType.list(params), paymentTypeInstanceTotal: PaymentType.count()]
	}

	def create_m = {
		def paymentTypeInstance = new PaymentType()
		paymentTypeInstance.properties = params
		return [paymentTypeInstance: paymentTypeInstance]
	}

	def save_m = {
		def paymentTypeInstance = new PaymentType(params)
		if (paymentTypeInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), paymentTypeInstance.id])}"
			redirect(action: "show_m", id: paymentTypeInstance.id)
		}
		else {
			render(view: "create_m", model: [paymentTypeInstance: paymentTypeInstance])
		}
	}

	def show_m = {
		def paymentTypeInstance = PaymentType.get(params.id)
		if (!paymentTypeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[paymentTypeInstance: paymentTypeInstance]
		}
	}

	def edit_m = {
		def paymentTypeInstance = PaymentType.get(params.id)
		if (!paymentTypeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [paymentTypeInstance: paymentTypeInstance]
		}
	}

	def update_m = {
		def paymentTypeInstance = PaymentType.get(params.id)
		if (paymentTypeInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (paymentTypeInstance.version > version) {
					
					paymentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paymentType.label', default: 'PaymentType')] as Object[], "Another user has updated this PaymentType while you were editing")
					render(view: "edit_m", model: [paymentTypeInstance: paymentTypeInstance])
					return
				}
			}
			paymentTypeInstance.properties = params
			if (!paymentTypeInstance.hasErrors() && paymentTypeInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), paymentTypeInstance.id])}"
				redirect(action: "show_m", id: paymentTypeInstance.id)
			}
			else {
				render(view: "edit_m", model: [paymentTypeInstance: paymentTypeInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def paymentTypeInstance = PaymentType.get(params.id)
		if (paymentTypeInstance) {
			try {
				paymentTypeInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentType.label', default: 'PaymentType'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
