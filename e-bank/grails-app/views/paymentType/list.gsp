
<%@ page import="zw.co.quantum.legend.model.PaymentType" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentType.label', default: 'PaymentType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'paymentType.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'paymentType.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'paymentType.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'paymentType.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paymentTypeInstanceList}" status="i" var="paymentTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${paymentTypeInstance.id}">${fieldValue(bean: paymentTypeInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: paymentTypeInstance, field: "status")}</td>
			
				<td><g:formatDate date="${paymentTypeInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${paymentTypeInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${paymentTypeInstanceTotal}" />
	</div>
</section>

</body>

</html>
