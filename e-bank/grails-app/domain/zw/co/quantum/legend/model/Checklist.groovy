package zw.co.quantum.legend.model

class Checklist {
	
	Institution institution
	String name
	String type
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ items: ChecklistItem ]	
	
    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		name blank: false, maxSize: 100, unique: true
		type inList: [ 'CLIENT', 'GROUP', 'LOAN', 'SAVINGS' ], blank: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }

}
