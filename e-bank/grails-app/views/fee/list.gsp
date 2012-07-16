
<%@ page import="zw.co.quantum.legend.model.Fee" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fee.label', default: 'Fee')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'fee.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'fee.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="transactionType" title="${message(code: 'fee.transactionType.label', default: 'Transaction Type')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'fee.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${feeInstanceList}" status="i" var="feeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${feeInstance.id}">${fieldValue(bean: feeInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: feeInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: feeInstance, field: "transactionType")}</td>
			
				<td>${fieldValue(bean: feeInstance, field: "type")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${feeInstanceTotal}" />
	</div>
</section>

</body>

</html>
