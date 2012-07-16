

<%@ page import="zw.co.quantum.legend.model.GLCode" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'GLCode.label', default: 'GLCode')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${GLCodeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${GLCodeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${GLCodeInstance?.id}" />
		<g:hiddenField name="version" value="${GLCodeInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'code', 'error')}">
							<label for="code"><g:message code="GLCode.code.label" default="Code" /></label>
							<div class="controls">
								<g:textField name="code" maxlength="20" value="${GLCodeInstance?.code}" />
								<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'code', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="GLCode.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${GLCodeInstance.constraints.type.inList}" value="${GLCodeInstance?.type}" valueMessagePrefix="GLCode.type"  />
								<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="GLCode.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description" maxlength="100" value="${GLCodeInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="GLCode.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${GLCodeInstance.constraints.status.inList}" value="${GLCodeInstance?.status}" valueMessagePrefix="GLCode.status"  />
								<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'status', 'error')}</span>
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
