
<%@ page import="zw.co.quantum.legend.model.Fund" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fund.label', default: 'Fund')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
						
				<g:sortableColumn property="name" title="${message(code: 'fund.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="code" title="${message(code: 'fund.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'fund.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'fund.status.label', default: 'Status')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${fundInstanceList}" status="i" var="fundInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${fundInstance.id}">${fieldValue(bean: fundInstance, field: "name")}</g:link></td>
						
				<td>${fieldValue(bean: fundInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: fundInstance, field: "code")}</td>
			
				<td>${fieldValue(bean: fundInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: fundInstance, field: "status")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${fundInstanceTotal}" />
	</div>
</section>

</body>

</html>
