package zw.co.quantum.legend.service

import zw.co.quantum.legend.auth.User;
import zw.co.quantum.legend.model.FinancialAccount;
import zw.co.quantum.legend.model.*;
import zw.co.quantum.legend.sys.Config;
import zw.co.quantum.legend.util.Constants;
import zw.co.quantum.legend.util.Response;

class AccountService {

    static transactional = true
	
	def springSecurityService
	
	def transactionService

    Response registerAccount(FinancialAccount financialAccount) {
		
		User user = User.get(springSecurityService.principal.id)
		
		financialAccount.branch = user.branch
		financialAccount.accountNumber = financialAccount.accountNumber ?: Config.getInstance().getNextAccountNo()
		
		if (financialAccount instanceof LoanAccount) {
			
			LoanAccount loanAccount = (LoanAccount) financialAccount
			
			loanAccount.loanOfficer = user
			loanAccount.type = Constants.ACCOUNT_TYPE_LOAN
			loanAccount.superType = Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_LOAN
			loanAccount.status = Constants.STATUS_PENDING_APPROVAL
			loanAccount.standing = Constants.LOAN_ACCOUNT_STANDING_GOOD
			
			if (!loanAccount.save()) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Error occured during account creation",
					loanAccount
				)
			}
			
			Response resp = this.generateRepaymentSchedule(loanAccount)
			
