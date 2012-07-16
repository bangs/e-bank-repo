
<%@ page import="zw.co.quantum.legend.model.Holiday" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'holiday.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="startDate" title="${message(code: 'holiday.startDate.label', default: 'Start Date')}" />
			
				<g:sortableColumn property="endDate" title="${message(code: 'holiday.endDate.label', default: 'End Date')}" />
			
				<g:sortableColumn property="repaymentRule" title="${message(code: 'holiday.repaymentRule.label', default: 'Repayment Rule')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${holidayInstanceList}" status="i" var="holidayInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${holidayInstance.id}">${fieldValue(bean: holidayInstance, field: "name")}</g:link></td>
			
				<td><g:formatDate date="${holidayInstance.startDate}" /></td>
			
				<td><g:formatDate date="${holidayInstance.endDate}" /></td>
			
				<td>${fieldValue(bean: holidayInstance, field: "repaymentRule")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${holidayInstanceTotal}" />
	</div>
</section>

</body>

</html>
