

<%@ page import="zw.co.quantum.legend.model.LoanAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanAccount.label', default: 'LoanAccount')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${loanAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${loanAccountInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${loanAccountInstance?.id}" />
		<g:hiddenField name="version" value="${loanAccountInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'product', 'error')}">
							<label for="product"><g:message code="loanAccount.product.label" default="Product" /></label>
							<div class="controls">
								<g:select name="product.id" from="${zw.co.quantum.legend.model.LoanProduct.list()}" optionKey="id" value="${loanAccountInstance?.product?.id}"  />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'product', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'loanOfficer', 'error')}">
							<label for="loanOfficer"><g:message code="loanAccount.loanOfficer.label" default="Loan Officer" /></label>
							<div class="controls">
								<g:select name="loanOfficer.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${loanAccountInstance?.loanOfficer?.id}"  />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'loanOfficer', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'groupAccountType', 'error')}">
							<label for="groupAccountType"><g:message code="loanAccount.groupAccountType.label" default="Group Account Type" /></label>
							<div class="controls">
								<g:select name="groupAccountType" from="${loanAccountInstance.constraints.groupAccountType.inList}" value="${loanAccountInstance?.groupAccountType}" valueMessagePrefix="loanAccount.groupAccountType"  />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'groupAccountType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'amount', 'error')}">
							<label for="amount"><g:message code="loanAccount.amount.label" default="Amount" /></label>
							<div class="controls">
								<g:textField name="amount" value="${fieldValue(bean: loanAccountInstance, field: 'amount')}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'amount', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'interestRate', 'error')}">
							<label for="interestRate"><g:message code="loanAccount.interestRate.label" default="Interest Rate" /></label>
							<div class="controls">
								<g:textField name="interestRate" value="${fieldValue(bean: loanAccountInstance, field: 'interestRate')}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'interestRate', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'numOfInstallments', 'error')}">
							<label for="numOfInstallments"><g:message code="loanAccount.numOfInstallments.label" default="Num Of Installments" /></label>
							<div class="controls">
								<g:textField name="numOfInstallments" value="${fieldValue(bean: loanAccountInstance, field: 'numOfInstallments')}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'numOfInstallments', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'repaymentsGracePeriod', 'error')}">
							<label for="repaymentsGracePeriod"><g:message code="loanAccount.repaymentsGracePeriod.label" default="Repayments Grace Period" /></label>
							<div class="controls">
								<g:textField name="repaymentsGracePeriod" value="${fieldValue(bean: loanAccountInstance, field: 'repaymentsGracePeriod')}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'repaymentsGracePeriod', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'sourceOfFunds', 'error')}">
							<label for="sourceOfFunds"><g:message code="loanAccount.sourceOfFunds.label" default="Source Of Funds" /></label>
							<div class="controls">
								<g:select name="sourceOfFunds.id" from="${zw.co.quantum.legend.model.Fund.list()}" optionKey="id" value="${loanAccountInstance?.sourceOfFunds?.id}"  />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'sourceOfFunds', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'purposeOfLoan', 'error')}">
							<label for="purposeOfLoan"><g:message code="loanAccount.purposeOfLoan.label" default="Purpose Of Loan" /></label>
							<div class="controls">
								<g:textArea name="purposeOfLoan" maxlength="80" value="${loanAccountInstance?.purposeOfLoan}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'purposeOfLoan', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'collateralType', 'error')}">
							<label for="collateralType"><g:message code="loanAccount.collateralType.label" default="Collateral Type" /></label>
							<div class="controls">
								<g:select name="collateralType.id" from="${zw.co.quantum.legend.model.CollateralType.list()}" optionKey="id" value="${loanAccountInstance?.collateralType?.id}"  />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'collateralType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'collateralNotes', 'error')}">
							<label for="collateralNotes"><g:message code="loanAccount.collateralNotes.label" default="Collateral Notes" /></label>
							<div class="controls">
								<g:textArea name="collateralNotes" maxlength="160" value="${loanAccountInstance?.collateralNotes}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'collateralNotes', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'guarantorDetails', 'error')}">
							<label for="guarantorDetails"><g:message code="loanAccount.guarantorDetails.label" default="Guarantor Details" /></label>
							<div class="controls">
								<g:textArea name="guarantorDetails" maxlength="160" value="${loanAccountInstance?.guarantorDetails}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'guarantorDetails', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: loanAccountInstance, field: 'externalId', 'error')}">
							<label for="externalId"><g:message code="loanAccount.externalId.label" default="External Id" /></label>
							<div class="controls">
								<g:textField name="externalId" maxlength="30" value="${loanAccountInstance?.externalId}" />
								<span class="help-inline">${hasErrors(bean: loanAccountInstance, field: 'externalId', 'error')}</span>
							</div>
						</div>
				
		<div class="form-actions">
			<g:actionSubmit class="save btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
