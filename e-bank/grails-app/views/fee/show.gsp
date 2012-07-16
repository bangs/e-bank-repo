
<%@ page import="zw.co.quantum.legend.model.Fee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fee.label', default: 'Fee')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.transactionType.label" default="Transaction Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "transactionType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.frequency.label" default="Frequency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "frequency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.appliesTo.label" default="Applies To" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "appliesTo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.gLCode.label" default="GL Code" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${feeInstance?.gLCode?.id}">${feeInstance?.gLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.defaultFees.label" default="Default Fees" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${feeInstance?.defaultFees}" /></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feeInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${feeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${feeInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fee.appliedFees.label" default="Applied Fees" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${feeInstance.appliedFees}" var="a">
						<li><g:link controller="appliedFee" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${feeInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
