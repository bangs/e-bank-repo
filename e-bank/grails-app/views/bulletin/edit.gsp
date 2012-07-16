

<%@ page import="zw.co.quantum.legend.model.Bulletin" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bulletin.label', default: 'Bulletin')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${bulletinInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${bulletinInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${bulletinInstance?.id}" />
		<g:hiddenField name="version" value="${bulletinInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'message', 'error')}">
							<label for="message"><g:message code="bulletin.message.label" default="Message" /></label>
							<div class="controls">
								<g:textField name="message" maxlength="250" value="${bulletinInstance?.message}" />
								<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'message', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'startDate', 'error')}">
							<label for="startDate"><g:message code="bulletin.startDate.label" default="Start Date" /></label>
							<div class="controls">
								<g:datePicker name="startDate" precision="day" value="${bulletinInstance?.startDate}"  />
								<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'startDate', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'endDate', 'error')}">
							<label for="endDate"><g:message code="bulletin.endDate.label" default="End Date" /></label>
							<div class="controls">
								<g:datePicker name="endDate" precision="day" value="${bulletinInstance?.endDate}"  />
								<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'endDate', 'error')}</span>
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
