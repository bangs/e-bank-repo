
<%@ page import="zw.co.quantum.legend.model.SystemAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'systemAccount.label', default: 'SystemAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${systemAccountInstance?.branch?.id}">${systemAccountInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.accountNumber.label" default="Account Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: systemAccountInstance, field: "accountNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.accountName.label" default="Account Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: systemAccountInstance, field: "accountName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: systemAccountInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: systemAccountInstance, field: "description")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${systemAccountInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="systemAccount.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${systemAccountInstance?.lastUpdated}" /></td>
				
			</tr>
			
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${systemAccountInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
