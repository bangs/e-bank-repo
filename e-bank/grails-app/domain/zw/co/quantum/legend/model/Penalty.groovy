package zw.co.quantum.legend.model

class Penalty {

	static auditable = true
	
	Institution institution
	String name
	String appliesTo
	String gracePeriodType
	Integer gracePeriodDuration
	BigDecimal minCumulativeLimit
	BigDecimal maxCumulativeLimit
	BigDecimal amount
	String frequency
	GLCode gLCode
	String status
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ appliedPenalties: AppliedPenalty ]
	
	static mapping = {
		sort name:'asc'
	}
	static constraints = {
		institution nullable: false
		name blank: false, maxSize: 80
		appliesTo inList: [ 'LOANS', 'SAVINGS' ]	
		gracePeriodType inList: [ 'NONE', 'DAYS', 'INSTALLMENTS' ]
		gracePeriodDuration validator: { it >= 0 }
		minCumulativeLimit scale:2, validator: { it >= 0 }
		maxCumulativeLimit scale:2, validator: { max, penalty -> 
			max > penalty.minCumulativeLimit 
		}
		amount scale:2, validator: { it > 0 }
		frequency inList: [ 'NONE', 'DAILY', 'WEEKLY', 'MONTHLY' ]
		gLCode nullable: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
	}
	
	String toString() { name }
	
}
