package zw.co.quantum.legend.model

class SystemAccount extends FinancialAccount {

	String type
	String description
	
    static mapping = {
    }
    
	static constraints = {
		type inList: [ 'LOAN FUNDING' ], maxSize: 30
    }
	
	def getAccountType() {
		return type
	}
	
	def getInstanceClass() {
		this.class
	}
	
}
