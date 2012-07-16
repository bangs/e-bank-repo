
<%@ page import="zw.co.quantum.legend.model.AccountGroup" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'accountGroup.label', default: 'AccountGroup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountGroupInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountGroupInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountGroupInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${accountGroupInstance?.branch?.id}">${accountGroupInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.recruitedBy.label" default="Recruited By" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${accountGroupInstance?.recruitedBy?.id}">${accountGroupInstance?.recruitedBy?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.externalId.label" default="External Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountGroupInstance, field: "externalId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${accountGroupInstance?.address?.id}">${accountGroupInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountGroupInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.loanAccounts.label" default="Loan Accounts" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${accountGroupInstance.loanAccounts}" var="l">
						<li><g:link controller="loanAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="accountGroup.savingsAccounts.label" default="Savings Accounts" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${accountGroupInstance.savingsAccounts}" var="s">
						<li><g:link controller="savingsAccount" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${accountGroupInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
