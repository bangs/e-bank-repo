<%@ page import="zw.co.quantum.legend.auth.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="role.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" value="${roleInstance?.authority}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'userRoles', 'error')} ">
	<label for="userRoles">
		<g:message code="role.userRoles.label" default="User Roles" />
		
	</label>
	
<ul>
<g:each in="${roleInstance?.userRoles?}" var="u">
    <li><g:link controller="userRole" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="userRole" action="create" params="['role.id': roleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userRole.label', default: 'UserRole')])}</g:link>

</div>

