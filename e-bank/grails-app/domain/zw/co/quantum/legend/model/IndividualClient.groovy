package zw.co.quantum.legend.model

import java.util.Date;

import zw.co.quantum.legend.auth.User;

class IndividualClient extends Client {

	static auditable = true
	
	//Personal
	String salutation
	String lastName
	String firstName
	Date dateOfBirth
	String maritalStatus
	String gender
	String nationalId
	String citizenship
	 
	//Employment
	String companyName
	Address companyAddress
	
	//Next Of Kin
	String nextOfKinName
	Address nextOfKinAddress
	
	String photoPath
	
	static belongsTo = [ ClientGroup ]
	
	static hasMany = [ groups: ClientGroup ]
			
    static constraints = {
		salutation inList: [ 'Mr', 'Mrs', 'Miss', 'Ms'], blank: false
		lastName blank: false, maxSize: 60
		firstName blank: false, maxSize: 60
		dateOfBirth blank: false
		maritalStatus inList: [ 'SINGLE', 'MARRIED', 'WIDOWED' ], blank: false
		gender inList: [ 'M', 'F' ], blank: false
		nationalId blank: false, maxSize: 20
		citizenship blank: false, maxSize: 50
		companyName blank: false, maxSize: 100
		companyAddress nullable: false
		nextOfKinName blank: false, maxSize: 100
		nextOfKinAddress nullable: false
		photoPath nullable: true
    }
	
	String toString() { "${lastName} ${firstName}" }
	
	String getClientName() { toString() }
	
}
