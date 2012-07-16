

<%@ page import="zw.co.quantum.legend.model.ClientGroup" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientGroup.label', default: 'ClientGroup')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${clientGroupInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${clientGroupInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${clientGroupInstance?.id}" />
		<g:hiddenField name="version" value="${clientGroupInstance?.version}" />
							
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="clientGroup.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="100" value="${clientGroupInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="clientGroup.description.label" default="Description" /></label>
							<div class="controls">
								<g:textField name="description" maxlength="160" value="${clientGroupInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'accountType', 'error')}">
							<label for="accountType"><g:message code="clientGroup.accountType.label" default="Account Type" /></label>
							<div class="controls">
								<g:select name="accountType" from="${clientGroupInstance.constraints.accountType.inList}" value="${clientGroupInstance?.accountType}" valueMessagePrefix="clientGroup.accountType"  />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'accountType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'externalId', 'error')}">
							<label for="externalId"><g:message code="clientGroup.externalId.label" default="External Id" /></label>
							<div class="controls">
								<g:textField name="externalId" maxlength="30" value="${clientGroupInstance?.externalId}" />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'externalId', 'error')}</span>
							</div>
						</div>
						
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'mobile', 'error')}">
							<label for="mobile"><g:message code="clientGroup.mobile.label" default="Mobile" /></label>
							<div class="controls">
								<g:textField name="mobile" maxlength="20" value="${clientGroupInstance?.mobile}" />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'mobile', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'email', 'error')}">
							<label for="email"><g:message code="clientGroup.email.label" default="Email" /></label>
							<div class="controls">
								<g:textField name="email" maxlength="120" value="${clientGroupInstance?.email}" />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'email', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="clientGroup.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${clientGroupInstance.constraints.status.inList}" value="${clientGroupInstance?.status}" valueMessagePrefix="clientGroup.status"  />
								<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'status', 'error')}</span>
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
