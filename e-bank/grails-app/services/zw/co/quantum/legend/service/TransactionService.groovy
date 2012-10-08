package zw.co.quantum.legend.service

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.model.*;
import zw.co.quantum.legend.sys.Config;
import zw.co.quantum.legend.util.*

class TransactionService {

    static transactional = true
	
	def springSecurityService

    Response postTransaction(
		FinancialAccount sourceAccount, FinancialAccount destinationAccount, 
			BigDecimal amount, String transactionType, String paymentRef, String narrative, Date valueDate) {
			
		def transaction
		
		try {
		
			transaction = new Transaction(
				sourceAccountNo: sourceAccount.accountNumber, 
				sourceAccountType: sourceAccount.getAccountType(),
				sourceAccountClass: sourceAccount.class.simpleName,
				destinationAccountNo: destinationAccount.accountNumber,
				destinationAccountType: destinationAccount.getAccountType(),
				destinationAccountClass: destinationAccount.class.simpleName,
				amount: amount, 
				type: transactionType, 
				paymentRef: paymentRef, 
				narrative: narrative ?: transactionType, 
				valueDate: valueDate ?: new Date(),
				reference: Config.getInstance().getNextTxReference().toString(),
				gLCode: GLCode.findByType(transactionType)?.code,
				initiator: User.get(springSecurityService.principal.id),
				status: Constants.TX_STATUS_DRAFT
			)
			
			return this.postTransaction(transaction)
			
		} catch (Exception e) {
		
			println e.getMessage()
						
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				'Exception occured populating transaction. Transaction aborted.',
				transaction
			)
		}
		
    }
			
	private Response postTransaction(Transaction transaction) {
		
		try {
			
			if (!transaction.save()) {
				
				transaction.errors.allErrors.each { println it }
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					'Error occured saving transaction. Transaction aborted.',
					transaction
				)
				 
			}
			
			Response debitResponse = this.postDebitEntry(transaction)
			
			if (!debitResponse.isSuccess()) {
				
				transaction?.delete(flush: true)	
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					'Error occured posting debit entry. Transaction rolled back.',
					transaction
				)
				
			}
			
			Response creditResponse = this.postCreditEntry(transaction)
			
			if (!creditResponse.isSuccess()) {
				
				Posting debitEntry = (Posting) debitResponse.principal
				Posting.get(debitEntry.id).delete(flush: true)
				
				transaction?.delete(flush: true)
				
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					'Error occured posting credit entry. Transaction rolled back.',
					transaction
				)
				
			}
			
			transaction.status = Constants.TX_STATUS_SUCCESSFUL
			transaction.save(flush: true)
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				'Transaction successful',
				transaction
			)
							
		} catch (Exception e) {
			
			println '########' + e.getMessage()
			
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				'Error occured performing postings/rollback. Manual resolution may be necessary.',
				transaction
			)
			
		}
	}
	
	private Response postDebitEntry(Transaction transaction) {
		
		def debitEntry = new Posting(
			valueDate: transaction.valueDate,
			transaction: transaction,
			accountNumber: transaction.sourceAccountNo,
			narrative: transaction.narrative,
			type: Constants.POSTING_TYPE_DR,
			amount: transaction.amount,
			balance: FinancialAccount.findByAccountNumber(transaction.sourceAccountNo).getBalance()	- transaction.amount
		)
					
		if (!debitEntry.save()) {
			
			debitEntry.errors.allErrors.each { println it }
			
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				'Error debiting source account. Posting failed.',
				debitEntry
			)
			
		}
		
		return new Response(
			Constants.RESPONSE_TYPE_SUCCESS,
			'Debit successful',
			debitEntry
		)
		
	}
	
	private Response postCreditEntry(Transaction transaction) {
		
		def creditEntry = new Posting(
			valueDate: transaction.valueDate,
			transaction: transaction,
			accountNumber: transaction.destinationAccountNo,
			narrative: transaction.narrative,
			type: Constants.POSTING_TYPE_CR,
			amount: transaction.amount,
			balance: FinancialAccount.findByAccountNumber(transaction.destinationAccountNo).getBalance() + transaction.amount
		)
					
		if (!creditEntry.save()) {
			
			creditEntry.errors.allErrors.each { println it }
			
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				'Error crediting destination account. Posting failed.',
				creditEntry
			)
			
		}
		
		return new Response(
			Constants.RESPONSE_TYPE_SUCCESS,
			'Credit successful',
			creditEntry
		)
		
	}
	
	
}
