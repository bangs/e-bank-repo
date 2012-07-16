package zw.co.quantum.legend.model

class SavingsAccount extends FinancialAccount {
	
	SavingsProduct product
	String groupAccountType
	String type
	String status
	
	static belongsTo	= [ SavingsProduct ]	// tells GORM to delete this object if the "parent" is deleted.
	
	static constraints = {
		product nullable: false
		groupAccountType inList: [ 'NONE', 'GROUP', 'INDIVIDUAL' ], maxSize: 30
		type inList: [ 'SAVINGS', 'CURRENT', 'TERM DEPOSITS', 'OVERDRAFT' ], blank: false, maxSize: 30
		status inList: [ 
			'DRAFT', 
			'PENDING APPROVAL',
			'ACTIVE',
			'REJECTED',
			'CLOSED',
			'DELETED'
		 ], maxSize: 30
    }
	
	def getAccountType() {
		return type
	}
	
	def getInstanceClass() {
		this.class
	}
		
}
