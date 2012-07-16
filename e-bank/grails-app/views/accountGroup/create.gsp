

<%@ page import="zw.co.quantum.legend.model.AccountGroup" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'accountGroup.label', default: 'AccountGroup')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${accountGroupInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${accountGroupInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="accountGroup.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="100" value="${accountGroupInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="accountGroup.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="160" value="${accountGroupInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'branch', 'error')}">
								<label for="branch" class="control-label"><g:message code="accountGroup.branch.label" default="Branch" /></label>
				            	<div class="controls">
									<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${accountGroupInstance?.branch?.id}"  />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'branch', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'recruitedBy', 'error')}">
								<label for="recruitedBy" class="control-label"><g:message code="accountGroup.recruitedBy.label" default="Recruited By" /></label>
				            	<div class="controls">
									<g:select name="recruitedBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${accountGroupInstance?.recruitedBy?.id}"  />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'recruitedBy', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'externalId', 'error')}">
								<label for="externalId" class="control-label"><g:message code="accountGroup.externalId.label" default="External Id" /></label>
				            	<div class="controls">
									<g:textField name="externalId" maxlength="30" value="${accountGroupInstance?.externalId}" />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'externalId', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'address', 'error')}">
								<label for="address" class="control-label"><g:message code="accountGroup.address.label" default="Address" /></label>
				            	<div class="controls">
									<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${accountGroupInstance?.address?.id}"  />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'address', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: accountGroupInstance, field: 'status', 'error')}">
								<label for="status" class="control-label"><g:message code="accountGroup.status.label" default="Status" /></label>
				            	<div class="controls">
									<g:select name="status" from="${accountGroupInstance.constraints.status.inList}" value="${accountGroupInstance?.status}" valueMessagePrefix="accountGroup.status"  />
									<span class="help-inline">${hasErrors(bean: accountGroupInstance, field: 'status', 'error')}</span>
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
