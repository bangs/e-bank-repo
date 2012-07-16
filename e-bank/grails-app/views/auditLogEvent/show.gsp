
<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'auditLogEvent.label', default: 'AuditLogEvent')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.id.label" default="Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "id")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.actor.label" default="Actor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "actor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.uri.label" default="Uri" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "uri")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.className.label" default="Class Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "className")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.persistedObjectId.label" default="Persisted Object Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "persistedObjectId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.persistedObjectVersion.label" default="Persisted Object Version" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "persistedObjectVersion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.eventName.label" default="Event Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "eventName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.propertyName.label" default="Property Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "propertyName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.oldValue.label" default="Old Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "oldValue")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.newValue.label" default="New Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: auditLogEventInstance, field: "newValue")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${auditLogEventInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="auditLogEvent.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${auditLogEventInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${auditLogEventInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
