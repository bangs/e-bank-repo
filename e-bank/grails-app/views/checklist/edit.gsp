

<%@ page import="zw.co.quantum.legend.model.Checklist" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklist.label', default: 'Checklist')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${checklistInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${checklistInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${checklistInstance?.id}" />
		<g:hiddenField name="version" value="${checklistInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: checklistInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="checklist.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="100" value="${checklistInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: checklistInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="checklist.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${checklistInstance.constraints.type.inList}" value="${checklistInstance?.type}" valueMessagePrefix="checklist.type"  />
								<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: checklistInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="checklist.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${checklistInstance.constraints.status.inList}" value="${checklistInstance?.status}" valueMessagePrefix="checklist.status"  />
								<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'status', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: checklistInstance, field: 'items', 'error')}">
							<label for="items"><g:message code="checklist.items.label" default="Items" /></label>
							<div class="controls">
								
<ul>
<g:each in="${checklistInstance?.items?}" var="i">
    <li><g:link controller="checklistItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="checklistItem" action="create" params="['checklist.id': checklistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'checklistItem.label', default: 'ChecklistItem')])}</g:link>

								<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'items', 'error')}</span>
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
