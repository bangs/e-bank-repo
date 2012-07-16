

<%@ page import="zw.co.quantum.legend.model.CorporateClient" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'corporateClient.label', default: 'CorporateClient')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${corporateClientInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${corporateClientInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${corporateClientInstance?.id}" />
		<g:hiddenField name="version" value="${corporateClientInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="corporateClient.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${corporateClientInstance.constraints.type.inList}" value="${corporateClientInstance?.type}" valueMessagePrefix="corporateClient.type"  />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'mobile', 'error')}">
							<label for="mobile"><g:message code="corporateClient.mobile.label" default="Mobile" /></label>
							<div class="controls">
								<g:textField name="mobile" maxlength="20" value="${corporateClientInstance?.mobile}" />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'mobile', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'email', 'error')}">
							<label for="email"><g:message code="corporateClient.email.label" default="Email" /></label>
							<div class="controls">
								<g:textField name="email" maxlength="120" value="${corporateClientInstance?.email}" />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'email', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'address', 'error')}">
							<label for="address"><g:message code="corporateClient.address.label" default="Address" /></label>
							<div class="controls">
								<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${corporateClientInstance?.address?.id}"  />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'address', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'registeredBy', 'error')}">
							<label for="registeredBy"><g:message code="corporateClient.registeredBy.label" default="Registered By" /></label>
							<div class="controls">
								<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${corporateClientInstance?.registeredBy?.id}"  />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'registeredBy', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'branch', 'error')}">
							<label for="branch"><g:message code="corporateClient.branch.label" default="Branch" /></label>
							<div class="controls">
								<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${corporateClientInstance?.branch?.id}"  />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'branch', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="corporateClient.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${corporateClientInstance.constraints.status.inList}" value="${corporateClientInstance?.status}" valueMessagePrefix="corporateClient.status"  />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'status', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="corporateClient.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="100" value="${corporateClientInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'externalId', 'error')}">
							<label for="externalId"><g:message code="corporateClient.externalId.label" default="External Id" /></label>
							<div class="controls">
								<g:textField name="externalId" maxlength="30" value="${corporateClientInstance?.externalId}" />
								<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'externalId', 'error')}</span>
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
