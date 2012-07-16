

<%@ page import="zw.co.quantum.legend.model.SavingsProduct" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsProduct.label', default: 'SavingsProduct')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${savingsProductInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${savingsProductInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
									
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="savingsProduct.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="70" value="${savingsProductInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'shortName', 'error')}">
								<label for="shortName" class="control-label"><g:message code="savingsProduct.shortName.label" default="Short Name" /></label>
				            	<div class="controls">
									<g:textField name="shortName" maxlength="30" value="${savingsProductInstance?.shortName}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'shortName', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="savingsProduct.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="160" value="${savingsProductInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'category', 'error')}">
								<label for="category" class="control-label"><g:message code="savingsProduct.category.label" default="Category" /></label>
				            	<div class="controls">
									<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" 
										optionKey="id" value="${savingsProductInstance?.category?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'category', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'startDate', 'error')}">
								<label for="startDate" class="control-label"><g:message code="savingsProduct.startDate.label" default="Start Date" /></label>
				            	<div class="controls">
									<g:datePicker name="startDate" precision="day" value="${savingsProductInstance?.startDate}"  />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'startDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'endDate', 'error')}">
								<label for="endDate" class="control-label"><g:message code="savingsProduct.endDate.label" default="End Date" /></label>
				            	<div class="controls">
									<g:datePicker name="endDate" precision="day" value="${savingsProductInstance?.endDate}" default="none" noSelection="['': '']" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'endDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'applicableFor', 'error')}">
								<label for="applicableFor" class="control-label"><g:message code="savingsProduct.applicableFor.label" default="Applicable For" /></label>
				            	<div class="controls">
									<g:select name="applicableFor" from="${savingsProductInstance.constraints.applicableFor.inList}" value="${savingsProductInstance?.applicableFor}" valueMessagePrefix="savingsProduct.applicableFor"  />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'applicableFor', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'typeOfDeposits', 'error')}">
								<label for="typeOfDeposits" class="control-label"><g:message code="savingsProduct.typeOfDeposits.label" default="Type Of Deposits" /></label>
				            	<div class="controls">
									<g:select name="typeOfDeposits" from="${savingsProductInstance.constraints.typeOfDeposits.inList}" value="${savingsProductInstance?.typeOfDeposits}" valueMessagePrefix="savingsProduct.typeOfDeposits"  />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'typeOfDeposits', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'recommendedDepositAmount', 'error')}">
								<label for="recommendedDepositAmount" class="control-label"><g:message code="savingsProduct.recommendedDepositAmount.label" default="Recommended Deposit Amount" /></label>
				            	<div class="controls">
									<g:textField name="recommendedDepositAmount" value="${fieldValue(bean: savingsProductInstance, field: 'recommendedDepositAmount')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'recommendedDepositAmount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'maxAmountPerWithdrawal', 'error')}">
								<label for="maxAmountPerWithdrawal" class="control-label"><g:message code="savingsProduct.maxAmountPerWithdrawal.label" default="Max Amount Per Withdrawal" /></label>
				            	<div class="controls">
									<g:textField name="maxAmountPerWithdrawal" value="${fieldValue(bean: savingsProductInstance, field: 'maxAmountPerWithdrawal')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'maxAmountPerWithdrawal', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'interestRate', 'error')}">
								<label for="interestRate" class="control-label"><g:message code="savingsProduct.interestRate.label" default="Interest Rate" /></label>
				            	<div class="controls">
									<g:textField name="interestRate" value="${fieldValue(bean: savingsProductInstance, field: 'interestRate')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'interestRate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'interestCalculationBalance', 'error')}">
								<label for="interestCalculationBalance" class="control-label"><g:message code="savingsProduct.interestCalculationBalance.label" default="Interest Calculation Balance" /></label>
				            	<div class="controls">
									<g:select name="interestCalculationBalance" from="${savingsProductInstance.constraints.interestCalculationBalance.inList}" value="${savingsProductInstance?.interestCalculationBalance}" valueMessagePrefix="savingsProduct.interestCalculationBalance"  />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'interestCalculationBalance', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'interestCalculationTimePeriod', 'error')}">
								<label for="interestCalculationTimePeriod" class="control-label"><g:message code="savingsProduct.interestCalculationTimePeriod.label" default="Interest Calculation Time Period" /></label>
				            	<div class="controls">
									<g:textField name="interestCalculationTimePeriod" value="${fieldValue(bean: savingsProductInstance, field: 'interestCalculationTimePeriod')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'interestCalculationTimePeriod', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'interestPostingFrequency', 'error')}">
								<label for="interestPostingFrequency" class="control-label"><g:message code="savingsProduct.interestPostingFrequency.label" default="Interest Posting Frequency" /></label>
				            	<div class="controls">
									<g:textField name="interestPostingFrequency" value="${fieldValue(bean: savingsProductInstance, field: 'interestPostingFrequency')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'interestPostingFrequency', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'minInterestCalculationBalance', 'error')}">
								<label for="minInterestCalculationBalance" class="control-label"><g:message code="savingsProduct.minInterestCalculationBalance.label" default="Min Interest Calculation Balance" /></label>
				            	<div class="controls">
									<g:textField name="minInterestCalculationBalance" value="${fieldValue(bean: savingsProductInstance, field: 'minInterestCalculationBalance')}" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'minInterestCalculationBalance', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'depositGLCode', 'error')}">
								<label for="depositGLCode" class="control-label"><g:message code="savingsProduct.depositGLCode.label" default="Deposit GLC ode" /></label>
				            	<div class="controls">
									<g:select name="depositGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" 
										optionKey="id" value="${savingsProductInstance?.depositGLCode?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'depositGLCode', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: savingsProductInstance, field: 'interestGLCode', 'error')}">
								<label for="interestGLCode" class="control-label"><g:message code="savingsProduct.interestGLCode.label" default="Interest GLC ode" /></label>
				            	<div class="controls">
									<g:select name="interestGLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" 
										optionKey="id" value="${savingsProductInstance?.interestGLCode?.id}" noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: savingsProductInstance, field: 'interestGLCode', 'error')}</span>
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
