
<%@ page import="zw.co.quantum.legend.model.IndividualClient" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'individualClient.label', default: 'IndividualClient')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="lastName" title="${message(code: 'individualClient.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="firstName" title="${message(code: 'individualClient.firstName.label', default: 'First Name')}" />
			
				<g:sortableColumn property="nationalId" title="${message(code: 'individualClient.nationalId.label', default: 'National ID')}" />
			
				<g:sortableColumn property="mobile" title="${message(code: 'individualClient.mobile.label', default: 'Mobile')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'individualClient.email.label', default: 'Email')}" />
			
				<th><g:message code="individualClient.address.label" default="Address" /></th>
			
				<th><g:message code="individualClient.registeredBy.label" default="Registered By" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${individualClientInstanceList}" status="i" var="individualClientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${individualClientInstance.id}">${fieldValue(bean: individualClientInstance, field: "lastName")}</g:link></td>
			
				<td>${fieldValue(bean: individualClientInstance, field: "firstName")}</td>
				
				<td>${fieldValue(bean: individualClientInstance, field: "nationalId")}</td>
			
				<td>${fieldValue(bean: individualClientInstance, field: "mobile")}</td>
			
				<td>${fieldValue(bean: individualClientInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: individualClientInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: individualClientInstance, field: "registeredBy")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${individualClientInstanceTotal}" />
	</div>
</section>

</body>

</html>
