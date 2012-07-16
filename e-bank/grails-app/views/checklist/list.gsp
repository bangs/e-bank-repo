
<%@ page import="zw.co.quantum.legend.model.Checklist" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklist.label', default: 'Checklist')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
						
				<g:sortableColumn property="name" title="${message(code: 'checklist.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'checklist.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'checklist.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'checklist.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'checklist.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${checklistInstanceList}" status="i" var="checklistInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${checklistInstance.id}">${fieldValue(bean: checklistInstance, field: "name")}</g:link></td>
						
				<td>${fieldValue(bean: checklistInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: checklistInstance, field: "status")}</td>
			
				<td><g:formatDate date="${checklistInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${checklistInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${checklistInstanceTotal}" />
	</div>
</section>

</body>

</html>
