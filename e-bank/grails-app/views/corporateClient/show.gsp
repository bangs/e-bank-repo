
<%@page import="zw.co.quantum.legend.model.FinancialAccount"%>
<%@ page import="zw.co.quantum.legend.model.CorporateClient" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'corporateClient.label', default: 'CorporateClient')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
	
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: corporateClientInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.externalId.label" default="External Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: corporateClientInstance, field: "externalId")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.mobile.label" default="Mobile" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: corporateClientInstance, field: "mobile")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: corporateClientInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${corporateClientInstance?.address?.id}">${corporateClientInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.registeredBy.label" default="Registered By" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${corporateClientInstance?.registeredBy?.id}">${corporateClientInstance?.registeredBy?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${corporateClientInstance?.branch?.id}">${corporateClientInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: corporateClientInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${corporateClientInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="corporateClient.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${corporateClientInstance?.lastUpdated}" /></td>
				
			</tr>
	
			<tr class="prop">
				<td valign="top" class="name">Client Accounts</td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
						<g:each in="${FinancialAccount.findAllByOwnerIdAndOwnerType(corporateClientInstance.clientNo, corporateClientInstance.type)}" var="l">
							<li><g:link controller="financialAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li><g:link action="addAccount" id="${corporateClientInstance.clientNo}">Add Account</g:link></li>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${corporateClientInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
