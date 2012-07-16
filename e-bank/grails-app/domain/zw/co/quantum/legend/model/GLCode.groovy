package zw.co.quantum.legend.model

class GLCode {

	Institution institution
	String code
	String type
	String description
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static mapping = {
		sort code: 'asc'
	}
	
	static constraints = {
		institution nullable: false
		code blank: false, maxSize: 20, unique: true
		type inList: [ 
				'PRINCIPAL',
				'INTEREST',
				'FEE',
				'PENALTY',
				'INSTALLMENT',
				'ADJUSTMENT',
				'DEPOSIT',
				'WITHDRAWAL',
			], blank: false, unique: true
		description maxSize: 100
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
	}
	
	String toString() { "${code} - ${type} [${description}]" }
	
    
}
