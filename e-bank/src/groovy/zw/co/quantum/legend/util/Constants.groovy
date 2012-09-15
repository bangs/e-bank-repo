package zw.co.quantum.legend.util

class Constants {
	
	static final String BRANCH_TYPE_HEAD_OFFICE = 'HO'
	
	//Response Codes
	static final String RESPONSE_TYPE_SUCCESS = 'SUCCESSFUL'
	static final String RESPONSE_TYPE_FAILURE = 'FAILED'
	
	//Client Types
	static final String CLIENT_TYPE_INDIVIDUAL = 'INDIVIDUAL'
	static final String CLIENT_TYPE_GROUP = 'GROUP'
	static final String CLIENT_TYPE_CORPORATE = 'CORPORATE'
	
	//Statuses
	static final String STATUS_ACTIVE = 'ACTIVE'
	static final String STATUS_PENDING_APPROVAL = 'PENDING APPROVAL'
	static final String STATUS_SUSPENDED = 'SUSPENDED'
	static final String STATUS_BLACKLISTED = 'BLACKLISTED'
	static final String STATUS_DELETED = 'DELETED'
	static final String STATUS_PENDING_DISBURSEMENT = 'PENDING DISBURSEMENT'

	
	//Tx Types
	static final String TX_TYPE_PRINCIPAL = 'PRINCIPAL'
	static final String TX_TYPE_INTEREST = 'INTEREST'
	static final String TX_TYPE_FEE = 'FEE'
	static final String TX_TYPE_PENALTY = 'PENALTY'
	static final String TX_TYPE_INSTALLMENT = 'INSTALLMENT'
	static final String TX_TYPE_ADJUSTMENT = 'ADJUSTMENT'
	static final String TX_TYPE_DEPOSIT = 'DEPOSIT'
	static final String TX_TYPE_WITHDRAWAL = 'WITHDRAWAL'
	
	//Posting Types
	static final String POSTING_TYPE_DR = 'DR'
	static final String POSTING_TYPE_CR = 'CR'
	
	//Fee Tx Types
	static final String FEE_TX_TYPE_NONE = 'NONE'
	static final String FEE_TX_TYPE_WITHDRAWAL = 'WITHDRAWAL'
	static final String FEE_TX_TYPE_TRANSFER = 'TRANSFER'
	
	//Fee Types
	static final String FEE_TYPE_APPLICATION = 'APPLICATION'
	static final String FEE_TYPE_APPROVAL = 'APPROVAL'
	
	//Fee Applies To 
	static final String FEE_APPLIES_TO_ALL_CLIENTS = 'ALL CLIENTS'
	static final String FEE_APPLIES_TO_INDIVIDUAL_CLIENTS = 'INDIVIDUAL'
	static final String FEE_APPLIES_TO_GROUP_CLIENTS = 'GROUP'
	static final String FEE_APPLIES_TO_CORPORATE_CLIENTS = 'CORPORATE'
	static final String FEE_APPLIES_TO_LOANS = 'LOANS'
	
	//Fee frequency
	static final String FEE_FREQUENCY_ONCE_OFF = 'ONCE OFF'
	
	//Financial Account Super Types
	static final String FINANCIAL_ACCOUNT_SUPER_TYPE_LOAN = 'LOAN'
	static final String FINANCIAL_ACCOUNT_SUPER_TYPE_SAVINGS = 'SAVINGS'
	static final String FINANCIAL_ACCOUNT_SUPER_TYPE_SYSTEM = 'SYSTEM'
	
	//LoanAccount Standing
	static final String LOAN_ACCOUNT_STANDING_GOOD = 'GOOD'
	static final String LOAN_ACCOUNT_STANDING_BAD = 'BAD'
	static final String LOAN_ACCOUNT_STANDING_IN_ARREARS = 'IN ARREARS'
	
	//Account Types
	static final String ACCOUNT_TYPE_LOAN = 'LOAN'
	static final String ACCOUNT_TYPE_SAVINGS = 'SAVINGS'
	static final String ACCOUNT_TYPE_CURRENT = 'CURRENT'
	static final String ACCOUNT_TYPE_LOAN_FUNDING = 'LOAN FUNDING'
	static final String ACCOUNT_TYPE_BRANCH_CASH = 'BRANCH CASH'
	
	//Tx Statuses
	static final String TX_STATUS_DRAFT = 'DRAFT'
	static final String TX_STATUS_SUCCESSFUL = 'SUCCESSFUL'
	static final String TX_STATUS_FAILED = 'FAILED'
	
	//Interest Rate Types
	static final String INTEREST_RATE_TYPE_FLAT = 'FLAT'
	static final String INTEREST_RATE_TYPE_DECLINING_BALANCE = 'DECLINING BALANCE'
	static final String INTEREST_RATE_TYPE_DECLINING_BALANCE_EPI = 'DECLINING BALANCE EPI'
	static final String INTEREST_RATE_TYPE_DECLINING_BALANCE_EMI = 'DECLINING BALANCE EMI'
	
	//Loan Product
	static final String LOAN_PRODUCT_INSTALLMENT_FREQUENCY_MONTHS = 'MONTHS'
	static final String LOAN_PRODUCT_INSTALLMENT_FREQUENCY_WEEKS = 'WEEKS'
	
	
}
