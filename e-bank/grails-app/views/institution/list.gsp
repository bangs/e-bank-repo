
<%@ page import="zw.co.quantum.legend.model.Institution" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
						
				<g:sortableColumn property="name" title="${message(code: 'institution.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'institution.description.label', default: 'Description')}" />
			
				<th><g:message code="institution.address.label" default="Address" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'institution.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'institution.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${institutionInstanceList}" status="i" var="institutionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${institutionInstance.id}">${fieldValue(bean: institutionInstance, field: "name")}</g:link></td>
						
				<td>${fieldValue(bean: institutionInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: institutionInstance, field: "address")}</td>
			
				<td><g:formatDate date="${institutionInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${institutionInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${institutionInstanceTotal}" />
	</div>
</section>

</body>

</html>
