package zw.co.quantum.legend.model

class Bulletin {
	
	Institution institution
	String message 
	Date startDate
	Date endDate
	
	Date dateCreated
	Date lastUpdated
		
    static mapping = {
		sort dateCreated:'desc'
    }
    
	static constraints = {
		institution nullable: false
		message blank: false, maxSize: 250
		startDate nullable: false
		endDate nullable: false
		dateCreated()
		lastUpdated()
    }
	
	String toString() { return message }
	
}
