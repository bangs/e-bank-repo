

<%@ page import="zw.co.quantum.legend.model.CollateralType" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'collateralType.label', default: 'CollateralType')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${collateralTypeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${collateralTypeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: collateralTypeInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="collateralType.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="50" value="${collateralTypeInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: collateralTypeInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: collateralTypeInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="collateralType.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="160" value="${collateralTypeInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: collateralTypeInstance, field: 'description', 'error')}</span>
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
