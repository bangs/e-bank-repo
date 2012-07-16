

<%@ page import="zw.co.quantum.legend.model.LoanProduct" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanProduct.label', default: 'LoanProduct')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${loanProductInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${loanProductInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="loanProduct.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="70" value="${loanProductInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'shortName', 'error')}">
								<label for="shortName" class="control-label"><g:message code="loanProduct.shortName.label" default="Short Name" /></label>
				            	<div class="controls">
									<g:textField name="shortName" maxlength="30" value="${loanProductInstance?.shortName}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'shortName', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="loanProduct.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="160" value="${loanProductInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'category', 'error')}">
								<label for="category" class="control-label"><g:message code="loanProduct.category.label" default="Category" /></label>
				            	<div class="controls">
									<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" 
										optionKey="id" value="${loanProductInstance?.category?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'category', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'startDate', 'error')}">
								<label for="startDate" class="control-label"><g:message code="loanProduct.startDate.label" default="Start Date" /></label>
				            	<div class="controls">
									<g:datePicker name="startDate" precision="day" value="${loanProductInstance?.startDate}"  />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'startDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'endDate', 'error')}">
								<label for="endDate" class="control-label"><g:message code="loanProduct.endDate.label" default="End Date" /></label>
				            	<div class="controls">
									<g:datePicker name="endDate" precision="day" value="${loanProductInstance?.endDate}" default="none" noSelection="['': '']" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'endDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'applicableFor', 'error')}">
								<label for="applicableFor" class="control-label"><g:message code="loanProduct.applicableFor.label" default="Applicable For" /></label>
				            	<div class="controls">
									<g:select name="applicableFor" from="${loanProductInstance.constraints.applicableFor.inList}" value="${loanProductInstance?.applicableFor}" valueMessagePrefix="loanProduct.applicableFor"  />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'applicableFor', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'minLoanAmount', 'error')}">
								<label for="minLoanAmount" class="control-label"><g:message code="loanProduct.minLoanAmount.label" default="Min Loan Amount" /></label>
				            	<div class="controls">
									<g:textField name="minLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'minLoanAmount')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'minLoanAmount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'defaultLoanAmount', 'error')}">
								<label for="defaultLoanAmount" class="control-label"><g:message code="loanProduct.defaultLoanAmount.label" default="Default Loan Amount" /></label>
				            	<div class="controls">
									<g:textField name="defaultLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'defaultLoanAmount')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'defaultLoanAmount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'maxLoanAmount', 'error')}">
								<label for="maxLoanAmount" class="control-label"><g:message code="loanProduct.maxLoanAmount.label" default="Max Loan Amount" /></label>
				            	<div class="controls">
									<g:textField name="maxLoanAmount" value="${fieldValue(bean: loanProductInstance, field: 'maxLoanAmount')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'maxLoanAmount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'interestRateType', 'error')}">
								<label for="interestRateType" class="control-label"><g:message code="loanProduct.interestRateType.label" default="Interest Rate Type" /></label>
				            	<div class="controls">
									<g:select name="interestRateType" from="${loanProductInstance.constraints.interestRateType.inList}" value="${loanProductInstance?.interestRateType}" valueMessagePrefix="loanProduct.interestRateType"  />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'interestRateType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'minInterestRate', 'error')}">
								<label for="minInterestRate" class="control-label"><g:message code="loanProduct.minInterestRate.label" default="Min Interest Rate" /></label>
				            	<div class="controls">
									<g:textField name="minInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'minInterestRate')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'minInterestRate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'defaultInterestRate', 'error')}">
								<label for="defaultInterestRate" class="control-label"><g:message code="loanProduct.defaultInterestRate.label" default="Default Interest Rate" /></label>
				            	<div class="controls">
									<g:textField name="defaultInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'defaultInterestRate')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'defaultInterestRate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'maxInterestRate', 'error')}">
								<label for="maxInterestRate" class="control-label"><g:message code="loanProduct.maxInterestRate.label" default="Max Interest Rate" /></label>
				            	<div class="controls">
									<g:textField name="maxInterestRate" value="${fieldValue(bean: loanProductInstance, field: 'maxInterestRate')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'maxInterestRate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'frequencyOfInstallments', 'error')}">
								<label for="frequencyOfInstallments" class="control-label"><g:message code="loanProduct.frequencyOfInstallments.label" default="Frequency Of Installments" /></label>
				            	<div class="controls">
									<g:select name="frequencyOfInstallments" from="${loanProductInstance.constraints.frequencyOfInstallments.inList}" value="${loanProductInstance?.frequencyOfInstallments}" valueMessagePrefix="loanProduct.frequencyOfInstallments"  />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'frequencyOfInstallments', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'recurInstallmentEvery', 'error')}">
								<label for="recurInstallmentEvery" class="control-label"><g:message code="loanProduct.recurInstallmentEvery.label" default="Recur Installment Every" /></label>
				            	<div class="controls">
									<g:textField name="recurInstallmentEvery" value="${fieldValue(bean: loanProductInstance, field: 'recurInstallmentEvery')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'recurInstallmentEvery', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'gracePeriodType', 'error')}">
								<label for="gracePeriodType" class="control-label"><g:message code="loanProduct.gracePeriodType.label" default="Grace Period Type" /></label>
				            	<div class="controls">
									<g:select name="gracePeriodType" from="${loanProductInstance.constraints.gracePeriodType.inList}" value="${loanProductInstance?.gracePeriodType}" valueMessagePrefix="loanProduct.gracePeriodType"  />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'gracePeriodType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'gracePeriodDuration', 'error')}">
								<label for="gracePeriodDuration" class="control-label"><g:message code="loanProduct.gracePeriodDuration.label" default="Grace Period Duration" /></label>
				            	<div class="controls">
									<g:textField name="gracePeriodDuration" value="${fieldValue(bean: loanProductInstance, field: 'gracePeriodDuration')}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'gracePeriodDuration', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'interestGLCode', 'error')}">
								<label for="interestGLCode" class="control-label"><g:message code="loanProduct.interestGLCode.label" default="Interest GLC ode" /></label>
				            	<div class="controls">
									<g:select name="interestGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" 
										optionKey="id" value="${loanProductInstance?.interestGLCode?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'interestGLCode', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'principalGLCode', 'error')}">
								<label for="principalGLCode" class="control-label"><g:message code="loanProduct.principalGLCode.label" default="Principal GLC ode" /></label>
				            	<div class="controls">
									<g:select name="principalGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" 
										optionKey="id" value="${loanProductInstance?.principalGLCode?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'principalGLCode', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'canWaiveInterestOnLoanRepayment', 'error')}">
								<label for="canWaiveInterestOnLoanRepayment" class="control-label"><g:message code="loanProduct.canWaiveInterestOnLoanRepayment.label" default="Can Waive Interest On Loan Repayment" /></label>
				            	<div class="controls">
									<g:checkBox name="canWaiveInterestOnLoanRepayment" value="${loanProductInstance?.canWaiveInterestOnLoanRepayment}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'canWaiveInterestOnLoanRepayment', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'compareWithCashFlow', 'error')}">
								<label for="compareWithCashFlow" class="control-label"><g:message code="loanProduct.compareWithCashFlow.label" default="Compare With Cash Flow" /></label>
				            	<div class="controls">
									<g:checkBox name="compareWithCashFlow" value="${loanProductInstance?.compareWithCashFlow}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'compareWithCashFlow', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'fixedRepaymentSchedule', 'error')}">
								<label for="fixedRepaymentSchedule" class="control-label"><g:message code="loanProduct.fixedRepaymentSchedule.label" default="Fixed Repayment Schedule" /></label>
				            	<div class="controls">
									<g:checkBox name="fixedRepaymentSchedule" value="${loanProductInstance?.fixedRepaymentSchedule}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'fixedRepaymentSchedule', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanProductInstance, field: 'includeInLoanCycleCounter', 'error')}">
								<label for="includeInLoanCycleCounter" class="control-label"><g:message code="loanProduct.includeInLoanCycleCounter.label" default="Include In Loan Cycle Counter" /></label>
				            	<div class="controls">
									<g:checkBox name="includeInLoanCycleCounter" value="${loanProductInstance?.includeInLoanCycleCounter}" />
									<span class="help-inline">${hasErrors(bean: loanProductInstance, field: 'includeInLoanCycleCounter', 'error')}</span>
								</div>
							</div>
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
