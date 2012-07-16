

<%@ page import="zw.co.quantum.legend.model.Checklist" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklist.label', default: 'Checklist')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${checklistInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${checklistInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: checklistInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="checklist.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="100" value="${checklistInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: checklistInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="checklist.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${checklistInstance.constraints.type.inList}" value="${checklistInstance?.type}" valueMessagePrefix="checklist.type"  />
									<span class="help-inline">${hasErrors(bean: checklistInstance, field: 'type', 'error')}</span>
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
