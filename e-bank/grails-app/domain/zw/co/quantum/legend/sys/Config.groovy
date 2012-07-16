package zw.co.quantum.legend.sys

class Config {

	Boolean initializationPerformed
	
	BigInteger txRefCounter
	Integer txRefSequence
	
	BigInteger accountNoCounter
	Integer accountNoSequence
	
	BigInteger clientNoCounter
	Integer clientNoSequence
	
	Date	dateCreated
	Date	lastUpdated
	
    static mapping = {
    }
    
	static constraints = {
		initializationPerformed nullable: false
		txRefCounter validator: { it > 0 }
		txRefSequence validator: { it > 0 }
		accountNoCounter validator: { it > 0 }
		accountNoSequence validator: { it > 0 }
		clientNoCounter validator: { it > 0 }
		clientNoSequence validator: { it > 0 }
		dateCreated()
		lastUpdated()
    }
	
	static Config getInstance() {
		return Config.list().get(0)
	}
	
	def getNextTxReference() { 
		txRefCounter += txRefSequence
		this.save(flush: true)
		txRefCounter 
	}
	
	def getNextAccountNo() { 
		accountNoCounter += accountNoSequence 
		this.save(flush: true)
		accountNoCounter
	}
	
	def getNextClientNo() { 
		clientNoCounter += clientNoSequence 
		this.save(flush: true)
		clientNoCounter
	}
	
}
