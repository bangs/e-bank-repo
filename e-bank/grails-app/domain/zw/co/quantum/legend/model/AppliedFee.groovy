package zw.co.quantum.legend.model

class AppliedFee {

	static auditable = true
	
	Long entityId
	String entityType
	Fee fee
	String status
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [ Fee ]	// tells GORM to delete this object if the "parent" is deleted.
	
    static mapping = {
		sort fee: 'asc'
    }
    
	static constraints = {
		entityId nullable: false
		entityType nullable: false, maxSize: 40
		fee nullable: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { fee }

}
