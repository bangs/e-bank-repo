
<%@ page import="zw.co.quantum.legend.model.Posting" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'posting.label', default: 'Posting')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.transaction.label" default="Transaction" /></td>
				
				<td valign="top" class="value"><g:link controller="transaction" action="show" id="${postingInstance?.transaction?.id}">${postingInstance?.transaction?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.accountNumber.label" default="Account Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "accountNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.narrative.label" default="Narrative" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "narrative")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.balance.label" default="Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postingInstance, field: "balance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.valueDate.label" default="Value Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${postingInstance?.valueDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="posting.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${postingInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${postingInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
