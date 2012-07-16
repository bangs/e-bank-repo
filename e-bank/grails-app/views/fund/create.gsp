

<%@ page import="zw.co.quantum.legend.model.Fund" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fund.label', default: 'Fund')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${fundInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${fundInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: fundInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="fund.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="80" value="${fundInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: fundInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: fundInstance, field: 'code', 'error')}">
								<label for="code" class="control-label"><g:message code="fund.code.label" default="Code" /></label>
				            	<div class="controls">
									<g:textField name="code" maxlength="30" value="${fundInstance?.code}" />
									<span class="help-inline">${hasErrors(bean: fundInstance, field: 'code', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: fundInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="fund.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="160" value="${fundInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: fundInstance, field: 'description', 'error')}</span>
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
