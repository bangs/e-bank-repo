import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import zw.co.quantum.legend.auth.User;

class LogoutController {
	
	def springSecurityService
	
	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		// TODO put any pre-logout code here
		
		//custom code for last login
		User user = User.get(springSecurityService.currentUser.id)
		println "##############" + user.lastLoginDate
		user.lastLoginDate = new Date();
		user.save(flush: true)
		
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
		
	}
}
