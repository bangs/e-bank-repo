package zw.co.quantum.legend.model

class CorporateClient extends Client {

	String name
	String externalId
	
    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		name blank: false, maxSize: 100, unique: true
		externalId maxSize: 30
    }
	
	String toString() { "${name}" }
	
	String getClientName() { toString() }
	
}
