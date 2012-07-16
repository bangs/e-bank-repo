
<%@ page import="zw.co.quantum.legend.model.CollateralType" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'collateralType.label', default: 'CollateralType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
									
				<g:sortableColumn property="name" title="${message(code: 'collateralType.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'collateralType.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'collateralType.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'collateralType.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${collateralTypeInstanceList}" status="i" var="collateralTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${collateralTypeInstance.id}">${fieldValue(bean: collateralTypeInstance, field: "name")}</g:link></td>
									
				<td>${fieldValue(bean: collateralTypeInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: collateralTypeInstance, field: "status")}</td>
			
				<td><g:formatDate date="${collateralTypeInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${collateralTypeInstanceTotal}" />
	</div>
</section>

</body>

</html>
