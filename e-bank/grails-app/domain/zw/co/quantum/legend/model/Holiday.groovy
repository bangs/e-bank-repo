package zw.co.quantum.legend.model

class Holiday {

	Institution institution
	String name
	Date startDate
	Date endDate
	String repaymentRule 
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		institution nullable: false
		name blank: false, maxSize: 40
		startDate nullable: false
		endDate nullable: false
		repaymentRule inList: [
				'SAME DAY', 
				'NEXT REPAYMENT', 
				'NEXT WORKING DAY', 
				'MORATORIUM' 
			]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
}
