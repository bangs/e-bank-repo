
<%@ page import="zw.co.quantum.legend.auth.UserRole" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'userRole.id.label', default: 'Id')}" />
			
				<th><g:message code="userRole.role.label" default="Role" /></th>
			
				<th><g:message code="userRole.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userRoleInstance.id}">${fieldValue(bean: userRoleInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: userRoleInstance, field: "role")}</td>
			
				<td>${fieldValue(bean: userRoleInstance, field: "user")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userRoleInstanceTotal}" />
	</div>
</section>

</body>

</html>
