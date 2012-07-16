package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User

class LoanAccount extends FinancialAccount {

	LoanProduct product
	String groupAccountType
	User loanOfficer
	
	BigDecimal amount
	BigDecimal interestRate
	Integer numOfInstallments
	Integer repaymentsGracePeriod
	Date disbursalDate
	
	Fund sourceOfFunds
	String purposeOfLoan
	
	CollateralType collateralType
	String collateralNotes
	String guarantorDetails
	String externalId
	
	String type
	String standing
	String status
	
	static belongsTo = [ LoanProduct ]
	
	static hasMany = [ repaymentSchedules: RepaymentSchedule ]

	static constraints = {
		product nullable: false
		loanOfficer nullable: false
		groupAccountType inList: [ 'NONE', 'GROUP', 'INDIVIDUAL' ], maxSize: 30
		amount scale: 2, validator: { it > 0 }
		interestRate validator: { it > 0 }
		numOfInstallments validator: { it >= 0 }
		repaymentsGracePeriod validator: { it >= 0 }
		disbursalDate nullable: true
		sourceOfFunds nullable: false
		purposeOfLoan maxSize: 80
		collateralType nullable: false
		collateralNotes maxSize: 160
		guarantorDetails maxSize: 160
		externalId maxSize: 30
		type inList: [ 'LOAN' ], nullable: false, maxSize: 30
		standing inList: [ 'GOOD', 'IN ARREARS', 'BAD' ], maxSize: 30
		status inList: [ 
			'DRAFT', 
			'PENDING APPROVAL',
			'PENDING DISBURSEMENT',
			'ACTIVE',
			'REJECTED',
			'CLOSED',
			'DELETED'
		 ], maxSize: 30
		
    }
	
	def getAccountType() {
		type
	}
	
	def getInstanceClass() {
		this.class
	}
		
}
