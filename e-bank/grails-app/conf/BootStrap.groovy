import zw.co.quantum.legend.auth.*;
import zw.co.quantum.legend.model.*;
import zw.co.quantum.legend.sys.Config;

class BootStrap {

    def init = { servletContext ->
		
		if (!Config.list()) {
			
			def config = new Config(
				initializationPerformed: false,
				txRefCounter: 1000000,
				txRefSequence: 1,
				accountNoCounter: 12000000,
				accountNoSequence: 1,
				clientNoCounter: 1,
				clientNoSequence: 1
				).save(flush: true)
		
			assert config
			
			//initialise default data
					
			initializeDefaultData()
			
			//configure spring security
			
			initializeSecurity()
			
			//initialize default settings
			
			initializeSettings()
			
			//set init to true
			
			config.initializationPerformed = true
			
			assert config.save(flush: true)
				
		}
		
    }
	
    def destroy = {
		
    }
	
	def initializeDefaultData() {
		
		def address = new Address(street: 'Default', suburb: 'Default', city: 'Default', country: 'Default', telephone: '263-4-0000').save(flush: true)
		
		assert address
		
		def institution = new Institution(address: address, name: 'John Doe Microfinance', description: 'Default Microfinance Company', status: 'ACTIVE').save(flush: true)
		
		assert institution
		
		def branch = new Branch(institution: institution, name: 'Head Office', code: 'HO', status: 'ACTIVE').save(flush: true)
		
		assert branch
		
		Role adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		
		assert adminRole
		
		assert new Role(authority: 'ROLE_SUPERVISOR').save(flush: true)
		
		assert new Role(authority: 'ROLE_OFFICER').save(flush: true)
		
		assert new Role(authority: 'ROLE_APPROVER').save(flush: true)
		
		assert new Role(authority: 'ROLE_DISBURSER').save(flush: true)
		
		assert new Role(authority: 'ROLE_REPORTER').save(flush: true)
		
		assert new Role(authority: 'ROLE_TELLER').save(flush: true)
		
		def user = new User(branch: branch, lastName: 'Admin', firstName: 'Admin', username: 'admin', password: 'admin', enabled: true).save(flush: true)
		
		assert user
		
		assert UserRole.create(user, adminRole, true)
		
	}
	
	def initializeSecurity() {
		
		new Requestmap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/*', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
		new Requestmap(url: '/**', configAttribute: 'IS_AUTHENTICATED_REMEMBERED').save()
		
		assert Requestmap.list()
		
	}
	
	def initializeSettings() {
		
		assert new Settings(	
					
			institution: Institution.list().get(0),
			startOfWeek: 'MON',
			offDays: 'SUN',
			baseCurrency: 'USD',
			minimumInterest: 0,
			maximumInterest: 100,
			interestDays: 365,
			minimumIndebtnessRatio: 1,
			maximumIndebtnessRatio: 5,
			allowInstallmentsAboveAmountDue: false,
			allowInstallmentsBelowAmountDue: false,
			groupLoansAllowed: true,
			ageCheckEnabled: true,
			minimumNewClientAge: 18,
			maximumNewClientAge: 60,
			sessionTimeoutMinutes: 30,
			batchJobSize: 100,
			maxDisbursalLimit: 10000
	
		).save(flush: true)
		
	}
}
