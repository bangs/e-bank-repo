

<%@ page import="zw.co.quantum.legend.model.ClientGroup" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientGroup.label', default: 'ClientGroup')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${clientGroupInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${clientGroupInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
							
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="clientGroup.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="100" value="${clientGroupInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="clientGroup.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="160" value="${clientGroupInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'accountType', 'error')}">
								<label for="accountType" class="control-label"><g:message code="clientGroup.accountType.label" default="Account Type" /></label>
				            	<div class="controls">
									<g:select name="accountType" from="${clientGroupInstance.constraints.accountType.inList}" value="${clientGroupInstance?.accountType}" valueMessagePrefix="clientGroup.accountType"  />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'accountType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'externalId', 'error')}">
								<label for="externalId" class="control-label"><g:message code="clientGroup.externalId.label" default="External Id" /></label>
				            	<div class="controls">
									<g:textField name="externalId" maxlength="30" value="${clientGroupInstance?.externalId}" />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'externalId', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'mobile', 'error')}">
								<label for="mobile" class="control-label"><g:message code="clientGroup.mobile.label" default="Mobile" /></label>
				            	<div class="controls">
									<g:textField name="mobile" maxlength="20" value="${clientGroupInstance?.mobile}" />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'mobile', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'email', 'error')}">
								<label for="email" class="control-label"><g:message code="clientGroup.email.label" default="Email" /></label>
				            	<div class="controls">
									<g:textField name="email" maxlength="120" value="${clientGroupInstance?.email}" />
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'email', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: clientGroupInstance, field: 'address', 'error')}">
								<label for="address" class="control-label"><g:message code="clientGroup.address.label" default="Address" /></label>
				            	<div class="controls">
									<g:render template="../address/form"></g:render>
									<span class="help-inline">${hasErrors(bean: clientGroupInstance, field: 'address', 'error')}</span>
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
