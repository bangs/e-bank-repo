

<%@ page import="zw.co.quantum.legend.model.Institution" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${institutionInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${institutionInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: institutionInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="institution.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="150" value="${institutionInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: institutionInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: institutionInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="institution.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="250" value="${institutionInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: institutionInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: institutionInstance, field: 'address', 'error')}">
								<label for="address" class="control-label"><g:message code="institution.address.label" default="Address" /></label>
				            	<div class="controls">
									<g:render template="../address/form"></g:render>
									<span class="help-inline">${hasErrors(bean: institutionInstance, field: 'address', 'error')}</span>
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
