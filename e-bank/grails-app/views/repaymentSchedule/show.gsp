
<%@ page import="zw.co.quantum.legend.model.RepaymentSchedule" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: repaymentScheduleInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.installmentNo.label" default="Installment No" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: repaymentScheduleInstance, field: "installmentNo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.dueDate.label" default="Due Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${repaymentScheduleInstance?.dueDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.principal.label" default="Principal" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: repaymentScheduleInstance, field: "principal")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.interest.label" default="Interest" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: repaymentScheduleInstance, field: "interest")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${repaymentScheduleInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${repaymentScheduleInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="repaymentSchedule.loanAccount.label" default="Loan Account" /></td>
				
				<td valign="top" class="value"><g:link controller="loanAccount" action="show" id="${repaymentScheduleInstance?.loanAccount?.id}">${repaymentScheduleInstance?.loanAccount?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${repaymentScheduleInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
