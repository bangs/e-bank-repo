<%@page import="java.lang.Math"%>
<%@ page import="zw.co.quantum.legend.model.Posting" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posting.label', default: 'Posting')}" />
	<title>Transaction History</title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'posting.dateCreated.label', default: 'Date')}" />
			
				<th><g:message code="posting.transaction.label" default="Reference" /></th>
				
				<g:sortableColumn property="transaction.type" title="${message(code: 'posting.transaction.type.label', default: 'Transaction Type')}" />
				
				<g:sortableColumn property="narrative" title="${message(code: 'posting.narrative.label', default: 'Narrative')}" />
												
				<g:sortableColumn property="amount" title="${message(code: 'posting.amount.label', default: 'Amount')}" />
			
				<g:sortableColumn property="balance" title="${message(code: 'posting.balance.label', default: 'Balance b/f')}" />
			
				<g:sortableColumn property="type" title=" " />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${postingInstanceList}" status="i" var="postingInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:formatDate date="${postingInstance.dateCreated}" format="dd-MM-yyyy"/></td>
			
				<td>${fieldValue(bean: postingInstance, field: "transaction")}</td>
				
				<td>${ postingInstance?.transaction?.type }</td>
						
				<td>${fieldValue(bean: postingInstance, field: "narrative")}</td>
			
				<td>${postingInstance?.amount}</td>
			
				<td>${ Math.abs(postingInstance?.balance) }</td>
			
				<td>${ postingInstance?.balance < 0 ? 'DR' : 'CR' }</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${postingInstanceTotal}">
			<bs:paginate total="${postingInstanceTotal}" />
		</g:if>
	</div>
</section>

</body>

</html>
