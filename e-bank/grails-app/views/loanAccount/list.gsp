
<%@ page import="zw.co.quantum.legend.model.LoanAccount" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanAccount.label', default: 'LoanAccount')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'loanAccount.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="accountName" title="${message(code: 'loanAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="loanAccount.branch.label" default="Branch" /></th>
						
				<g:sortableColumn property="type" title="${message(code: 'loanAccount.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="product" title="${message(code: 'loanAccount.product.label', default: 'Loan Product')}" />
			
				<g:sortableColumn property="amount" title="${message(code: 'loanAccount.amount.label', default: 'Amount')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${loanAccountInstanceList}" status="i" var="loanAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${loanAccountInstance.id}">${fieldValue(bean: loanAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "branch")}</td>
						
				<td>${fieldValue(bean: loanAccountInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "product")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "amount")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${loanAccountInstanceTotal}" />
	</div>
</section>

</body>

</html>
