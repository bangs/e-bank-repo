

<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'auditLogEvent.label', default: 'AuditLogEvent')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${auditLogEventInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${auditLogEventInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${auditLogEventInstance?.id}" />
		<g:hiddenField name="version" value="${auditLogEventInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'actor', 'error')}">
							<label for="actor"><g:message code="auditLogEvent.actor.label" default="Actor" /></label>
							<div class="controls">
								<g:textField name="actor" value="${auditLogEventInstance?.actor}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'actor', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'uri', 'error')}">
							<label for="uri"><g:message code="auditLogEvent.uri.label" default="Uri" /></label>
							<div class="controls">
								<g:textField name="uri" value="${auditLogEventInstance?.uri}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'uri', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'className', 'error')}">
							<label for="className"><g:message code="auditLogEvent.className.label" default="Class Name" /></label>
							<div class="controls">
								<g:textField name="className" value="${auditLogEventInstance?.className}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'className', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectId', 'error')}">
							<label for="persistedObjectId"><g:message code="auditLogEvent.persistedObjectId.label" default="Persisted Object Id" /></label>
							<div class="controls">
								<g:textField name="persistedObjectId" value="${auditLogEventInstance?.persistedObjectId}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectId', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectVersion', 'error')}">
							<label for="persistedObjectVersion"><g:message code="auditLogEvent.persistedObjectVersion.label" default="Persisted Object Version" /></label>
							<div class="controls">
								<g:textField name="persistedObjectVersion" value="${fieldValue(bean: auditLogEventInstance, field: 'persistedObjectVersion')}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'persistedObjectVersion', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'eventName', 'error')}">
							<label for="eventName"><g:message code="auditLogEvent.eventName.label" default="Event Name" /></label>
							<div class="controls">
								<g:textField name="eventName" value="${auditLogEventInstance?.eventName}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'eventName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'propertyName', 'error')}">
							<label for="propertyName"><g:message code="auditLogEvent.propertyName.label" default="Property Name" /></label>
							<div class="controls">
								<g:textField name="propertyName" value="${auditLogEventInstance?.propertyName}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'propertyName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'oldValue', 'error')}">
							<label for="oldValue"><g:message code="auditLogEvent.oldValue.label" default="Old Value" /></label>
							<div class="controls">
								<g:textField name="oldValue" value="${auditLogEventInstance?.oldValue}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'oldValue', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: auditLogEventInstance, field: 'newValue', 'error')}">
							<label for="newValue"><g:message code="auditLogEvent.newValue.label" default="New Value" /></label>
							<div class="controls">
								<g:textField name="newValue" value="${auditLogEventInstance?.newValue}" />
								<span class="help-inline">${hasErrors(bean: auditLogEventInstance, field: 'newValue', 'error')}</span>
							</div>
						</div>
				
		<div class="form-actions">
			<g:actionSubmit class="save btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
