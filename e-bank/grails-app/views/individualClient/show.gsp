
<%@page import="zw.co.quantum.legend.model.FinancialAccount"%>
<%@ page import="zw.co.quantum.legend.model.IndividualClient" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'individualClient.label', default: 'IndividualClient')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.salutation.label" default="Salutation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "salutation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.lastName.label" default="Last Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "lastName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.firstName.label" default="First Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "firstName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.dateOfBirth.label" default="Date Of Birth" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${individualClientInstance?.dateOfBirth}" format="dd/MM/yyyy" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.maritalStatus.label" default="Marital Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "maritalStatus")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.gender.label" default="Gender" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "gender")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.nationalId.label" default="National Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "nationalId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.citizenship.label" default="Citizenship" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "citizenship")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.mobile.label" default="Mobile" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "mobile")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${individualClientInstance?.address?.id}">${individualClientInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>	
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.companyName.label" default="Company Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "companyName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.companyAddress.label" default="Company Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${individualClientInstance?.companyAddress?.id}">${individualClientInstance?.companyAddress?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.nextOfKinName.label" default="Next Of Kin Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "nextOfKinName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.nextOfKinAddress.label" default="Next Of Kin Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${individualClientInstance?.nextOfKinAddress?.id}">${individualClientInstance?.nextOfKinAddress?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.registeredBy.label" default="Registered By" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${individualClientInstance?.registeredBy?.id}">${individualClientInstance?.registeredBy?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${individualClientInstance?.branch?.id}">${individualClientInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.photoPath.label" default="Photo Path" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: individualClientInstance, field: "photoPath")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${individualClientInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${individualClientInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="individualClient.groups.label" default="Groups" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${individualClientInstance.groups}" var="g">
						<li><g:link controller="clientGroup" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="name">Client Accounts</td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
						<g:each in="${FinancialAccount.findAllByOwnerIdAndOwnerType(individualClientInstance.clientNo, individualClientInstance.type)}" var="l">
							<li><g:link controller="financialAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li><g:link action="addAccount" id="${individualClientInstance.clientNo}">Add Account</g:link></li>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${individualClientInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>