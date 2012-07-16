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
						
				<g:sortableColumn property="installmentNo" title="${message(code: 'repaymentSchedule.installmentNo.label', default: 'Installment No')}" />
			
				<g:sortableColumn property="dueDate" title="${message(code: 'repaymentSchedule.dueDate.label', default: 'Due Date')}" />
			
				<g:sortableColumn property="principal" title="${message(code: 'repaymentSchedule.principal.label', default: 'Principal')}" />
			
				<g:sortableColumn property="interest" title="${message(code: 'repaymentSchedule.interest.label', default: 'Interest')}" />
			
				<g:sortableColumn property="dateCreated" title="Total" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${repaymentScheduleInstanceList}" status="i" var="repaymentScheduleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${repaymentScheduleInstance.id}">${fieldValue(bean: repaymentScheduleInstance, field: "installmentNo")}</g:link></td>
						
				<td><g:formatDate date="${repaymentScheduleInstance.dueDate}" format="dd-MM-yyyy"/></td>
			
				<td>${fieldValue(bean: repaymentScheduleInstance, field: "principal")}</td>
			
				<td>${fieldValue(bean: repaymentScheduleInstance, field: "interest")}</td>
			
				<td>${repaymentScheduleInstance.principal + repaymentScheduleInstance.interest}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${repaymentScheduleInstanceTotal}">
			<bs:paginate total="${repaymentScheduleInstanceTotal}" />
		</g:if>
	</div>
</section>

</body>

</html>