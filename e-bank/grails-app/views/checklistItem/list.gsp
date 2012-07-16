
<%@ page import="zw.co.quantum.legend.model.ChecklistItem" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklistItem.label', default: 'ChecklistItem')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'checklistItem.id.label', default: 'Id')}" />
			
				<th><g:message code="checklistItem.checklist.label" default="Checklist" /></th>
			
				<g:sortableColumn property="description" title="${message(code: 'checklistItem.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'checklistItem.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'checklistItem.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${checklistItemInstanceList}" status="i" var="checklistItemInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${checklistItemInstance.id}">${fieldValue(bean: checklistItemInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: checklistItemInstance, field: "checklist")}</td>
			
				<td>${fieldValue(bean: checklistItemInstance, field: "description")}</td>
			
				<td><g:formatDate date="${checklistItemInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${checklistItemInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${checklistItemInstanceTotal}" />
	</div>
</section>

</body>

</html>
