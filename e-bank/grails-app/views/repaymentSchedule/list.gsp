
<%@ page import="zw.co.quantum.legend.model.RepaymentSchedule" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'repaymentSchedule.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="installmentNo" title="${message(code: 'repaymentSchedule.installmentNo.label', default: 'Installment No')}" />
			
				<g:sortableColumn property="dueDate" title="${message(code: 'repaymentSchedule.dueDate.label', default: 'Due Date')}" />
			
				<g:sortableColumn property="principal" title="${message(code: 'repaymentSchedule.principal.label', default: 'Principal')}" />
			
				<g:sortableColumn property="interest" title="${message(code: 'repaymentSchedule.interest.label', default: 'Interest')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'repaymentSchedule.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${repaymentScheduleInstanceList}" status="i" var="repaymentScheduleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${repaymentScheduleInstance.id}">${fieldValue(bean: repaymentScheduleInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: repaymentScheduleInstance, field: "installmentNo")}</td>
			
				<td><g:formatDate date="${repaymentScheduleInstance.dueDate}" /></td>
			
				<td>${fieldValue(bean: repaymentScheduleInstance, field: "principal")}</td>
			
				<td>${fieldValue(bean: repaymentScheduleInstance, field: "interest")}</td>
			
				<td><g:formatDate date="${repaymentScheduleInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${repaymentScheduleInstanceTotal}" />
	</div>
</section>

</body>

</html>
