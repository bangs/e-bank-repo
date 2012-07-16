
<%@ page import="zw.co.quantum.legend.model.Transaction" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.valueDate.label" default="Value Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${transactionInstance?.valueDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.reference.label" default="Reference" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "reference")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.sourceAccountNo.label" default="Source Account No" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "sourceAccountNo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.sourceAccountType.label" default="Source Account Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "sourceAccountType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.sourceAccountClass.label" default="Source Account Class" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "sourceAccountClass")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.destinationAccountNo.label" default="Destination Account No" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "destinationAccountNo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.destinationAccountType.label" default="Destination Account Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "destinationAccountType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.destinationAccountClass.label" default="Destination Account Class" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "destinationAccountClass")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.paymentRef.label" default="Payment Ref" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "paymentRef")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.narrative.label" default="Narrative" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "narrative")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.gLCode.label" default="GLC ode" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "gLCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.initiator.label" default="Initiator" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${transactionInstance?.initiator?.id}">${transactionInstance?.initiator?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.approver.label" default="Approver" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${transactionInstance?.approver?.id}">${transactionInstance?.approver?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${transactionInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${transactionInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="transaction.postings.label" default="Postings" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${transactionInstance.postings}" var="p">
						<li><g:link controller="posting" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${transactionInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
