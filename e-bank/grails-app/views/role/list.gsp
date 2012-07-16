
<%@ page import="zw.co.quantum.legend.auth.Role" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'role.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="authority" title="${message(code: 'role.authority.label', default: 'Authority')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${roleInstanceList}" status="i" var="roleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${roleInstance.id}">${fieldValue(bean: roleInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: roleInstance, field: "authority")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${roleInstanceTotal}" />
	</div>
</section>

</body>

</html>
