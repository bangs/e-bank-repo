
<%@ page import="zw.co.quantum.legend.model.AccountGroup" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'accountGroup.label', default: 'AccountGroup')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'accountGroup.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'accountGroup.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'accountGroup.description.label', default: 'Description')}" />
			
				<th><g:message code="accountGroup.branch.label" default="Branch" /></th>
			
				<th><g:message code="accountGroup.recruitedBy.label" default="Recruited By" /></th>
			
				<g:sortableColumn property="externalId" title="${message(code: 'accountGroup.externalId.label', default: 'External Id')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${accountGroupInstanceList}" status="i" var="accountGroupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${accountGroupInstance.id}">${fieldValue(bean: accountGroupInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: accountGroupInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: accountGroupInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: accountGroupInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: accountGroupInstance, field: "recruitedBy")}</td>
			
				<td>${fieldValue(bean: accountGroupInstance, field: "externalId")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${accountGroupInstanceTotal}" />
	</div>
</section>

</body>

</html>
