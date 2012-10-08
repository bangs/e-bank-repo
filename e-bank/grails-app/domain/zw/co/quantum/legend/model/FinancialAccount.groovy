package zw.co.quantum.legend.model

abstract class FinancialAccount {

	static auditable = true
	
	Branch branch
	String accountNumber
	String accountName
	String ownerId
	String ownerClass	//Owner Entity Name
	String ownerType
	String superType
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ Branch ]
	
    static mapping = {
		tablePerHierarchy: false
		sort accountNumber:'asc'
    }
    
	static constraints = {
		branch nullable: false
		accountNumber blank: false, maxSize: 30, unique: true
		accountName maxSize: 100
		ownerId nullable: false, maxSize: 30
		ownerClass nullable: false, maxSize: 60
		ownerType maxSize: 30
		superType inList: [ 'LOAN', 'SAVINGS', 'SYSTEM' ], blank: false, maxSize: 30
		dateCreated()
		lastUpdated()
    }
	
	def abstract getAccountType();
	def abstract getInstanceClass();
	
	String toString() { accountNumber }
	
	def getBalance() {
		
		def latestPosting = Posting.findByAccountNumber(accountNumber, [sort:'dateCreated', order:'desc'])
		
		if (latestPosting) {
			return latestPosting.balance
		}
		
		return 0.0
		
	}
	
}
