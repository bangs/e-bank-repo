

<%@ page import="zw.co.quantum.legend.auth.Role" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${roleInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${roleInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${roleInstance?.id}" />
		<g:hiddenField name="version" value="${roleInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: roleInstance, field: 'authority', 'error')}">
							<label for="authority"><g:message code="role.authority.label" default="Authority" /></label>
							<div class="controls">
								<g:textField name="authority" value="${roleInstance?.authority}" />
								<span class="help-inline">${hasErrors(bean: roleInstance, field: 'authority', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: roleInstance, field: 'userRoles', 'error')}">
							<label for="userRoles"><g:message code="role.userRoles.label" default="User Roles" /></label>
							<div class="controls">
								
<ul>
<g:each in="${roleInstance?.userRoles?}" var="u">
    <li><g:link controller="userRole" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="userRole" action="create" params="['role.id': roleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userRole.label', default: 'UserRole')])}</g:link>

								<span class="help-inline">${hasErrors(bean: roleInstance, field: 'userRoles', 'error')}</span>
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
