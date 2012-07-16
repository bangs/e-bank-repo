

<%@ page import="zw.co.quantum.legend.model.Fund" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fund.label', default: 'Fund')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${fundInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${fundInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${fundInstance?.id}" />
		<g:hiddenField name="version" value="${fundInstance?.version}" />
								
						<div class="control-group ${hasErrors(bean: fundInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="fund.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="80" value="${fundInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: fundInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: fundInstance, field: 'code', 'error')}">
							<label for="code"><g:message code="fund.code.label" default="Code" /></label>
							<div class="controls">
								<g:textField name="code" maxlength="30" value="${fundInstance?.code}" />
								<span class="help-inline">${hasErrors(bean: fundInstance, field: 'code', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: fundInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="fund.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description" maxlength="160" value="${fundInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: fundInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: fundInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="fund.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${fundInstance.constraints.status.inList}" value="${fundInstance?.status}" valueMessagePrefix="fund.status"  />
								<span class="help-inline">${hasErrors(bean: fundInstance, field: 'status', 'error')}</span>
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
