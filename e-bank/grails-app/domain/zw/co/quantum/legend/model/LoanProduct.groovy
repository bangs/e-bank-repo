package zw.co.quantum.legend.model

class LoanProduct extends Product {
	
	Boolean includeInLoanCycleCounter
	Boolean canWaiveInterestOnLoanRepayment
	
	//Loan Amount
	BigDecimal minLoanAmount
	BigDecimal defaultLoanAmount
	BigDecimal maxLoanAmount
	
	//Interest Rate
	String interestRateType
	BigDecimal minInterestRate
	BigDecimal defaultInterestRate
	BigDecimal maxInterestRate
	
	//Repayment Schedule Settings
	Boolean fixedRepaymentSchedule
	Boolean compareWithCashFlow 
	String frequencyOfInstallments
	Integer recurInstallmentEvery
	String gracePeriodType
	Integer gracePeriodDuration
	
	//GLCodes
	GLCode interestGLCode
	GLCode principalGLCode
		
	static hasMany = [ loanAccounts: LoanAccount ]
	
    static constraints = {
		minLoanAmount scale: 2, validator: { it > 0 }
		defaultLoanAmount scale: 2, validator: { defaultAmt, loanProduct ->
			defaultAmt >= loanProduct.minLoanAmount 
		}
		maxLoanAmount scale: 2, validator: { maxAmt, loanProduct ->
			maxAmt >= loanProduct.defaultLoanAmount 
		}
		interestRateType inList: [
				'FLAT',
				'DECLINING BALANCE',
				'DECLINING BALANCE EMI',
				'DECLINING BALANCE EPI'
			], blank: false
		minInterestRate validator: { it > 0 }
		defaultInterestRate validator: { defaultRate, loanProduct ->
			defaultRate >= loanProduct.minInterestRate 
		}
		maxInterestRate validator: { maxRate, loanProduct ->
			maxRate >= loanProduct.defaultInterestRate 
		}
		frequencyOfInstallments inList: [ 'MONTHS', 'WEEKS' ]
		recurInstallmentEvery validator: { it > 0 }
		gracePeriodType inList: [ 'NONE', 'ALL REPAYMENTS', 'PRINCIPAL']
		gracePeriodDuration validator: { it >= 0 }
		interestGLCode nullable: false
		principalGLCode nullable: false		
    }
		
}
