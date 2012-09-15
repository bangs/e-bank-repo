package zw.co.quantum.legend.model

import zw.co.quantum.legend.auth.User;

class Transaction {

	Date valueDate
	String reference
	String sourceAccountNo
	String sourceAccountType
	String sourceAccountClass	//Source Entity Name
	String destinationAccountNo
	String destinationAccountType
	String destinationAccountClass	//Destination Entity Name
	String paymentRef
	PaymentType paymentType
	String type
	String narrative
	String gLCode
	User initiator
	User approver
	BigDecimal amount
	String status
	Date dateCreated
	Date lastUpdated
		
	static hasMany = [ postings: Posting ]
	
	static mapping = {
		sort valueDate:'asc'
	}
	
    static constraints = {
		valueDate nullable: false
		reference nullable: false, maxSize: 30, unique: true
		sourceAccountNo maxSize: 30
		sourceAccountType maxSize: 50
		sourceAccountClass	maxSize: 60
		destinationAccountNo maxSize: 30
		destinationAccountType maxSize: 50
		destinationAccountClass maxSize: 60
		paymentRef maxSize: 30
		paymentType nullable: true
		type inList: [
			'PRINCIPAL',
			'INTEREST',
			'FEE',
			'PENALTY',
			'INSTALLMENT',
			'ADJUSTMENT',
			'DEPOSIT',
			'WITHDRAWAL',
			'PAYMENT'
		]
		narrative maxSize: 120
		gLCode nullable: false
		initiator nullable: true
		approver nullable: true
		amount scale: 2
		status inList: [ 'DRAFT', 'SUCCESSFUL', 'FAILED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() {
		reference
	}
}
