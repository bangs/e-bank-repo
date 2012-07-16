<%@ page import="zw.co.quantum.legend.model.LoanProduct" %>



<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="loanProduct.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${loanProductInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="loanProduct.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="70" value="${loanProductInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'shortName', 'error')} required">
	<label for="shortName">
		<g:message code="loanProduct.shortName.label" default="Short Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shortName" maxlength="30" value="${loanProductInstance?.shortName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="loanProduct.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${loanProductInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="loanProduct.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" optionKey="id" value="${loanProductInstance?.category?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="loanProduct.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day" value="${loanProductInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="loanProduct.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day" value="${loanProductInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'applicableFor', 'error')} required">
	<label for="applicableFor">
		<g:message code="loanProduct.applicableFor.label" default="Applicable For" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="applicableFor" from="${loanProductInstance.constraints.applicableFor.inList}" value="${loanProductInstance?.applicableFor}" valueMessagePrefix="loanProduct.applicableFor"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="loanProduct.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${loanProductInstance.constraints.status.inList}" value="${loanProductInstance?.status}" valueMessagePrefix="loanProduct.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'minLoanAmount', 'error')} required">
	<label for="minLoanAmount">
		<g:message code="loanProduct.minLoanAmount.label" default="Min Loan Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'minLoanAmount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'defaultLoanAmount', 'error')} required">
	<label for="defaultLoanAmount">
		<g:message code="loanProduct.defaultLoanAmount.label" default="Default Loan Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="defaultLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'defaultLoanAmount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'maxLoanAmount', 'error')} required">
	<label for="maxLoanAmount">
		<g:message code="loanProduct.maxLoanAmount.label" default="Max Loan Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'maxLoanAmount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'interestRateType', 'error')} required">
	<label for="interestRateType">
		<g:message code="loanProduct.interestRateType.label" default="Interest Rate Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="interestRateType" from="${loanProductInstance.constraints.interestRateType.inList}" value="${loanProductInstance?.interestRateType}" valueMessagePrefix="loanProduct.interestRateType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'minInterestRate', 'error')} required">
	<label for="minInterestRate">
		<g:message code="loanProduct.minInterestRate.label" default="Min Interest Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'minInterestRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'defaultInterestRate', 'error')} required">
	<label for="defaultInterestRate">
		<g:message code="loanProduct.defaultInterestRate.label" default="Default Interest Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="defaultInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'defaultInterestRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'maxInterestRate', 'error')} required">
	<label for="maxInterestRate">
		<g:message code="loanProduct.maxInterestRate.label" default="Max Interest Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'maxInterestRate')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'frequencyOfInstallments', 'error')} ">
	<label for="frequencyOfInstallments">
		<g:message code="loanProduct.frequencyOfInstallments.label" default="Frequency Of Installments" />
		
	</label>
	<g:select name="frequencyOfInstallments" from="${loanProductInstance.constraints.frequencyOfInstallments.inList}" value="${loanProductInstance?.frequencyOfInstallments}" valueMessagePrefix="loanProduct.frequencyOfInstallments"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'recurInstallmentEvery', 'error')} required">
	<label for="recurInstallmentEvery">
		<g:message code="loanProduct.recurInstallmentEvery.label" default="Recur Installment Every" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="recurInstallmentEvery" value="${fieldValue(bean: loanProductInstance, field: 'recurInstallmentEvery')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'gracePeriodType', 'error')} ">
	<label for="gracePeriodType">
		<g:message code="loanProduct.gracePeriodType.label" default="Grace Period Type" />
		
	</label>
	<g:select name="gracePeriodType" from="${loanProductInstance.constraints.gracePeriodType.inList}" value="${loanProductInstance?.gracePeriodType}" valueMessagePrefix="loanProduct.gracePeriodType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'gracePeriodDuration', 'error')} required">
	<label for="gracePeriodDuration">
		<g:message code="loanProduct.gracePeriodDuration.label" default="Grace Period Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gracePeriodDuration" value="${fieldValue(bean: loanProductInstance, field: 'gracePeriodDuration')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'interestGLCode', 'error')} required">
	<label for="interestGLCode">
		<g:message code="loanProduct.interestGLCode.label" default="Interest GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="interestGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${loanProductInstance?.interestGLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'principalGLCode', 'error')} required">
	<label for="principalGLCode">
		<g:message code="loanProduct.principalGLCode.label" default="Principal GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="principalGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${loanProductInstance?.principalGLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'canWaiveInterestOnLoanRepayment', 'error')} ">
	<label for="canWaiveInterestOnLoanRepayment">
		<g:message code="loanProduct.canWaiveInterestOnLoanRepayment.label" default="Can Waive Interest On Loan Repayment" />
		
	</label>
	<g:checkBox name="canWaiveInterestOnLoanRepayment" value="${loanProductInstance?.canWaiveInterestOnLoanRepayment}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'compareWithCashFlow', 'error')} ">
	<label for="compareWithCashFlow">
		<g:message code="loanProduct.compareWithCashFlow.label" default="Compare With Cash Flow" />
		
	</label>
	<g:checkBox name="compareWithCashFlow" value="${loanProductInstance?.compareWithCashFlow}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'fixedRepaymentSchedule', 'error')} ">
	<label for="fixedRepaymentSchedule">
		<g:message code="loanProduct.fixedRepaymentSchedule.label" default="Fixed Repayment Schedule" />
		
	</label>
	<g:checkBox name="fixedRepaymentSchedule" value="${loanProductInstance?.fixedRepaymentSchedule}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'includeInLoanCycleCounter', 'error')} ">
	<label for="includeInLoanCycleCounter">
		<g:message code="loanProduct.includeInLoanCycleCounter.label" default="Include In Loan Cycle Counter" />
		
	</label>
	<g:checkBox name="includeInLoanCycleCounter" value="${loanProductInstance?.includeInLoanCycleCounter}" />
</div>

<div class="fieldcontain ${hasErrors(bean: loanProductInstance, field: 'loanAccounts', 'error')} ">
	<label for="loanAccounts">
		<g:message code="loanProduct.loanAccounts.label" default="Loan Accounts" />
		
	</label>
	
<ul>
<g:each in="${loanProductInstance?.loanAccounts?}" var="l">
    <li><g:link controller="loanAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="loanAccount" action="create" params="['loanProduct.id': loanProductInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'loanAccount.label', default: 'LoanAccount')])}</g:link>

</div>

