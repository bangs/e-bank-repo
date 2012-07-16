package zw.co.quantum.legend.model

class RepaymentSchedule {

	Integer installmentNo
	LoanAccount loanAccount
	Date dueDate
	BigDecimal principal
	BigDecimal interest
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ LoanAccount ]
	
	static mapping = {
		sort installmentNo:'asc'
	}
	
    static constraints = {
		installmentNo validator: { it > 0 }, nullable: false
		dueDate nullable: false
		principal scale: 2, validator: { it >= 0 }
		interest scale: 2, validator: { it >= 0 }
		dateCreated()
		lastUpdated()
    }
}
