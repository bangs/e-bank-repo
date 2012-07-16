
<%@ page import="zw.co.quantum.legend.model.Transaction" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'transaction.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="valueDate" title="${message(code: 'transaction.valueDate.label', default: 'Value Date')}" />
			
				<g:sortableColumn property="reference" title="${message(code: 'transaction.reference.label', default: 'Reference')}" />
			
				<g:sortableColumn property="sourceAccountNo" title="${message(code: 'transaction.sourceAccountNo.label', default: 'Source Account No')}" />
			
				<g:sortableColumn property="sourceAccountType" title="${message(code: 'transaction.sourceAccountType.label', default: 'Source Account Type')}" />
			
				<g:sortableColumn property="sourceAccountClass" title="${message(code: 'transaction.sourceAccountClass.label', default: 'Source Account Class')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "id")}</g:link></td>
			
				<td><g:formatDate date="${transactionInstance.valueDate}" /></td>
			
				<td>${fieldValue(bean: transactionInstance, field: "reference")}</td>
			
				<td>${fieldValue(bean: transactionInstance, field: "sourceAccountNo")}</td>
			
				<td>${fieldValue(bean: transactionInstance, field: "sourceAccountType")}</td>
			
				<td>${fieldValue(bean: transactionInstance, field: "sourceAccountClass")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${transactionInstanceTotal}" />
	</div>
</section>

</body>

</html>
