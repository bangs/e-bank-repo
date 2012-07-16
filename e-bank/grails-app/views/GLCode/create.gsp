

<%@ page import="zw.co.quantum.legend.model.GLCode" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'GLCode.label', default: 'GLCode')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${GLCodeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${GLCodeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'code', 'error')}">
								<label for="code" class="control-label"><g:message code="GLCode.code.label" default="Code" /></label>
				            	<div class="controls">
									<g:textField name="code" maxlength="20" value="${GLCodeInstance?.code}" />
									<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'code', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="GLCode.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${GLCodeInstance.constraints.type.inList}" value="${GLCodeInstance?.type}" valueMessagePrefix="GLCode.type"  />
									<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'type', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: GLCodeInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="GLCode.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="100" value="${GLCodeInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: GLCodeInstance, field: 'description', 'error')}</span>
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
