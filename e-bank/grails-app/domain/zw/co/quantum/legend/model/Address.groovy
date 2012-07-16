package zw.co.quantum.legend.model

import java.util.Date;

class Address {

	static auditable = true
	
	String street
	String suburb
	String city
	String country
	String telephone
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		street blank: false, maxSize: 150
		suburb blank: false, maxSize: 100
		city blank: false, maxSize: 100
		country blank: false, maxSize: 100
		telephone blank: false, maxSize: 20
		dateCreated()
		lastUpdated()
    }
	
	String toString() { "${street} ${suburb}, ${city}" }
	
}
