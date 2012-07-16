

<%@ page import="zw.co.quantum.legend.model.SystemAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'systemAccount.label', default: 'SystemAccount')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${systemAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${systemAccountInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${systemAccountInstance?.id}" />
		<g:hiddenField name="version" value="${systemAccountInstance?.version}" />
				
					
						<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'accountNumber', 'error')}">
							<label for="accountNumber"><g:message code="systemAccount.accountNumber.label" default="Account Number" /></label>
							<div class="controls">
								<g:textField name="accountNumber" maxlength="30" value="${systemAccountInstance?.accountNumber}" />
								<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'accountNumber', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="systemAccount.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${systemAccountInstance.constraints.type.inList}" value="${systemAccountInstance?.type}" valueMessagePrefix="systemAccount.type"  />
								<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="systemAccount.description.label" default="Description" /></label>
							<div class="controls">
								<g:textField name="description" value="${systemAccountInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'description', 'error')}</span>
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
