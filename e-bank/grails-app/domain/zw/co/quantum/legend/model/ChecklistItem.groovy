package zw.co.quantum.legend.model

class ChecklistItem {

	Checklist checklist
	String description
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [ Checklist ]	// tells GORM to delete this object if the "parent" is deleted.

    static mapping = {
		sort dateCreated:'asc'
    }
    
	static constraints = {
		checklist nullable: false
		description blank: false, maxSize: 200
		dateCreated()
		lastUpdated()
    }
	
	String toString() { description }
	
}
