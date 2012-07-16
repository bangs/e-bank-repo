package zw.co.quantum.legend.model

import java.util.Date;

import zw.co.quantum.legend.auth.User;

abstract class Client {
		
	static auditable = true
	
	String type
	BigInteger clientNo
	
	//Contacts
	String mobile
	String email
	Address address
	
	User registeredBy
	Branch branch
	
	String status
	
	Date dateCreated
	Date lastUpdated
	
	
	static mapping = {
		tablePerHierarchy: false
	}
	
	static constraints = {
		type inList: [ 'INDIVIDUAL', 'GROUP', 'CORPORATE' ], blank: false
		clientNo unique:true
		mobile maxSize: 20
		email email: true, maxSize: 120
		address nullable: false
		registeredBy nullable: false
		branch nullable: false
		status inList: [ 'ACTIVE', 'PENDING APPROVAL', 'SUSPENDED', 'BLACKLISTED', 'DELETED' ]
		dateCreated()
		lastUpdated()
	}
	
	abstract String getClientName();
	
}
