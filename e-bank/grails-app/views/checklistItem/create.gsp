

<%@ page import="zw.co.quantum.legend.model.ChecklistItem" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklistItem.label', default: 'ChecklistItem')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${checklistItemInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${checklistItemInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: checklistItemInstance, field: 'checklist', 'error')}">
								<label for="checklist" class="control-label"><g:message code="checklistItem.checklist.label" default="Checklist" /></label>
				            	<div class="controls">
									<g:select name="checklist.id" from="${zw.co.quantum.legend.model.Checklist.list()}" 
											optionKey="id" value="${checklistItemInstance?.checklist?.id}" disabled="true" />
									<span class="help-inline">${hasErrors(bean: checklistItemInstance, field: 'checklist', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: checklistItemInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="checklistItem.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="200" value="${checklistItemInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: checklistItemInstance, field: 'description', 'error')}</span>
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
