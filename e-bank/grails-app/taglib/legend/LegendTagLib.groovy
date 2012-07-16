package legend

import zw.co.quantum.legend.auth.User;

class LegendTagLib {

	static namespace = 'leg'
	
	def springSecurityService
	
	def currentUser = { attrs ->
		
		def field = attrs.field
		
		def user = User.get(springSecurityService.principal.id.toLong())
		
		if (!field) {
			
			out << user
			
		} else {
		
			out << user."${field}"
			 
		}
	}
}
