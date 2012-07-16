package zw.co.quantum.legend.service

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.model.*;
import zw.co.quantum.legend.sys.Config;
import zw.co.quantum.legend.util.Constants;
import zw.co.quantum.legend.util.DateUtil;
import zw.co.quantum.legend.util.Response;

class ClientService {

    static transactional = true
	
	def springSecurityService
	
	def transactionService
	
	Response registerClient(Client client) {
		
		User user = User.get(springSecurityService.principal.id)
		
		client.status = Constants.STATUS_PENDING_APPROVAL
		client.registeredBy = user
		client.branch = user.branch
		client.clientNo = Config.getInstance().getNextClientNo()
		
		if (client instanceof IndividualClient) {
		
			IndividualClient individualClient = (IndividualClient) client	
			
			individualClient.type = Constants.CLIENT_TYPE_INDIVIDUAL
			
			if (!clientAgeIsValid(individualClient)) {
				
				def settings = Settings.getInstance()
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"ERROR: Client age is not in the range ${settings.minimumNewClientAge} - ${settings.maximumNewClientAge}",
					individualClient
				)
				
			}
						
			if (!individualClient.save(flush: true)) {
				
				individualClient.errors.allErrors.each { println it }
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Failed to save client",
					individualClient
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Client ${individualClient.lastName} ${individualClient.firstName} registered successfully and is ${individualClient.status}",
				individualClient
			)
			
		} else if (client instanceof CorporateClient) {
			
			CorporateClient corporateClient = (CorporateClient) client
			
			corporateClient.type = Constants.CLIENT_TYPE_CORPORATE
			
			if (!corporateClient.save(flush: true)) {
				
				corporateClient.errors.allErrors.each { println it }
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Failed to save client",
					corporateClient
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Client ${corporateClient.name} registered successfully and is ${corporateClient.status}",
				corporateClient
			)
			
		} else if (client instanceof ClientGroup) {
		
			ClientGroup clientGroup = (ClientGroup) client
			
			clientGroup.type = Constants.CLIENT_TYPE_GROUP
			
			if (!clientGroup.save(flush: true)) {
				
				clientGroup.errors.allErrors.each { println it }
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Failed to save client group",
					clientGroup
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Client group ${clientGroup.name} registered successfully and is ${clientGroup.status}",
				clientGroup
			)
		
		} else {
		
			return null
			
		}
	}
		
	Boolean clientAgeIsValid(IndividualClient individualClient) {
		
		Settings settings = Settings.getInstance()
		
		if (settings?.ageCheckEnabled) {
		
			println('Age Check Is Enabled..')
			
			Date dateOfBirth = individualClient.dateOfBirth
			
			Date maxDOB = DateUtil.addYearsToDate(new Date(), -settings.minimumNewClientAge)
			Date minDOB = DateUtil.addYearsToDate(new Date(), -settings.maximumNewClientAge)
			
			if (minDOB.time <= dateOfBirth.time && dateOfBirth.time <= maxDOB.time) {
				log.debug('Age check successful.. proceed')
			} else {
				return false
			}
			
		}
		
		return true
		
	}
	
	public Client populateAddresses(Client client, Map paramMap) {
		
		if (client instanceof IndividualClient) {
		
			IndividualClient individualClient = (IndividualClient) client
			
			individualClient.address = new Address(
				street: paramMap.street[0],
				suburb: paramMap.suburb[0],
				city: paramMap.city[0],
				country: paramMap.country[0],
				telephone: paramMap.telephone[0]
			).save(flush: true)
					
			individualClient.companyAddress = new Address(
				street: paramMap.street[1],
				suburb: paramMap.suburb[1],
				city: paramMap.city[1],
				country: paramMap.country[1],
				telephone: paramMap.telephone[1]
			).save(flush: true)
			
			individualClient.nextOfKinAddress = new Address(
				street: paramMap.street[2],
				suburb: paramMap.suburb[2],
				city: paramMap.city[2],
				country: paramMap.country[2],
				telephone: paramMap.telephone[2]
			).save(flush: true)
		
		} else {
		
			client.address = new Address(
				street: paramMap.street,
				suburb: paramMap.suburb,
				city: paramMap.city,
				country: paramMap.country,
				telephone: paramMap.telephone
			).save(flush: true)
					
		}
		
		return client
		
	}
	
	List<Fee> getOnceOffClientFees(Client client, String transactionType, String feeType) {
		
		Fee.withCriteria { 
			
			eq('type', feeType)
			eq('frequency', Constants.FEE_FREQUENCY_ONCE_OFF)
			eq('status', Constants.STATUS_ACTIVE)
			eq('transactionType', transactionType)
				
			and {				
				eq('appliesTo', client.type)
				or {
					eq('appliesTo', Constants.FEE_APPLIES_TO_ALL_CLIENTS)
				}
			}

		}
		
	}
	
	FinancialAccount populateClientInfo(FinancialAccount financialAccount, BigInteger clientNo ) {
		
		Client client = Client.findByClientNo(clientNo)
		financialAccount.accountName = client.getClientName()
		financialAccount.ownerId = client.clientNo
		financialAccount.ownerType = client.getType()
		financialAccount.ownerClass = client.class.simpleName
		
		return financialAccount
		
	}
	
}
