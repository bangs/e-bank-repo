package zw.co.quantum.legend.auth

import zw.co.quantum.legend.model.Branch;
import zw.co.quantum.legend.model.Client;

class User {

	static auditable = true
	
	transient springSecurityService

	Branch branch
	String lastName
	String firstName
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	Date lastLoginDate
	Date dateCreated
	Date lastUpdated

	static constraints = {
		branch nullable: false
		lastName blank: false, maxSize: 30
		firstName blank: false, maxSize: 30
		username blank: false, unique: true
		password blank: false
		lastLoginDate nullable: true
		dateCreated()
		lastUpdated()
	}
	
	static hasMany = [ userRoles: UserRole ]

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	String toString() { username }
	
	String getFullname() { "${lastName} ${firstName}" }
		
	def hasRole(String authority) {
		
		return UserRole.get(this.id, Role.findByAuthority(authority)?.id)
		
	}
	
}
