

<%@ page import="zw.co.quantum.legend.model.LoanAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanAccount.label', default: 'LoanAccount')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${loanAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${loanAccountInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
							
							<div class="control-group">
								<g:render template="/financialAccount/client"></g:render>
							</div>
							
							<strong>Account Details</strong>
							<hr>
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'product', 'error')}">
								<label for="product" class="control-label"><g:message code="loanAccount.product.label" default="Product" /></label>
				            	<div class="controls">
									<g:select name="product.id" from="${zw.co.quantum.legend.model.LoanProduct.list()}" optionKey="id" value="${loanAccountInstance?.product?.id}"  />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'product', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'groupAccountType', 'error')}">
								<label for="groupAccountType" class="control-label"><g:message code="loanAccount.groupAccountType.label" default="Group Account Type" /></label>
				            	<div class="controls">
									<g:select name="groupAccountType" from="${loanAccountInstance.constraints.groupAccountType.inList}" value="${loanAccountInstance?.groupAccountType}" valueMessagePrefix="loanAccount.groupAccountType"  />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'groupAccountType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'amount', 'error')}">
								<label for="amount" class="control-label"><g:message code="loanAccount.amount.label" default="Amount" /></label>
				            	<div class="controls">
									<g:textField name="amount" value="${fieldValue(bean: loanAccountInstance, field: 'amount')}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'amount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'interestRate', 'error')}">
								<label for="interestRate" class="control-label"><g:message code="loanAccount.interestRate.label" default="Interest Rate" /></label>
				            	<div class="controls">
									<g:textField name="interestRate" value="${fieldValue(bean: loanAccountInstance, field: 'interestRate')}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'interestRate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'numOfInstallments', 'error')}">
								<label for="numOfInstallments" class="control-label"><g:message code="loanAccount.numOfInstallments.label" default="Num Of Installments" /></label>
				            	<div class="controls">
									<g:textField name="numOfInstallments" value="${fieldValue(bean: loanAccountInstance, field: 'numOfInstallments')}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'numOfInstallments', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'repaymentsGracePeriod', 'error')}">
								<label for="repaymentsGracePeriod" class="control-label"><g:message code="loanAccount.repaymentsGracePeriod.label" default="Repayments Grace Period" /></label>
				            	<div class="controls">
									<g:textField name="repaymentsGracePeriod" value="${fieldValue(bean: loanAccountInstance, field: 'repaymentsGracePeriod')}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'repaymentsGracePeriod', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'sourceOfFunds', 'error')}">
								<label for="sourceOfFunds" class="control-label"><g:message code="loanAccount.sourceOfFunds.label" default="Source Of Funds" /></label>
				            	<div class="controls">
									<g:select name="sourceOfFunds.id" from="${zw.co.quantum.legend.model.Fund.list()}" optionKey="id" value="${loanAccountInstance?.sourceOfFunds?.id}"  />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'sourceOfFunds', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'purposeOfLoan', 'error')}">
								<label for="purposeOfLoan" class="control-label"><g:message code="loanAccount.purposeOfLoan.label" default="Purpose Of Loan" /></label>
				            	<div class="controls">
									<g:textArea name="purposeOfLoan" maxlength="80" value="${loanAccountInstance?.purposeOfLoan}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'purposeOfLoan', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'collateralType', 'error')}">
								<label for="collateralType" class="control-label"><g:message code="loanAccount.collateralType.label" default="Collateral Type" /></label>
				            	<div class="controls">
									<g:select name="collateralType.id" from="${zw.co.quantum.legend.model.CollateralType.list()}" optionKey="id" value="${loanAccountInstance?.collateralType?.id}"  />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'collateralType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'collateralNotes', 'error')}">
								<label for="collateralNotes" class="control-label"><g:message code="loanAccount.collateralNotes.label" default="Collateral Notes" /></label>
				            	<div class="controls">
									<g:textArea name="collateralNotes" maxlength="160" value="${loanAccountInstance?.collateralNotes}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'collateralNotes', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'guarantorDetails', 'error')}">
								<label for="guarantorDetails" class="control-label"><g:message code="loanAccount.guarantorDetails.label" default="Guarantor Details" /></label>
				            	<div class="controls">
									<g:textArea name="guarantorDetails" maxlength="160" value="${loanAccountInstance?.guarantorDetails}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'guarantorDetails', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'externalId', 'error')}">
								<label for="externalId" class="control-label"><g:message code="loanAccount.externalId.label" default="External Id" /></label>
				            	<div class="controls">
									<g:textField name="externalId" maxlength="30" value="${loanAccountInstance?.externalId}" />
									<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'externalId', 'error')}</span>
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
