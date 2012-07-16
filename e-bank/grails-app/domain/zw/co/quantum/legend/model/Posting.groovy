package zw.co.quantum.legend.model

class Posting {

	Transaction transaction
	String accountNumber
	String narrative
	String type
	BigDecimal amount
	BigDecimal balance
	
	Date valueDate
	Date dateCreated
	
	static belongsTo = [ transaction: Transaction ]
	
    static mapping = {
		sort dateCreated:'asc'
    }
    
	static constraints = {
		transaction nullable: false 
		accountNumber nullable: false, maxSize: 30
		narrative maxSize: 100
		type inList: [ 'DR', 'CR' ]
		amount scale: 2
		balance scale: 2
		valueDate nullable: false
		dateCreated()
    }
	
	static beforeInsert = {
		amount = ('CR'.equals(type))? amount : -amount 	//Elvis operator
	}
	
}
