package zw.co.quantum.legend.model

class LatenessDormancyDef {

	static auditable = true
	
	Institution institution

	Integer lateLoanRepaymentGracePeriod
	
	Integer dormantSavingsAccGracePeriod
	
	String status
	
	Date	dateCreated
	Date	lastUpdated
	
    static mapping = {
		sort dateCreated:'asc'
    }
    
	static constraints = {
		institution nullable: false
		lateLoanRepaymentGracePeriod validator: { it >= 0 }
		dormantSavingsAccGracePeriod validator: { it >= 0 }
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
		
}
