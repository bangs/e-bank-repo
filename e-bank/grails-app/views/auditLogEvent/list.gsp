
<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'auditLogEvent.label', default: 'AuditLogEvent')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'auditLogEvent.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="actor" title="${message(code: 'auditLogEvent.actor.label', default: 'Actor')}" />
			
				<g:sortableColumn property="propertyName" title="${message(code: 'auditLogEvent.propertyName.label', default: 'Property Name')}" />
			
				<g:sortableColumn property="eventName" title="${message(code: 'auditLogEvent.eventName.label', default: 'Event Name')}" />
			
				<g:sortableColumn property="oldValue" title="${message(code: 'auditLogEvent.oldValue.label', default: 'Old Value')}" />
			
				<g:sortableColumn property="newValue" title="${message(code: 'auditLogEvent.newValue.label', default: 'New Value')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${auditLogEventInstanceList}" status="i" var="auditLogEventInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${auditLogEventInstance.id}">${fieldValue(bean: auditLogEventInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: auditLogEventInstance, field: "actor")}</td>
			
				<td>${fieldValue(bean: auditLogEventInstance, field: "propertyName")}</td>
			
				<td>${fieldValue(bean: auditLogEventInstance, field: "eventName")}</td>
			
				<td>${fieldValue(bean: auditLogEventInstance, field: "oldValue")}</td>
			
				<td>${fieldValue(bean: auditLogEventInstance, field: "newValue")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${auditLogEventInstanceTotal}" />
	</div>
</section>

</body>

</html>
