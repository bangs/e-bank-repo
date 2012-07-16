package zw.co.quantum.legend.model

class ClientGroup extends Client {

	String name
	String description
	String accountType
	String externalId 
	
	static hasMany = [ clients: IndividualClient ]
		
    static mapping = { 
		sort name:'asc'
	}
    
	static constraints = {
		name blank: false, maxSize: 100, unique: true
		description maxSize: 160
		accountType inList: [ 'GROUP ACCOUNT', 'INDIVIDUAL ACCOUNTS' ]
		externalId maxSize: 30
	}
	
	String toString() { "${name}" }
	
	String getClientName() { toString() }
	
}
