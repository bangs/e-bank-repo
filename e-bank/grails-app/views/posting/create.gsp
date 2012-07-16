

<%@ page import="zw.co.quantum.legend.model.Posting" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posting.label', default: 'Posting')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${postingInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${postingInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'transaction', 'error')}">
								<label for="transaction" class="control-label"><g:message code="posting.transaction.label" default="Transaction" /></label>
				            	<div class="controls">
									<g:select name="transaction.id" from="${zw.co.quantum.legend.model.Transaction.list()}" optionKey="id" value="${postingInstance?.transaction?.id}"  />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'transaction', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'accountNumber', 'error')}">
								<label for="accountNumber" class="control-label"><g:message code="posting.accountNumber.label" default="Account Number" /></label>
				            	<div class="controls">
									<g:textField name="accountNumber" maxlength="30" value="${postingInstance?.accountNumber}" />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'accountNumber', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'narrative', 'error')}">
								<label for="narrative" class="control-label"><g:message code="posting.narrative.label" default="Narrative" /></label>
				            	<div class="controls">
									<g:textField name="narrative" maxlength="100" value="${postingInstance?.narrative}" />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'narrative', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="posting.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${postingInstance.constraints.type.inList}" value="${postingInstance?.type}" valueMessagePrefix="posting.type"  />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'type', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'amount', 'error')}">
								<label for="amount" class="control-label"><g:message code="posting.amount.label" default="Amount" /></label>
				            	<div class="controls">
									<g:textField name="amount" value="${fieldValue(bean: postingInstance, field: 'amount')}" />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'amount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'balance', 'error')}">
								<label for="balance" class="control-label"><g:message code="posting.balance.label" default="Balance" /></label>
				            	<div class="controls">
									<g:textField name="balance" value="${fieldValue(bean: postingInstance, field: 'balance')}" />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'balance', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: postingInstance, field: 'valueDate', 'error')}">
								<label for="valueDate" class="control-label"><g:message code="posting.valueDate.label" default="Value Date" /></label>
				            	<div class="controls">
									<g:datePicker name="valueDate" precision="day" value="${postingInstance?.valueDate}"  />
									<span class="help-inline">${hasErrors(bean: postingInstance, field: 'valueDate', 'error')}</span>
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
