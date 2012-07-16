

<%@ page import="zw.co.quantum.legend.auth.Role" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${roleInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${roleInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: roleInstance, field: 'authority', 'error')}">
								<label for="authority" class="control-label"><g:message code="role.authority.label" default="Authority" /></label>
				            	<div class="controls">
									<g:textField name="authority" value="${roleInstance?.authority}" />
									<span class="help-inline">${hasErrors(bean: roleInstance, field: 'authority', 'error')}</span>
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
