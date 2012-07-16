

<%@ page import="zw.co.quantum.legend.model.Bulletin" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bulletin.label', default: 'Bulletin')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${bulletinInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${bulletinInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'message', 'error')}">
								<label for="message" class="control-label"><g:message code="bulletin.message.label" default="Message" /></label>
				            	<div class="controls">
									<g:textArea name="message" maxlength="250" value="${bulletinInstance?.message}" />
									<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'message', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'startDate', 'error')}">
								<label for="startDate" class="control-label"><g:message code="bulletin.startDate.label" default="Start Date" /></label>
				            	<div class="controls">
									<g:datePicker name="startDate" precision="day" value="${bulletinInstance?.startDate}"  />
									<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'startDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: bulletinInstance, field: 'endDate', 'error')}">
								<label for="endDate" class="control-label"><g:message code="bulletin.endDate.label" default="End Date" /></label>
				            	<div class="controls">
									<g:datePicker name="endDate" precision="day" value="${bulletinInstance?.endDate}"  />
									<span class="help-inline">${hasErrors(bean: bulletinInstance, field: 'endDate', 'error')}</span>
								</div>
							</div>
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
