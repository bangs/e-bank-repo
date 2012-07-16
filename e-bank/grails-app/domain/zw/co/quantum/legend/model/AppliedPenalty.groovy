package zw.co.quantum.legend.model

class AppliedPenalty {

	static auditable = true
	
	Long entityId
	String entityType
	Penalty penalty
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo	= [ Penalty ]	// tells GORM to delete this object if the "parent" is deleted.
//	static hasOne		= []
//	static hasMany		= []	
//	static mappedBy		= []
	
    static mapping = {
		sort penalty: 'asc'
    }
    
	static constraints = {
		entityId nullable: false
		entityType nullable: false, maxSize: 40
		penalty nullable: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { penalty }

}
