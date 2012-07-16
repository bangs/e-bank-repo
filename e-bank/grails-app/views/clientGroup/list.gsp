
<%@ page import="zw.co.quantum.legend.model.ClientGroup" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientGroup.label', default: 'ClientGroup')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'clientGroup.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'clientGroup.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="accountType" title="${message(code: 'clientGroup.accountType.label', default: 'Account Type')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'clientGroup.email.label', default: 'Email')}" />
			
				<th><g:message code="clientGroup.address.label" default="Address" /></th>
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${clientGroupInstanceList}" status="i" var="clientGroupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clientGroupInstance.id}">${fieldValue(bean: clientGroupInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "accountType")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "address")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${clientGroupInstanceTotal}" />
	</div>
</section>

</body>

</html>
