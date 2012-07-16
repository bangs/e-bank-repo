<%@ page import="zw.co.quantum.legend.model.SavingsProduct" %>



<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="savingsProduct.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${savingsProductInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="savingsProduct.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="70" value="${savingsProductInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'shortName', 'error')} required">
	<label for="shortName">
		<g:message code="savingsProduct.shortName.label" default="Short Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shortName" maxlength="30" value="${savingsProductInstance?.shortName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="savingsProduct.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${savingsProductInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="savingsProduct.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" optionKey="id" value="${savingsProductInstance?.category?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="savingsProduct.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day" value="${savingsProductInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="savingsProduct.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day" value="${savingsProductInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'applicableFor', 'error')} required">
	<label for="applicableFor">
		<g:message code="savingsProduct.applicableFor.label" default="Applicable For" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="applicableFor" from="${savingsProductInstance.constraints.applicableFor.inList}" value="${savingsProductInstance?.applicableFor}" valueMessagePrefix="savingsProduct.applicableFor"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="savingsProduct.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${savingsProductInstance.constraints.status.inList}" value="${savingsProductInstance?.status}" valueMessagePrefix="savingsProduct.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'typeOfDeposits', 'error')} ">
	<label for="typeOfDeposits">
		<g:message code="savingsProduct.typeOfDeposits.label" default="Type Of Deposits" />
		
	</label>
	<g:select name="typeOfDeposits" from="${savingsProductInstance.constraints.typeOfDeposits.inList}" value="${savingsProductInstance?.typeOfDeposits}" valueMessagePrefix="savingsProduct.typeOfDeposits"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'recommendedDepositAmount', 'error')} required">
	<label for="recommendedDepositAmount">
		<g:message code="savingsProduct.recommendedDepositAmount.label" default="Recommended Deposit Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="recommendedDepositAmount" value="${fieldValue(bean: savingsProductInstance, field: 'recommendedDepositAmount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'maxAmountPerWithdrawal', 'error')} required">
	<label for="maxAmountPerWithdrawal">
		<g:message code="savingsProduct.maxAmountPerWithdrawal.label" default="Max Amount Per Withdrawal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxAmountPerWithdrawal" value="${fieldValue(bean: savingsProductInstance, field: 'maxAmountPerWithdrawal')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'interestRate', 'error')} required">
	<label for="interestRate">
		<g:message code="savingsProduct.interestRate.label" default="Interest Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interestRate" value="${fieldValue(bean: savingsProductInstance, field: 'interestRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'interestCalculationBalance', 'error')} required">
	<label for="interestCalculationBalance">
		<g:message code="savingsProduct.interestCalculationBalance.label" default="Interest Calculation Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="interestCalculationBalance" from="${savingsProductInstance.constraints.interestCalculationBalance.inList}" value="${savingsProductInstance?.interestCalculationBalance}" valueMessagePrefix="savingsProduct.interestCalculationBalance"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'interestCalculationTimePeriod', 'error')} required">
	<label for="interestCalculationTimePeriod">
		<g:message code="savingsProduct.interestCalculationTimePeriod.label" default="Interest Calculation Time Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interestCalculationTimePeriod" value="${fieldValue(bean: savingsProductInstance, field: 'interestCalculationTimePeriod')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'interestPostingFrequency', 'error')} required">
	<label for="interestPostingFrequency">
		<g:message code="savingsProduct.interestPostingFrequency.label" default="Interest Posting Frequency" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interestPostingFrequency" value="${fieldValue(bean: savingsProductInstance, field: 'interestPostingFrequency')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'minInterestCalculationBalance', 'error')} required">
	<label for="minInterestCalculationBalance">
		<g:message code="savingsProduct.minInterestCalculationBalance.label" default="Min Interest Calculation Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minInterestCalculationBalance" value="${fieldValue(bean: savingsProductInstance, field: 'minInterestCalculationBalance')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'depositGLCode', 'error')} required">
	<label for="depositGLCode">
		<g:message code="savingsProduct.depositGLCode.label" default="Deposit GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="depositGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${savingsProductInstance?.depositGLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'interestGLCode', 'error')} required">
	<label for="interestGLCode">
		<g:message code="savingsProduct.interestGLCode.label" default="Interest GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="interestGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${savingsProductInstance?.interestGLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsProductInstance, field: 'savingsAccounts', 'error')} ">
	<label for="savingsAccounts">
		<g:message code="savingsProduct.savingsAccounts.label" default="Savings Accounts" />
		
	</label>
	
<ul>
<g:each in="${savingsProductInstance?.savingsAccounts?}" var="s">
    <li><g:link controller="savingsAccount" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="savingsAccount" action="create" params="['savingsProduct.id': savingsProductInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount')])}</g:link>

</div>

