
<%@ page import="zw.co.quantum.legend.model.LatenessDormancyDef" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="latenessDormancyDef.lateLoanRepaymentGracePeriod.label" default="Late Loan Repayment Grace Period" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: latenessDormancyDefInstance, field: "lateLoanRepaymentGracePeriod")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="latenessDormancyDef.dormantSavingsAccGracePeriod.label" default="Dormant Savings Acc Grace Period" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: latenessDormancyDefInstance, field: "dormantSavingsAccGracePeriod")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="latenessDormancyDef.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: latenessDormancyDefInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="latenessDormancyDef.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${latenessDormancyDefInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="latenessDormancyDef.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${latenessDormancyDefInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${latenessDormancyDefInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
