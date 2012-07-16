package zw.co.quantum.legend.model

import java.util.Date;

import zw.co.quantum.legend.auth.User;

class Branch {
		
	Institution institution
	String name
	String code
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ Institution ]
	
	static hasMany = [ users: User, clients: Client ]
	
	static mapping = {
		sort name:'asc'
	}
	
    static constraints = {
		institution nullable: false
		name blank: false, maxSize: 100, unique: true
		code blank: false, maxSize: 20, unique: true
		status inList: [ 'ACTIVE', 'DELETED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
	def initializeDefaultBranch() {
		
	}
	
}
