
<%@ page import="zw.co.quantum.legend.model.Branch" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'branch.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'branch.name.label', default: 'Name')}" />
						
				<g:sortableColumn property="status" title="${message(code: 'branch.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'branch.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${branchInstanceList}" status="i" var="branchInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${branchInstance.id}">${fieldValue(bean: branchInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: branchInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: branchInstance, field: "status")}</td>
			
				<td><g:formatDate date="${branchInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${branchInstanceTotal}" />
	</div>
</section>

</body>

</html>
