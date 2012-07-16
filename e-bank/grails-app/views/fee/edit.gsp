

<%@ page import="zw.co.quantum.legend.model.Fee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fee.label', default: 'Fee')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${feeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${feeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${feeInstance?.id}" />
		<g:hiddenField name="version" value="${feeInstance?.version}" />
				
						
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="fee.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="60" value="${feeInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="fee.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description" maxlength="150" value="${feeInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'transactionType', 'error')}">
							<label for="transactionType"><g:message code="fee.transactionType.label" default="Transaction Type" /></label>
							<div class="controls">
								<g:select name="transactionType" from="${feeInstance.constraints.transactionType.inList}" value="${feeInstance?.transactionType}" valueMessagePrefix="fee.transactionType"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'transactionType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="fee.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${feeInstance.constraints.type.inList}" value="${feeInstance?.type}" valueMessagePrefix="fee.type"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'frequency', 'error')}">
							<label for="frequency"><g:message code="fee.frequency.label" default="Frequency" /></label>
							<div class="controls">
								<g:select name="frequency" from="${feeInstance.constraints.frequency.inList}" value="${feeInstance?.frequency}" valueMessagePrefix="fee.frequency"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'frequency', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'appliesTo', 'error')}">
							<label for="appliesTo"><g:message code="fee.appliesTo.label" default="Applies To" /></label>
							<div class="controls">
								<g:select name="appliesTo" from="${feeInstance.constraints.appliesTo.inList}" value="${feeInstance?.appliesTo}" valueMessagePrefix="fee.appliesTo"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'appliesTo', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'amount', 'error')}">
							<label for="amount"><g:message code="fee.amount.label" default="Amount" /></label>
							<div class="controls">
								<g:textField name="amount" value="${fieldValue(bean: feeInstance, field: 'amount')}" />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'amount', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'gLCode', 'error')}">
							<label for="gLCode"><g:message code="fee.gLCode.label" default="GLC ode" /></label>
							<div class="controls">
								<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${feeInstance?.gLCode?.id}"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'gLCode', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'defaultFees', 'error')}">
							<label for="defaultFees"><g:message code="fee.defaultFees.label" default="Default Fees" /></label>
							<div class="controls">
								<g:checkBox name="defaultFees" value="${feeInstance?.defaultFees}" />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'defaultFees', 'error')}</span>
							</div>
						</div>
						
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="fee.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${feeInstance.constraints.status.inList}" value="${feeInstance?.status}" valueMessagePrefix="fee.status"  />
								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'status', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: feeInstance, field: 'appliedFees', 'error')}">
							<label for="appliedFees"><g:message code="fee.appliedFees.label" default="Applied Fees" /></label>
							<div class="controls">
								
<ul>
<g:each in="${feeInstance?.appliedFees?}" var="a">
    <li><g:link controller="appliedFee" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="appliedFee" action="create" params="['fee.id': feeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'appliedFee.label', default: 'AppliedFee')])}</g:link>

								<span class="help-inline">${hasErrors(bean: feeInstance, field: 'appliedFees', 'error')}</span>
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
