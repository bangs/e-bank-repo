package zw.co.quantum.legend.model

import java.util.Date;

class ProductCategory {

	Institution institution
	String name
	String description
	String type
	String status
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		name blank: false, maxSize: 100
		description maxSize: 160, nullable: true
		type inList: [ 'LOAN', 'SAVINGS' ], blank: false
		status inList: [ 'ACTIVE', 'REMOVED' ]
		dateCreated()
		lastUpdated()
    }
	
	String toString() { name }
	
}
