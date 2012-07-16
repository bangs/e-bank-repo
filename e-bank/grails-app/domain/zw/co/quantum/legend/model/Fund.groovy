package zw.co.quantum.legend.model

class Fund {

	Institution institution
	String name
	String code
	String description
	String status
	
	Date dateCreated
	Date lastUpdated
	
    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		institution nullable: false
		name blank: false, maxSize: 80, unique: true
		code blank: false, maxSize: 30, unique: true
		description maxSize: 160
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }

}
