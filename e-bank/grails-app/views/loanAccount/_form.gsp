<%@ page import="zw.co.quantum.legend.model.LoanAccount" %>



<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="loanAccount.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${loanAccountInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="loanAccount.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" maxlength="30" value="${loanAccountInstance?.accountNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'ownerId', 'error')} ">
	<label for="ownerId">
		<g:message code="loanAccount.ownerId.label" default="Owner Id" />
		
	</label>
	<g:textField name="ownerId" maxlength="30" value="${loanAccountInstance?.ownerId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'ownerClass', 'error')} ">
	<label for="ownerClass">
		<g:message code="loanAccount.ownerClass.label" default="Owner Class" />
		
	</label>
	<g:textField name="ownerClass" maxlength="60" value="${loanAccountInstance?.ownerClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'ownerType', 'error')} ">
	<label for="ownerType">
		<g:message code="loanAccount.ownerType.label" default="Owner Type" />
		
	</label>
	<g:textField name="ownerType" maxlength="30" value="${loanAccountInstance?.ownerType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'superType', 'error')} required">
	<label for="superType">
		<g:message code="loanAccount.superType.label" default="Super Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="superType" from="${loanAccountInstance.constraints.superType.inList}" value="${loanAccountInstance?.superType}" valueMessagePrefix="loanAccount.superType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="loanAccount.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="product.id" from="${zw.co.quantum.legend.model.LoanProduct.list()}" optionKey="id" value="${loanAccountInstance?.product?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'loanOfficer', 'error')} required">
	<label for="loanOfficer">
		<g:message code="loanAccount.loanOfficer.label" default="Loan Officer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="loanOfficer.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${loanAccountInstance?.loanOfficer?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'groupAccountType', 'error')} ">
	<label for="groupAccountType">
		<g:message code="loanAccount.groupAccountType.label" default="Group Account Type" />
		
	</label>
	<g:select name="groupAccountType" from="${loanAccountInstance.constraints.groupAccountType.inList}" value="${loanAccountInstance?.groupAccountType}" valueMessagePrefix="loanAccount.groupAccountType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="loanAccount.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: loanAccountInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'interestRate', 'error')} required">
	<label for="interestRate">
		<g:message code="loanAccount.interestRate.label" default="Interest Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interestRate" value="${fieldValue(bean: loanAccountInstance, field: 'interestRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'numOfInstallments', 'error')} required">
	<label for="numOfInstallments">
		<g:message code="loanAccount.numOfInstallments.label" default="Num Of Installments" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numOfInstallments" value="${fieldValue(bean: loanAccountInstance, field: 'numOfInstallments')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'repaymentsGracePeriod', 'error')} required">
	<label for="repaymentsGracePeriod">
		<g:message code="loanAccount.repaymentsGracePeriod.label" default="Repayments Grace Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="repaymentsGracePeriod" value="${fieldValue(bean: loanAccountInstance, field: 'repaymentsGracePeriod')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'disbursalDate', 'error')} required">
	<label for="disbursalDate">
		<g:message code="loanAccount.disbursalDate.label" default="Disbursal Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="disbursalDate" precision="day" value="${loanAccountInstance?.disbursalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'sourceOfFunds', 'error')} required">
	<label for="sourceOfFunds">
		<g:message code="loanAccount.sourceOfFunds.label" default="Source Of Funds" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sourceOfFunds.id" from="${zw.co.quantum.legend.model.Fund.list()}" optionKey="id" value="${loanAccountInstance?.sourceOfFunds?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'purposeOfLoan', 'error')} ">
	<label for="purposeOfLoan">
		<g:message code="loanAccount.purposeOfLoan.label" default="Purpose Of Loan" />
		
	</label>
	<g:textField name="purposeOfLoan" maxlength="80" value="${loanAccountInstance?.purposeOfLoan}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'collateralType', 'error')} required">
	<label for="collateralType">
		<g:message code="loanAccount.collateralType.label" default="Collateral Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="collateralType.id" from="${zw.co.quantum.legend.model.CollateralType.list()}" optionKey="id" value="${loanAccountInstance?.collateralType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'collateralNotes', 'error')} ">
	<label for="collateralNotes">
		<g:message code="loanAccount.collateralNotes.label" default="Collateral Notes" />
		
	</label>
	<g:textField name="collateralNotes" maxlength="160" value="${loanAccountInstance?.collateralNotes}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'guarantorDetails', 'error')} ">
	<label for="guarantorDetails">
		<g:message code="loanAccount.guarantorDetails.label" default="Guarantor Details" />
		
	</label>
	<g:textField name="guarantorDetails" maxlength="160" value="${loanAccountInstance?.guarantorDetails}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="loanAccount.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" maxlength="30" value="${loanAccountInstance?.externalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="loanAccount.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${loanAccountInstance.constraints.type.inList}" value="${loanAccountInstance?.type}" valueMessagePrefix="loanAccount.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'standing', 'error')} ">
	<label for="standing">
		<g:message code="loanAccount.standing.label" default="Standing" />
		
	</label>
	<g:select name="standing" from="${loanAccountInstance.constraints.standing.inList}" value="${loanAccountInstance?.standing}" valueMessagePrefix="loanAccount.standing"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="loanAccount.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${loanAccountInstance.constraints.status.inList}" value="${loanAccountInstance?.status}" valueMessagePrefix="loanAccount.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanAccountInstance, field: 'repaymentSchedules', 'error')} ">
	<label for="repaymentSchedules">
		<g:message code="loanAccount.repaymentSchedules.label" default="Repayment Schedules" />
		
	</label>
	
<ul>
<g:each in="${loanAccountInstance?.repaymentSchedules?}" var="r">
    <li><g:link controller="repaymentSchedule" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="repaymentSchedule" action="create" params="['loanAccount.id': loanAccountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')])}</g:link>

</div>

