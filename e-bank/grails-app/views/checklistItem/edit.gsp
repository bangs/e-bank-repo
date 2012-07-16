

<%@ page import="zw.co.quantum.legend.model.ChecklistItem" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklistItem.label', default: 'ChecklistItem')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${checklistItemInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${checklistItemInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${checklistItemInstance?.id}" />
		<g:hiddenField name="version" value="${checklistItemInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: checklistItemInstance, field: 'checklist', 'error')}">
							<label for="checklist"><g:message code="checklistItem.checklist.label" default="Checklist" /></label>
							<div class="controls">
								<g:select name="checklist.id" from="${zw.co.quantum.legend.model.Checklist.list()}" optionKey="id" value="${checklistItemInstance?.checklist?.id}"  />
								<span class="help-inline">${hasErrors(bean: checklistItemInstance, field: 'checklist', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: checklistItemInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="checklistItem.description.label" default="Description" /></label>
							<div class="controls">
								<g:textField name="description" maxlength="200" value="${checklistItemInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: checklistItemInstance, field: 'description', 'error')}</span>
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
