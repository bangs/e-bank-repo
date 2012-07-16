

<%@ page import="zw.co.quantum.legend.model.Institution" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${institutionInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${institutionInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${institutionInstance?.id}" />
		<g:hiddenField name="version" value="${institutionInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: institutionInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="institution.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="150" value="${institutionInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: institutionInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: institutionInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="institution.description.label" default="Description" /></label>
							<div class="controls">
								<g:textField name="description" maxlength="250" value="${institutionInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: institutionInstance, field: 'description', 'error')}</span>
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
