
<%@ page import="zw.co.quantum.legend.model.Posting" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posting.label', default: 'Posting')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'posting.id.label', default: 'Id')}" />
			
				<th><g:message code="posting.transaction.label" default="Transaction" /></th>
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'posting.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="narrative" title="${message(code: 'posting.narrative.label', default: 'Narrative')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'posting.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="amount" title="${message(code: 'posting.amount.label', default: 'Amount')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${postingInstanceList}" status="i" var="postingInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${postingInstance.id}">${fieldValue(bean: postingInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: postingInstance, field: "transaction")}</td>
			
				<td>${fieldValue(bean: postingInstance, field: "accountNumber")}</td>
			
				<td>${fieldValue(bean: postingInstance, field: "narrative")}</td>
			
				<td>${fieldValue(bean: postingInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: postingInstance, field: "amount")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${postingInstanceTotal}" />
	</div>
</section>

</body>

</html>
