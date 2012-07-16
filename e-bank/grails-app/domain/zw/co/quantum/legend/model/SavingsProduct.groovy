package zw.co.quantum.legend.model

class SavingsProduct extends Product {
		
	//Targeted Deposit And Withdrawal Restrictions
	String typeOfDeposits
	BigDecimal recommendedDepositAmount	
	BigDecimal maxAmountPerWithdrawal
	
	//Interest Rate Details
	BigDecimal interestRate
	String interestCalculationBalance
	Integer interestCalculationTimePeriod
	Integer interestPostingFrequency
	BigDecimal minInterestCalculationBalance
	
	//GLCodes
	GLCode depositGLCode
	GLCode interestGLCode
			
	static hasMany		= [ savingsAccounts: SavingsAccount ]	

    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		typeOfDeposits inList: [ 'MANDATORY', 'VOLUNTARY' ]
		recommendedDepositAmount scale: 2, validator: { it >= 0 }
		maxAmountPerWithdrawal scale: 2, validator: { it > 0 }
		interestRate scale: 2, validator: { it >= 0 }
		interestCalculationBalance inList: [ 'MINIMUM BALANCE', 'AVERAGE BALANCE' ], blank: false
		interestCalculationTimePeriod validator: { it > 0 }
		interestPostingFrequency validator: { it > 0 }
		minInterestCalculationBalance scale: 2, validator: { it > 0 }
		depositGLCode nullable: false
		interestGLCode nullable: false
    }
		
}
