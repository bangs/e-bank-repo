

<%@ page import="zw.co.quantum.legend.model.Transaction" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${transactionInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${transactionInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'valueDate', 'error')}">
								<label for="valueDate" class="control-label"><g:message code="transaction.valueDate.label" default="Value Date" /></label>
				            	<div class="controls">
									<g:datePicker name="valueDate" precision="day" value="${transactionInstance?.valueDate}"  />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'valueDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'reference', 'error')}">
								<label for="reference" class="control-label"><g:message code="transaction.reference.label" default="Reference" /></label>
				            	<div class="controls">
									<g:textField name="reference" maxlength="30" value="${transactionInstance?.reference}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'reference', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'sourceAccountNo', 'error')}">
								<label for="sourceAccountNo" class="control-label"><g:message code="transaction.sourceAccountNo.label" default="Source Account No" /></label>
				            	<div class="controls">
									<g:textField name="sourceAccountNo" maxlength="30" value="${transactionInstance?.sourceAccountNo}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'sourceAccountNo', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'sourceAccountType', 'error')}">
								<label for="sourceAccountType" class="control-label"><g:message code="transaction.sourceAccountType.label" default="Source Account Type" /></label>
				            	<div class="controls">
									<g:textField name="sourceAccountType" maxlength="50" value="${transactionInstance?.sourceAccountType}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'sourceAccountType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'sourceAccountClass', 'error')}">
								<label for="sourceAccountClass" class="control-label"><g:message code="transaction.sourceAccountClass.label" default="Source Account Class" /></label>
				            	<div class="controls">
									<g:textField name="sourceAccountClass" maxlength="60" value="${transactionInstance?.sourceAccountClass}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'sourceAccountClass', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'destinationAccountNo', 'error')}">
								<label for="destinationAccountNo" class="control-label"><g:message code="transaction.destinationAccountNo.label" default="Destination Account No" /></label>
				            	<div class="controls">
									<g:textField name="destinationAccountNo" maxlength="30" value="${transactionInstance?.destinationAccountNo}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'destinationAccountNo', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'destinationAccountType', 'error')}">
								<label for="destinationAccountType" class="control-label"><g:message code="transaction.destinationAccountType.label" default="Destination Account Type" /></label>
				            	<div class="controls">
									<g:textField name="destinationAccountType" maxlength="50" value="${transactionInstance?.destinationAccountType}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'destinationAccountType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'destinationAccountClass', 'error')}">
								<label for="destinationAccountClass" class="control-label"><g:message code="transaction.destinationAccountClass.label" default="Destination Account Class" /></label>
				            	<div class="controls">
									<g:textField name="destinationAccountClass" maxlength="60" value="${transactionInstance?.destinationAccountClass}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'destinationAccountClass', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'paymentRef', 'error')}">
								<label for="paymentRef" class="control-label"><g:message code="transaction.paymentRef.label" default="Payment Ref" /></label>
				            	<div class="controls">
									<g:textField name="paymentRef" maxlength="30" value="${transactionInstance?.paymentRef}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'paymentRef', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="transaction.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${transactionInstance.constraints.type.inList}" value="${transactionInstance?.type}" valueMessagePrefix="transaction.type"  />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'type', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'narrative', 'error')}">
								<label for="narrative" class="control-label"><g:message code="transaction.narrative.label" default="Narrative" /></label>
				            	<div class="controls">
									<g:textField name="narrative" maxlength="120" value="${transactionInstance?.narrative}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'narrative', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'gLCode', 'error')}">
								<label for="gLCode" class="control-label"><g:message code="transaction.gLCode.label" default="GLC ode" /></label>
				            	<div class="controls">
									<g:textField name="gLCode" value="${transactionInstance?.gLCode}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'gLCode', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'initiator', 'error')}">
								<label for="initiator" class="control-label"><g:message code="transaction.initiator.label" default="Initiator" /></label>
				            	<div class="controls">
									<g:select name="initiator.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${transactionInstance?.initiator?.id}" noSelection="['null': '']" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'initiator', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'approver', 'error')}">
								<label for="approver" class="control-label"><g:message code="transaction.approver.label" default="Approver" /></label>
				            	<div class="controls">
									<g:select name="approver.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${transactionInstance?.approver?.id}" noSelection="['null': '']" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'approver', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'amount', 'error')}">
								<label for="amount" class="control-label"><g:message code="transaction.amount.label" default="Amount" /></label>
				            	<div class="controls">
									<g:textField name="amount" value="${fieldValue(bean: transactionInstance, field: 'amount')}" />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'amount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: transactionInstance, field: 'status', 'error')}">
								<label for="status" class="control-label"><g:message code="transaction.status.label" default="Status" /></label>
				            	<div class="controls">
									<g:select name="status" from="${transactionInstance.constraints.status.inList}" value="${transactionInstance?.status}" valueMessagePrefix="transaction.status"  />
									<span class="help-inline">${hasErrors(bean: transactionInstance, field: 'status', 'error')}</span>
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
