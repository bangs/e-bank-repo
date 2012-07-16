package zw.co.quantum.legend.model

class PaymentType {

	Institution institution
	
	String name
	String status
	
	Date dateCreated
	Date lastUpdated
	
    static mapping = {
		sort name:'asc'
    }
    
	static constraints = {
		institution nullable: false
		name inList: [ 'CASH', 'CHEQUE', 'VOUCHER' ]
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
	}
	
	/*
	 * Methods of the Domain Class
	 */
}
