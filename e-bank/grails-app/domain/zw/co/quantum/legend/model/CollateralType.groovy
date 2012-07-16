package zw.co.quantum.legend.model

class CollateralType {

	Institution institution
	String name
	String description
	String status
	
	Date	dateCreated
	Date	lastUpdated
	
    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		institution nullable: false
		name blank: false, maxSize: 50, unique: true
		description blank: false, maxSize: 160
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
}
