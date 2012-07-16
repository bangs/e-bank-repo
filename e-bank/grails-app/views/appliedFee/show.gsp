
<%@ page import="zw.co.quantum.legend.model.AppliedFee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedFee.label', default: 'AppliedFee')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedFeeInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.entityId.label" default="Entity Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedFeeInstance, field: "entityId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.entityType.label" default="Entity Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedFeeInstance, field: "entityType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.fee.label" default="Fee" /></td>
				
				<td valign="top" class="value"><g:link controller="fee" action="show" id="${appliedFeeInstance?.fee?.id}">${appliedFeeInstance?.fee?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${appliedFeeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${appliedFeeInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedFee.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedFeeInstance, field: "status")}</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${appliedFeeInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
