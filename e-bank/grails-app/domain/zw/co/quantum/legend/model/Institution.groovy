package zw.co.quantum.legend.model

import java.util.Date;

class Institution {

	String name
	String description
	Address address
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ branches: Branch ]
	
    static constraints = {
		name blank: false, maxSize: 150
		description maxSize: 250, nullable: true
		address nullable: false
		status inList: [ 'ACTIVE', 'DELETED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
}
