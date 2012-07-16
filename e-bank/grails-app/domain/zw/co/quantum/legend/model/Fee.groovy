package zw.co.quantum.legend.model

class Fee {

	static auditable = true
	
	Institution institution
	String name
	String description
	String transactionType
	String type
	String frequency
	String appliesTo
	BigDecimal amount
	Boolean defaultFees
	GLCode gLCode
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ appliedFees: AppliedFee ]
	
	static mapping = {
		sort name:'asc'
	}
	
    static constraints = {
		institution nullable: false
		name blank: false, maxSize: 60
		description maxSize: 150
		transactionType inList: [ 'NONE', 'WITHDRAWAL', 'TRANSFER' ]
		type inList: [ 'APPLICATION', 'APPROVAL', 'PERIODIC', 'PENALTY', 'TRANSACTION', 'OTHER' ], blank: false
		frequency inList: [ 'ONCE OFF', '30 DAYS', '60 DAYS', '90 DAYS', '180 DAYS', '360 DAYS' ]
		appliesTo inList: [ 'ALL CLIENTS','INDIVIDUAL', 'GROUP', 'CORPORATE' , 'LOANS' ]
		amount scale: 2, validator: { it > 0 }
		gLCode nullable: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
	}
	
	String toString() { "${name} ${amount}" }
	
}
