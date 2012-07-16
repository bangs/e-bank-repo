

<%@ page import="zw.co.quantum.legend.model.Fee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fee.label', default: 'Fee')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${feeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${feeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="fee.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="60" value="${feeInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="fee.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="150" value="${feeInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'transactionType', 'error')}">
								<label for="transactionType" class="control-label"><g:message code="fee.transactionType.label" default="Transaction Type" /></label>
				            	<div class="controls">
									<g:select name="transactionType" from="${feeInstance.constraints.transactionType.inList}" value="${feeInstance?.transactionType}" valueMessagePrefix="fee.transactionType"  />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'transactionType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="fee.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${feeInstance.constraints.type.inList}" value="${feeInstance?.type}" valueMessagePrefix="fee.type"  />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'type', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'frequency', 'error')}">
								<label for="frequency" class="control-label"><g:message code="fee.frequency.label" default="Frequency" /></label>
				            	<div class="controls">
									<g:select name="frequency" from="${feeInstance.constraints.frequency.inList}" value="${feeInstance?.frequency}" valueMessagePrefix="fee.frequency"  />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'frequency', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'appliesTo', 'error')}">
								<label for="appliesTo" class="control-label"><g:message code="fee.appliesTo.label" default="Applies To" /></label>
				            	<div class="controls">
									<g:select name="appliesTo" from="${feeInstance.constraints.appliesTo.inList}" value="${feeInstance?.appliesTo}" valueMessagePrefix="fee.appliesTo"  />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'appliesTo', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'amount', 'error')}">
								<label for="amount" class="control-label"><g:message code="fee.amount.label" default="Amount" /></label>
				            	<div class="controls">
									<g:textField name="amount" value="${fieldValue(bean: feeInstance, field: 'amount')}" />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'amount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'gLCode', 'error')}">
								<label for="gLCode" class="control-label"><g:message code="fee.gLCode.label" default="GL Code" /></label>
				            	<div class="controls">
									<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${feeInstance?.gLCode?.id}"  />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'gLCode', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: feeInstance, field: 'defaultFees', 'error')}">
								<label for="defaultFees" class="control-label"><g:message code="fee.defaultFees.label" default="Default Fees" /></label>
				            	<div class="controls">
									<g:checkBox name="defaultFees" value="${feeInstance?.defaultFees}" />
									<span class="help-inline">${hasErrors(bean: feeInstance, field: 'defaultFees', 'error')}</span>
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