			if (!resp.isSuccess()) {
				
				return resp
				
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Loan account added successfully. The account number is ${loanAccount.accountNumber}",
				loanAccount
			)
			
		} else if (financialAccount instanceof SavingsAccount) {
		
			SavingsAccount savingsAccount = (SavingsAccount) financialAccount
			
			savingsAccount.superType = Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_SAVINGS
			savingsAccount.status = Constants.STATUS_PENDING_APPROVAL
			
			if (!savingsAccount.save(flush: true)) {
				savingsAccount.errors.allErrors.each { println it }
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Error occured during account creation",
					savingsAccount
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Savings account added successfully. The account number is ${savingsAccount.accountNumber}",
				savingsAccount
			)
		
		} else if (financialAccount instanceof SystemAccount) {
		
			SystemAccount systemAccount = (SystemAccount) financialAccount
			
			systemAccount.superType = Constants.FINANCIAL_ACCOUNT_SUPER_TYPE_SYSTEM
			
			if (!systemAccount.save(flush: true)) {
				systemAccount.errors.allErrors.each { println it }
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Error occured during account creation",
					systemAccount
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"System account added successfully. The account number is ${systemAccount.accountNumber}",
				systemAccount
			)
			
		} else {
		
		}
		
	}
	
	Response generateRepaymentSchedule(LoanAccount loanAccountInstance) {
		
		try {
		
			def interestType = loanAccountInstance.product.interestRateType
		
			switch (interestType) {
				case Constants.INTEREST_RATE_TYPE_FLAT: this.generateFlatInterestRateSchedule(loanAccountInstance); break
				case Constants.INTEREST_RATE_TYPE_DECLINING_BALANCE: this.generateDecliningBalanceSchedule(loanAccountInstance); break
				case Constants.INTEREST_RATE_TYPE_DECLINING_BALANCE_EPI: this.generateDecliningBalanceEqualPrincipalInstallmentSchedule(loanAccountInstance); break
				default: throw new Exception('Invalid Interest Type')
			}
			
		} catch (Exception e) {
		
			e.printStackTrace()
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured while generating repayment schedule. Operation aborted.",
				loanAccountInstance
			)
			
		}
		
		return new Response(
			Constants.RESPONSE_TYPE_SUCCESS,
			"Repayment schedule generated successfully.",
			loanAccountInstance
		)
		
	}
	
	def private generateFlatInterestRateSchedule(LoanAccount loanAccountInstance) {
		
		def interestDays = Settings.getInstance().interestDays
		def interestRate = loanAccountInstance.interestRate
		def principal = loanAccountInstance.amount
		def numberOfInstallments = loanAccountInstance.numOfInstallments
		def installmentFrequency = loanAccountInstance.product.frequencyOfInstallments
		def installmentRecurrence = loanAccountInstance.product.recurInstallmentEvery
		def repaymentGracePeriod = loanAccountInstance.repaymentsGracePeriod
		
		def repaymentPeriod = installmentRecurrence * numberOfInstallments
		
		def installmentGap = Constants.LOAN_PRODUCT_INSTALLMENT_FREQUENCY_MONTHS.equals(installmentFrequency)? 30 : 7
		
		def term = installmentGap * repaymentPeriod 
		
		def interest = principal * (interestRate / 100) * (term / interestDays)
		
		def principalInstallment = principal / numberOfInstallments
		def interestInstallment = interest / numberOfInstallments
		
		def installmentNo = 1
		def startDate = loanAccountInstance.disbursalDate?: new Date()
		def nextDate = Calendar.instance
		nextDate.time = startDate
		nextDate.set(Calendar.HOUR_OF_DAY, 0)
		nextDate.set(Calendar.MINUTE, 0)
		nextDate.set(Calendar.SECOND, 0)
		
		//check grace period
		if (repaymentGracePeriod > 0) {
			def gracePeriodInDays = installmentGap * repaymentGracePeriod
			nextDate.add(Calendar.DAY_OF_MONTH, gracePeriodInDays)
		}
		
		numberOfInstallments.times {
			
			nextDate.add(Calendar.DAY_OF_MONTH, installmentGap)
			
			//adjust for holidays & off days
			def adjustedDate = this.getDateAdjustedForHolidaysAndOffDays(nextDate.time, 1)
			nextDate.setTime(adjustedDate)
			
			def repaymentSchedule = new RepaymentSchedule(
				loanAccount: loanAccountInstance,
				installmentNo: installmentNo++,
				dueDate: nextDate.time,
				principal: principalInstallment,
				interest: interestInstallment,
			)
			
			if (!repaymentSchedule.save()) {
				repaymentSchedule.errors.allErrors.each { println it }
			}
			
			println "Generated for installment ${installmentNo-1}"
			
		}
	}
	
	def private generateDecliningBalanceSchedule(LoanAccount loanAccountInstance) {
		
		def interestDays = Settings.getInstance().interestDays
		def interestRate = loanAccountInstance.interestRate
		def principal = loanAccountInstance.amount
		def numberOfInstallments = loanAccountInstance.numOfInstallments
		def installmentFrequency = loanAccountInstance.product.frequencyOfInstallments
		def installmentRecurrence = loanAccountInstance.product.recurInstallmentEvery
		def repaymentGracePeriod = loanAccountInstance.repaymentsGracePeriod
		
		def repaymentPeriod = installmentRecurrence * numberOfInstallments
		
		def installmentGap = Constants.LOAN_PRODUCT_INSTALLMENT_FREQUENCY_MONTHS.equals(installmentFrequency)? 30 : 7
		
		def term = installmentGap * repaymentPeriod
								
		// emi = i*P / [1- (1+i)^-n]
		// i = l * r
		
		def i = (interestRate/100 * installmentGap/interestDays)
		
		def equalMonthlyInstallment =  (i * principal) / (1 - Math.pow((1 + i), -numberOfInstallments))

		println "EMI = ${equalMonthlyInstallment}"
		
		def totalPrincipalRepayed = 0
		def totalInterest = equalMonthlyInstallment * repaymentPeriod
		
		def installmentNo = 1
		def startDate = loanAccountInstance.disbursalDate?: new Date()
		def nextDate = Calendar.instance
		nextDate.time = startDate
		nextDate.set(Calendar.HOUR_OF_DAY, 0)
		nextDate.set(Calendar.MINUTE, 0)
		nextDate.set(Calendar.SECOND, 0)
		
		//check grace period
		if (repaymentGracePeriod > 0) {
			def gracePeriodInDays = installmentGap * repaymentGracePeriod
			nextDate.add(Calendar.DAY_OF_MONTH, gracePeriodInDays)
		}
		
		numberOfInstallments.times {
			
			nextDate.add(Calendar.DAY_OF_MONTH, installmentGap)
			
			//adjust for holidays & off days
			def adjustedDate = this.getDateAdjustedForHolidaysAndOffDays(nextDate.time, 1)
			nextDate.setTime(adjustedDate)
			
			def interestInstallment = (principal - totalPrincipalRepayed) * (interestRate / 100) * (installmentGap / interestDays)
			
			def principalInstallment = equalMonthlyInstallment - interestInstallment
						
			def repaymentSchedule = new RepaymentSchedule(
				loanAccount: loanAccountInstance,
				installmentNo: installmentNo++,
				dueDate: nextDate.time,
				principal: principalInstallment,
				interest: interestInstallment,
			)
			
			if (!repaymentSchedule.save()) {
				repaymentSchedule.errors.allErrors.each { println it }
			}
			
			totalPrincipalRepayed += principalInstallment
			
			println "Generated for installment ${installmentNo-1}"
			
		}
				
		println "Finished"
		
	}
	
	def private generateDecliningBalanceEqualPrincipalInstallmentSchedule(LoanAccount loanAccountInstance) {
		
		def interestDays = Settings.getInstance().interestDays
		def interestRate = loanAccountInstance.interestRate
		def principal = loanAccountInstance.amount
		def numberOfInstallments = loanAccountInstance.numOfInstallments
		def installmentFrequency = loanAccountInstance.product.frequencyOfInstallments
		def installmentRecurrence = loanAccountInstance.product.recurInstallmentEvery
		def repaymentGracePeriod = loanAccountInstance.repaymentsGracePeriod
		
		def repaymentPeriod = installmentRecurrence * numberOfInstallments
		
		def installmentGap = Constants.LOAN_PRODUCT_INSTALLMENT_FREQUENCY_MONTHS.equals(installmentFrequency)? 30 : 7
		
		def term = installmentGap * repaymentPeriod
								
		def principalInstallment = principal / numberOfInstallments
		def totalPrincipalRepayed = 0
		def totalInterest = 0
		
		def installmentNo = 1
		def startDate = loanAccountInstance.disbursalDate?: new Date()
		def nextDate = Calendar.instance
		nextDate.time = startDate
		nextDate.set(Calendar.HOUR_OF_DAY, 0)
		nextDate.set(Calendar.MINUTE, 0)
		nextDate.set(Calendar.SECOND, 0)
		
		//check grace period
		if (repaymentGracePeriod > 0) {
			def gracePeriodInDays = installmentGap * repaymentGracePeriod
			nextDate.add(Calendar.DAY_OF_MONTH, gracePeriodInDays)
		}
		
		numberOfInstallments.times {
			
			nextDate.add(Calendar.DAY_OF_MONTH, installmentGap)
			
			//adjust for holidays & off days
			def adjustedDate = this.getDateAdjustedForHolidaysAndOffDays(nextDate.time, 1)
			nextDate.setTime(adjustedDate)
			
			def interestInstallment = (principal - totalPrincipalRepayed) * (interestRate / 100) * (installmentGap / interestDays)
			
			def repaymentSchedule = new RepaymentSchedule(
				loanAccount: loanAccountInstance,
				installmentNo: installmentNo++,
				dueDate: nextDate.time,
				principal: principalInstallment,
				interest: interestInstallment,
			)
			
			if (!repaymentSchedule.save()) {
				repaymentSchedule.errors.allErrors.each { println it }
			}
			
			totalPrincipalRepayed += principalInstallment
			totalInterest += interestInstallment
			
			println "Generated for installment ${installmentNo-1}"
			
		}
				
		println 'Finished'
		
	}
	
	Date getDateAdjustedForHolidaysAndOffDays(Date date, Integer factor) {
		//factor is the increment factor i.e. 1 = forward, -1 = backward
		try {
			
			date = this.adjustForHolidays(date, factor)
			date = this.adjustForOffDays(date, factor)
			
			//if factor is negative readjust to cater for reverse dates [Sun, Sat] instead of [Sat, Sun]
			if (factor < 0) {
				date = this.adjustForOffDays(date, factor)
			}
			
		} catch (Exception e) {
			println "Error occured adjusting date for holidays and off days"
			println e
		}
		
		return date
		
	}
	
	Date adjustForHolidays(Date date, Integer factor) {
		
		println "Date before adjusting for holidays			: ${date}"
		
		def holidays = Holiday.withCriteria { between('startDate', date, new Date(year: 3000)) }
		
		holidays?.each { holiday ->
			if (date >= holiday.startDate && date <= holiday.endDate) {
				if ('SAME DAY'.equals(holiday.repaymentRule)) {
					//adjust same day for off days
					date = this.adjustForOffDays(date, factor)
				} else {
					//return next working day
					date = this.addDaysToDate(holiday.endDate, factor)
					//adjust working day for off days
					date = this.adjustForOffDays(date, factor)
				}
			}
		 }
				
		println "Date adjusted for holidays					: ${date}"
		
		return date
		
	}
	
	Date adjustForOffDays(Date date, Integer factor) {
		
		println "Date before adjusting for offDays				: ${date}"
		
		def settings = Settings.getInstance()
				
		if (!settings.offDays) {
			return date
		}
		
		def offDays = Arrays.asList(settings.offDays.replace(' ', '').split(","))
				
		def calendar = Calendar.getInstance()
		calendar.setTime(date)
		
		def day = this.getStringDay(calendar.get(Calendar.DAY_OF_WEEK))
					
		offDays?.each { String offDay ->
						
			if (offDay.equalsIgnoreCase(day)) {
				println 'day = offDay'
				calendar.add(Calendar.DAY_OF_MONTH, factor)
				day = this.getStringDay(calendar.get(Calendar.DAY_OF_WEEK))
			}
		}
		
		println "Date after adjusting for offDays				: ${calendar.time}"
		
		return calendar.getTime()
	}
	
	Date addDaysToDate(Date date, Integer days) {
		
		Calendar calendar = Calendar.getInstance()
		calendar.setTime(date)
		calendar.add(Calendar.DAY_OF_MONTH, days)
		
		return calendar.getTime()
	}
	
	String getStringDay(Integer day) {
		
		switch (day) {
			case 1: 'SUNDAY'; break;
			case 2: 'MONDAY'; break;
			case 3: 'TUESDAY'; break;
			case 4: 'WEDNESDAY'; break;
			case 5: 'THURSDAY'; break;
			case 6: 'FRIDAY'; break;
			case 7: 'SATURDAY'; break;
			default: '';
		}
	}
	
	Response disburseLoan(LoanAccount loanAccount) {
		
		try {
			
			RepaymentSchedule.findAllByLoanAccount(loanAccount)?.each { it.delete() }
			
			Response resp = this.generateRepaymentSchedule(loanAccount)
			
			if (!resp.isSuccess()) { 
				return resp 
			}
			
			def sourceAccount = SystemAccount.findByType(Constants.ACCOUNT_TYPE_LOAN_FUNDING)
			
			if (!sourceAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Loan funding account is not configured. Transaction aborted.",
					loanAccount
				)
			}
			
			def targetAccount = loanAccount
			def amount = loanAccount.amount
			def txType = Constants.TX_TYPE_PRINCIPAL
			def paymentRef = ""
			def narrative = "Loan disbursement"
			def valueDate = new Date()
			
			resp = transactionService.postTransaction(sourceAccount, targetAccount, amount, txType, paymentRef, narrative, valueDate)
			
			if (!resp.isSuccess()) { 
				return new Response (
					Constants.RESPONSE_TYPE_FAILURE,
					resp.message,
					loanAccount
				)
			}
			
			loanAccount.disbursalDate = new Date()
			loanAccount.status = Constants.STATUS_ACTIVE
			
			if (!loanAccount.save(flush: true)) {
				loanAccount.errors.allErrors.each { println it }
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Error occured during loan disbursement.",
					loanAccount
				)
			}
			
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Loan disbursed successfully.",
				loanAccount
			)
			
		} catch (Exception e) {
			
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during account creation",
				loanAccount
			)
			
		}
		
	}
	
	Response postPayment(LoanAccount loanAccount, Date transactionDate, BigDecimal amount, String modeOfPayment, String receiptNo) {
		
		try {		
		
			def sourceAccount = SystemAccount.findByTypeAndBranch(Constants.ACCOUNT_TYPE_BRANCH_CASH, loanAccount.branch)
			
			if (!sourceAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Branch cash account is not configured. Transaction aborted.",
					loanAccount
				)
			}
			
			def targetAccount = loanAccount
			def txType = Constants.TX_TYPE_INSTALLMENT
			def paymentRef = receiptNo
			def narrative = modeOfPayment
			def valueDate = transactionDate
			
			Response resp = transactionService.postTransaction(sourceAccount, targetAccount, amount, txType, paymentRef, narrative, valueDate)
			
			if (!resp.isSuccess()) {
				return new Response (
					Constants.RESPONSE_TYPE_FAILURE,
					resp.message,
					loanAccount
				)
			}
					
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Payment captured successfully.",
				loanAccount
			)
			
		} catch (Exception e) {
			
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during payment posting",
				loanAccount
			)
			
			
		}
	
	}
	
	Response postAdjustment(String sourceAccountNumber, String targetAccountNumber, BigDecimal amount, Date transactionDate, String narrative) {
		
		try {
			
			def txType = Constants.TX_TYPE_ADJUSTMENT
			def valueDate = transactionDate
			def paymentRef = ""
			
			def sourceAccount = FinancialAccount.findByAccountNumber(sourceAccountNumber)
			def targetAccount = FinancialAccount.findByAccountNumber(targetAccountNumber)
			
			if (!sourceAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Source account [${sourceAccountNumber}] not found.",
					sourceAccountNumber
				)
				
			}
			
			if (!targetAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Target account [${targetAccountNumber}] not found.",
					targetAccountNumber
				)
				
			}
			
			Response resp = transactionService.postTransaction(sourceAccount, targetAccount, amount, txType, paymentRef, narrative, valueDate)
			
			if (!resp.isSuccess()) {
				return new Response (
					Constants.RESPONSE_TYPE_FAILURE,
					resp.message,
					sourceAccountNumber
				)
			}
					
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Adjustment captured successfully.",
				sourceAccountNumber
			)
			
		} catch (Exception e) {
			
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during adjustment posting",
				sourceAccountNumber
			)
			
			
		}
	
	}
	
	Response performTransaction(FinancialAccount subjectAccount, Date transactionDate, BigDecimal amount, String modeOfPayment, String transactionType) {
		
		try {
		
			System.out.println("@@ subjectAccount: " + subjectAccount);
			
			System.out.println("@@ Performing a " + transactionType);
			
			if (Constants.TX_TYPE_DEPOSIT.equals(transactionType)) {
				
				return this.postDeposit(subjectAccount, transactionDate, amount, modeOfPayment);
				
			} else if(Constants.TX_TYPE_WITHDRAWAL.equals(transactionType)) {
			
				return this.postWithdrawal(subjectAccount, transactionDate, amount, modeOfPayment);
			
			} else {
			
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Error: Transaction type is invalid",
					subjectAccount
				)
				
			}
		
		} catch (Exception e) {
			
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during transaction posting",
				subjectAccount
			)
		}
	
	}
	
	Response postDeposit(FinancialAccount subjectAccount, Date transactionDate, BigDecimal amount, String modeOfPayment) {
		
		System.out.println("##### subjectAccount: " + subjectAccount);
		
		try {
			
			def sourceAccount = SystemAccount.findByTypeAndBranch(Constants.ACCOUNT_TYPE_BRANCH_CASH, subjectAccount.branch)
				
			if (!sourceAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Branch cash account is not configured. Transaction aborted.",
					subjectAccount
				)
			}
			
			def targetAccount = subjectAccount
			def txType = Constants.TX_TYPE_DEPOSIT
			def paymentRef = ''
			def narrative = modeOfPayment
			def valueDate = transactionDate
			
			Response resp = transactionService.postTransaction(sourceAccount, targetAccount, amount, txType, paymentRef, narrative, valueDate)
				
			if (!resp.isSuccess()) {
				return new Response (
					Constants.RESPONSE_TYPE_FAILURE,
					resp.message,
					subjectAccount
				)
			}
					
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Deposit posted successfully.",
				subjectAccount
			)
			
		} catch (Exception e) {
				
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during transaction posting",
				subjectAccount
			)
			
		}
		
	}
	
	Response postWithdrawal(FinancialAccount subjectAccount, Date transactionDate, BigDecimal amount, String modeOfPayment) {
		
		try {
			
			def targetAccount = SystemAccount.findByTypeAndBranch(Constants.ACCOUNT_TYPE_BRANCH_CASH, subjectAccount.branch)
				
			if (!targetAccount) {
				return new Response(
					Constants.RESPONSE_TYPE_FAILURE,
					"Branch cash account is not configured. Transaction aborted.",
					subjectAccount
				)
			}
			
			def sourceAccount = subjectAccount
			def txType = Constants.TX_TYPE_WITHDRAWAL
			def paymentRef = ''
			def narrative = modeOfPayment
			def valueDate = transactionDate
			
			Response resp = transactionService.postTransaction(sourceAccount, targetAccount, amount, txType, paymentRef, narrative, valueDate)
				
			if (!resp.isSuccess()) {
				return new Response (
					Constants.RESPONSE_TYPE_FAILURE,
					resp.message,
					subjectAccount
				)
			}
					
			return new Response(
				Constants.RESPONSE_TYPE_SUCCESS,
				"Withdrawal posted successfully.",
				subjectAccount
			)
			
		} catch (Exception e) {
				
			e.printStackTrace(System.out)
		
			return new Response(
				Constants.RESPONSE_TYPE_FAILURE,
				"Error occured during transaction posting",
				subjectAccount
			)	
			
		}
	}
	
}
