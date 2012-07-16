

<%@ page import="zw.co.quantum.legend.model.CollateralType" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'collateralType.label', default: 'CollateralType')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${collateralTypeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${collateralTypeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${collateralTypeInstance?.id}" />
		<g:hiddenField name="version" value="${collateralTypeInstance?.version}" />
					
						<div class="control-group ${hasErrors(bean: collateralTypeInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="collateralType.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="50" value="${collateralTypeInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: collateralTypeInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: collateralTypeInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="collateralType.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description" maxlength="160" value="${collateralTypeInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: collateralTypeInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: collateralTypeInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="collateralType.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${collateralTypeInstance.constraints.status.inList}" value="${collateralTypeInstance?.status}" valueMessagePrefix="collateralType.status"  />
								<span class="help-inline">${hasErrors(bean: collateralTypeInstance, field: 'status', 'error')}</span>
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
