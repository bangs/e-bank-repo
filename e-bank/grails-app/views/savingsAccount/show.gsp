
<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>
<%@ page import="zw.co.quantum.legend.util.Constants" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsAccount.label', default: 'SavingsAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.accountName.label" default="Account Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsAccountInstance, field: "accountName")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.accountNumber.label" default="Account Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsAccountInstance, field: "accountNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsAccountInstance, field: "type")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${savingsAccountInstance?.branch?.id}">${savingsAccountInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.product.label" default="Product" /></td>
				
				<td valign="top" class="value"><g:link controller="savingsProduct" action="show" id="${savingsAccountInstance?.product?.id}">${savingsAccountInstance?.product?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.groupAccountType.label" default="Group Account Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsAccountInstance, field: "groupAccountType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsAccountInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsAccountInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsAccount.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsAccountInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${savingsAccountInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
			<g:if test="${ Constants.STATUS_PENDING_APPROVAL.equals(savingsAccountInstance?.status) }">
				<span class="button"><g:actionSubmit class="edit btn-secondary" action="approve" value="Approve" /></span>
			</g:if>
		</g:form>
	</div>
</section>

</body>

</html>
