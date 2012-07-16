

<%@ page import="zw.co.quantum.legend.auth.UserRole" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${userRoleInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userRoleInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: userRoleInstance, field: 'role', 'error')}">
								<label for="role" class="control-label"><g:message code="userRole.role.label" default="Role" /></label>
				            	<div class="controls">
									<g:select name="role.id" from="${zw.co.quantum.legend.auth.Role.list()}" optionKey="id" value="${userRoleInstance?.role?.id}"  />
									<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'role', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userRoleInstance, field: 'user', 'error')}">
								<label for="user" class="control-label"><g:message code="userRole.user.label" default="User" /></label>
				            	<div class="controls">
									<g:select name="user.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${userRoleInstance?.user?.id}"  />
									<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'user', 'error')}</span>
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
