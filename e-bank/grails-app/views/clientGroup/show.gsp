
<%@ page import="zw.co.quantum.legend.model.ClientGroup" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientGroup.label', default: 'ClientGroup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.accountType.label" default="Account Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "accountType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.externalId.label" default="External Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "externalId")}</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.mobile.label" default="Mobile" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "mobile")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${clientGroupInstance?.address?.id}">${clientGroupInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.registeredBy.label" default="Registered By" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${clientGroupInstance?.registeredBy?.id}">${clientGroupInstance?.registeredBy?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${clientGroupInstance?.branch?.id}">${clientGroupInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientGroupInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${clientGroupInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${clientGroupInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name">Client Accounts</td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
						<g:each in="${FinancialAccount.findAllByOwnerIdAndOwnerType(clientGroupInstance.clientNo, clientGroupInstance.type)}" var="l">
							<li><g:link controller="financialAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li><g:link action="addAccount" id="${clientGroupInstance.clientNo}">Add Account</g:link></li>
					</ul>
				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientGroup.clients.label" default="Clients" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${clientGroupInstance.clients}" var="c">
						<li><g:link controller="individualClient" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${clientGroupInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
