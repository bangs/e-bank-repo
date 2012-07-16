package zw.co.quantum.legend.auth

class Role {

	static auditable = true
	
	String authority

	static hasMany = [ userRoles: UserRole ]
	
	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString() { authority }
	
}
