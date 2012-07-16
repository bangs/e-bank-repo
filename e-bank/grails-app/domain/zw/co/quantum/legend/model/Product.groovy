package zw.co.quantum.legend.model

abstract class Product {

	static auditable = true
	
	Institution institution
	ProductCategory category
	String name
	String shortName
	String description
	Date startDate
	Date endDate
	String applicableFor
	
	String status
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo = [ Institution ]
	
    static mapping = {
		tablePerHierarchy: false
		sort name:'asc'
    }
    
	static constraints = {
		institution nullable: false
		name blank: false, maxSize: 70
		shortName blank: false, maxSize: 30
		description maxSize: 160
		category nullable: false
		startDate nullable: false
		endDate nullable: true
		applicableFor inList: [ 'CLIENTS', 'GROUPS' ], blank: false
		status inList: [ 'ACTIVE', 'INACTIVE' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
}
