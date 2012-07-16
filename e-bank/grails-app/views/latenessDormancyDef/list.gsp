
<%@ page import="zw.co.quantum.legend.model.LatenessDormancyDef" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'latenessDormancyDef.id.label', default: 'Id')}" />
						
				<g:sortableColumn property="lateLoanRepaymentGracePeriod" title="${message(code: 'latenessDormancyDef.lateLoanRepaymentGracePeriod.label', default: 'Late Loan Repayment Grace Period')}" />
			
				<g:sortableColumn property="dormantSavingsAccGracePeriod" title="${message(code: 'latenessDormancyDef.dormantSavingsAccGracePeriod.label', default: 'Dormant Savings Acc Grace Period')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'latenessDormancyDef.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'latenessDormancyDef.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${latenessDormancyDefInstanceList}" status="i" var="latenessDormancyDefInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${latenessDormancyDefInstance.id}">${fieldValue(bean: latenessDormancyDefInstance, field: "id")}</g:link></td>
						
				<td>${fieldValue(bean: latenessDormancyDefInstance, field: "lateLoanRepaymentGracePeriod")}</td>
			
				<td>${fieldValue(bean: latenessDormancyDefInstance, field: "dormantSavingsAccGracePeriod")}</td>
			
				<td>${fieldValue(bean: latenessDormancyDefInstance, field: "status")}</td>
			
				<td><g:formatDate date="${latenessDormancyDefInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${latenessDormancyDefInstanceTotal}" />
	</div>
</section>

</body>

</html>
