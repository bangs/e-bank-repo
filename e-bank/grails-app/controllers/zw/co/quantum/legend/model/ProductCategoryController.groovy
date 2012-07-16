package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.util.Constants;

class ProductCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productCategoryInstanceList: ProductCategory.list(params), productCategoryInstanceTotal: ProductCategory.count()]
    }

    def create = {
        def productCategoryInstance = new ProductCategory()
        productCategoryInstance.properties = params
        return [productCategoryInstance: productCategoryInstance]
    }

    def save = {
        def productCategoryInstance = new ProductCategory(params)
		
		productCategoryInstance.institution =  User.get(springSecurityService.principal.id).branch.institution
		productCategoryInstance.status = Constants.STATUS_ACTIVE
		
        if (productCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])}"
            redirect(action: "show", id: productCategoryInstance.id)
        }
        else {
            render(view: "create", model: [productCategoryInstance: productCategoryInstance])
        }
    }

    def show = {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (!productCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productCategoryInstance: productCategoryInstance]
        }
    }

    def edit = {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (!productCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productCategoryInstance: productCategoryInstance]
        }
    }

    def update = {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (productCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productCategoryInstance.version > version) {
                    
                    productCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productCategory.label', default: 'ProductCategory')] as Object[], "Another user has updated this ProductCategory while you were editing")
                    render(view: "edit", model: [productCategoryInstance: productCategoryInstance])
                    return
                }
            }
            productCategoryInstance.properties = params
            if (!productCategoryInstance.hasErrors() && productCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])}"
                redirect(action: "show", id: productCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [productCategoryInstance: productCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productCategoryInstance = ProductCategory.get(params.id)
        if (productCategoryInstance) {
            try {
                productCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def list_m = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[productCategoryInstanceList: ProductCategory.list(params), productCategoryInstanceTotal: ProductCategory.count()]
	}

	def create_m = {
		def productCategoryInstance = new ProductCategory()
		productCategoryInstance.properties = params
		return [productCategoryInstance: productCategoryInstance]
	}

	def save_m = {
		def productCategoryInstance = new ProductCategory(params)
		if (productCategoryInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])}"
			redirect(action: "show_m", id: productCategoryInstance.id)
		}
		else {
			render(view: "create_m", model: [productCategoryInstance: productCategoryInstance])
		}
	}

	def show_m = {
		def productCategoryInstance = ProductCategory.get(params.id)
		if (!productCategoryInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			[productCategoryInstance: productCategoryInstance]
		}
	}

	def edit_m = {
		def productCategoryInstance = ProductCategory.get(params.id)
		if (!productCategoryInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
			redirect(action: "list_m")
		}
		else {
			return [productCategoryInstance: productCategoryInstance]
		}
	}

	def update_m = {
		def productCategoryInstance = ProductCategory.get(params.id)
		if (productCategoryInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (productCategoryInstance.version > version) {
					
					productCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productCategory.label', default: 'ProductCategory')] as Object[], "Another user has updated this ProductCategory while you were editing")
					render(view: "edit_m", model: [productCategoryInstance: productCategoryInstance])
					return
				}
			}
			productCategoryInstance.properties = params
			if (!productCategoryInstance.hasErrors() && productCategoryInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), productCategoryInstance.id])}"
				redirect(action: "show_m", id: productCategoryInstance.id)
			}
			else {
				render(view: "edit_m", model: [productCategoryInstance: productCategoryInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete_m = {
		def productCategoryInstance = ProductCategory.get(params.id)
		if (productCategoryInstance) {
			try {
				productCategoryInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
				redirect(action: "list_m")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
				redirect(action: "show_m", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productCategory.label', default: 'ProductCategory'), params.id])}"
			redirect(action: "list_m")
		}
	}

}
