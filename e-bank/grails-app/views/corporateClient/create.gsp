

<%@ page import="zw.co.quantum.legend.model.CorporateClient" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'corporateClient.label', default: 'CorporateClient')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${corporateClientInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${corporateClientInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
	
							<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="corporateClient.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="100" value="${corporateClientInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'externalId', 'error')}">
								<label for="externalId" class="control-label"><g:message code="corporateClient.externalId.label" default="External Id" /></label>
				            	<div class="controls">
									<g:textField name="externalId" maxlength="30" value="${corporateClientInstance?.externalId}" />
									<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'externalId', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'mobile', 'error')}">
								<label for="mobile" class="control-label"><g:message code="corporateClient.mobile.label" default="Mobile" /></label>
				            	<div class="controls">
									<g:textField name="mobile" maxlength="20" value="${corporateClientInstance?.mobile}" />
									<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'mobile', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'email', 'error')}">
								<label for="email" class="control-label"><g:message code="corporateClient.email.label" default="Email" /></label>
				            	<div class="controls">
									<g:textField name="email" maxlength="120" value="${corporateClientInstance?.email}" />
									<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'email', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: corporateClientInstance, field: 'address', 'error')}">
								<label for="address" class="control-label"><g:message code="corporateClient.address.label" default="Address" /></label>
				            	<div class="controls">
									<g:render template="../address/form"></g:render>
									<span class="help-inline">${hasErrors(bean: corporateClientInstance, field: 'address', 'error')}</span>
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
