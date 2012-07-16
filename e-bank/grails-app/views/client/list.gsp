
<%@ page import="zw.co.quantum.legend.model.Client" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'client.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'client.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="mobile" title="${message(code: 'client.mobile.label', default: 'Mobile')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'client.email.label', default: 'Email')}" />
			
				<th><g:message code="client.address.label" default="Address" /></th>
			
				<th><g:message code="client.registeredBy.label" default="Registered By" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clientInstanceList}" status="i" var="clientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: clientInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "mobile")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "registeredBy")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${clientInstanceTotal}" />
	</div>
</section>

</body>

</html>
