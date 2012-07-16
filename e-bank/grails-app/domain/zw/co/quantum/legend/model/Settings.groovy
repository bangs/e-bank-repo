package zw.co.quantum.legend.model

class Settings {

	static auditable = true
	
	Institution institution
	
	//Fiscal Year
	String startOfWeek
	String offDays
	String baseCurrency
	String customCurrency
	
	//Accounting rules
	BigDecimal minimumInterest
	BigDecimal maximumInterest
	Integer interestDays
	BigDecimal minimumIndebtnessRatio
	BigDecimal maximumIndebtnessRatio
	Boolean allowInstallmentsAboveAmountDue
	Boolean allowInstallmentsBelowAmountDue
	
	//Client Rules
	Boolean groupLoansAllowed
	Boolean ageCheckEnabled
	Integer minimumNewClientAge
	Integer maximumNewClientAge
	
	//Miscellaneous
	Integer sessionTimeoutMinutes
	Integer batchJobSize
	BigDecimal maxDisbursalLimit
	String uploadStorageDirectory
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		institution nullable: false
		startOfWeek inList: [ 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
		offDays inList: [ 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
		baseCurrency inList: [ 'USD', 'GBP', 'ZAR', 'ZWD', 'CUSTOM' ]
		customCurrency maxSize: 5, nullable: true
		minimumInterest scale: 2, validator: { it >= 0 }
		maximumInterest scale: 2, validator: { maxInterest, settings ->
			maxInterest > settings.minimumInterest 
		}
		interestDays inList: [ 365, 360 ], blank: false
		minimumIndebtnessRatio validator: { it >= 0 }
		maximumIndebtnessRatio validator: { maxRatio, settings -> 
			maxRatio > settings.minimumIndebtnessRatio 
		}
		minimumNewClientAge validator: { it > 0 }
		maximumNewClientAge validator: { maxAge, settings -> 
			maxAge > settings.minimumNewClientAge 
		}
		sessionTimeoutMinutes range: 30..180
		batchJobSize validator: { it > 0 }
		maxDisbursalLimit scale: 2, validator: { it > 0 }
		uploadStorageDirectory maxSize: 250, nullable: true
		dateCreated()
		lastUpdated()
    }
	
	static Settings getInstance() {
		Settings.list()?.get(0)
	}
		
}
