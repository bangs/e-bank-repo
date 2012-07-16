
<%@ page import="zw.co.quantum.legend.model.AppliedPenalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedPenalty.label', default: 'AppliedPenalty')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedPenaltyInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.entityId.label" default="Entity Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedPenaltyInstance, field: "entityId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.entityType.label" default="Entity Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedPenaltyInstance, field: "entityType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.penalty.label" default="Penalty" /></td>
				
				<td valign="top" class="value"><g:link controller="penalty" action="show" id="${appliedPenaltyInstance?.penalty?.id}">${appliedPenaltyInstance?.penalty?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${appliedPenaltyInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${appliedPenaltyInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="appliedPenalty.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: appliedPenaltyInstance, field: "status")}</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${appliedPenaltyInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
