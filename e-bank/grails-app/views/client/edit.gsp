

<%@ page import="zw.co.quantum.legend.model.Client" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${clientInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${clientInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${clientInstance?.id}" />
		<g:hiddenField name="version" value="${clientInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="client.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${clientInstance.constraints.type.inList}" value="${clientInstance?.type}" valueMessagePrefix="client.type"  />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'mobile', 'error')}">
							<label for="mobile"><g:message code="client.mobile.label" default="Mobile" /></label>
							<div class="controls">
								<g:textField name="mobile" maxlength="20" value="${clientInstance?.mobile}" />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'mobile', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'email', 'error')}">
							<label for="email"><g:message code="client.email.label" default="Email" /></label>
							<div class="controls">
								<g:textField name="email" maxlength="120" value="${clientInstance?.email}" />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'email', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'address', 'error')}">
							<label for="address"><g:message code="client.address.label" default="Address" /></label>
							<div class="controls">
								<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${clientInstance?.address?.id}"  />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'address', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'registeredBy', 'error')}">
							<label for="registeredBy"><g:message code="client.registeredBy.label" default="Registered By" /></label>
							<div class="controls">
								<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${clientInstance?.registeredBy?.id}"  />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'registeredBy', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'branch', 'error')}">
							<label for="branch"><g:message code="client.branch.label" default="Branch" /></label>
							<div class="controls">
								<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${clientInstance?.branch?.id}"  />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'branch', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: clientInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="client.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${clientInstance.constraints.status.inList}" value="${clientInstance?.status}" valueMessagePrefix="client.status"  />
								<span class="help-inline">${hasErrors(bean: clientInstance, field: 'status', 'error')}</span>
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
