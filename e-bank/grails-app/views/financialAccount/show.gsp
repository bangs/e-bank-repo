
<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'financialAccount.label', default: 'FinancialAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${financialAccountInstance?.branch?.id}">${financialAccountInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.accountNumber.label" default="Account Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "accountNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.ownerId.label" default="Owner Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "ownerId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.ownerClass.label" default="Owner Class" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "ownerClass")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.ownerType.label" default="Owner Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "ownerType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.superType.label" default="Super Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: financialAccountInstance, field: "superType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${financialAccountInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="financialAccount.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${financialAccountInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${financialAccountInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
