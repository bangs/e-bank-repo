
<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsAccount.label', default: 'SavingsAccount')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'savingsAccount.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="accountName" title="${message(code: 'savingsAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="savingsAccount.branch.label" default="Branch" /></th>
						
				<g:sortableColumn property="product" title="${message(code: 'savingsAccount.product.label', default: 'Product')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'savingsAccount.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="groupAccountType" title="${message(code: 'savingsAccount.groupAccountType.label', default: 'Group Account Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${savingsAccountInstanceList}" status="i" var="savingsAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${savingsAccountInstance.id}">${fieldValue(bean: savingsAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "product")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "groupAccountType")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${savingsAccountInstanceTotal}" />
	</div>
</section>

</body>

</html>
