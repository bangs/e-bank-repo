<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>



<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'actor', 'error')} ">
	<label for="actor">
		<g:message code="auditLogEvent.actor.label" default="Actor" />
		
	</label>
	<g:textField name="actor" value="${auditLogEventInstance?.actor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'uri', 'error')} ">
	<label for="uri">
		<g:message code="auditLogEvent.uri.label" default="Uri" />
		
	</label>
	<g:textField name="uri" value="${auditLogEventInstance?.uri}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'className', 'error')} ">
	<label for="className">
		<g:message code="auditLogEvent.className.label" default="Class Name" />
		
	</label>
	<g:textField name="className" value="${auditLogEventInstance?.className}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectId', 'error')} ">
	<label for="persistedObjectId">
		<g:message code="auditLogEvent.persistedObjectId.label" default="Persisted Object Id" />
		
	</label>
	<g:textField name="persistedObjectId" value="${auditLogEventInstance?.persistedObjectId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectVersion', 'error')} ">
	<label for="persistedObjectVersion">
		<g:message code="auditLogEvent.persistedObjectVersion.label" default="Persisted Object Version" />
		
	</label>
	<g:textField name="persistedObjectVersion" value="${fieldValue(bean: auditLogEventInstance, field: 'persistedObjectVersion')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'eventName', 'error')} ">
	<label for="eventName">
		<g:message code="auditLogEvent.eventName.label" default="Event Name" />
		
	</label>
	<g:textField name="eventName" value="${auditLogEventInstance?.eventName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'propertyName', 'error')} ">
	<label for="propertyName">
		<g:message code="auditLogEvent.propertyName.label" default="Property Name" />
		
	</label>
	<g:textField name="propertyName" value="${auditLogEventInstance?.propertyName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'oldValue', 'error')} ">
	<label for="oldValue">
		<g:message code="auditLogEvent.oldValue.label" default="Old Value" />
		
	</label>
	<g:textField name="oldValue" value="${auditLogEventInstance?.oldValue}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auditLogEventInstance, field: 'newValue', 'error')} ">
	<label for="newValue">
		<g:message code="auditLogEvent.newValue.label" default="New Value" />
		
	</label>
	<g:textField name="newValue" value="${auditLogEventInstance?.newValue}" />
</div>

