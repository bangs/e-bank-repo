package zw.co.quantum.legend.auth

class Requestmap {
	
	static auditable = true 

	String url
	String configAttribute

	static mapping = {
		cache true
	}

	static constraints = {
		url blank: false, unique: true
		configAttribute blank: false
	}
	
}
