
<%@ page import="zw.co.quantum.legend.model.Checklist" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'checklist.label', default: 'Checklist')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: checklistInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: checklistInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: checklistInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${checklistInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${checklistInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="checklist.items.label" default="Items" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${checklistInstance.items}" var="i">
						<li><g:link controller="checklistItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
					</g:each>
					<g:link controller="checklistItem" action="create" params="['checklist.id': checklistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'checklistItem.label', default: 'ChecklistItem')])}</g:link>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${checklistInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
