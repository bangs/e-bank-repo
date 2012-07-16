

<%@ page import="zw.co.quantum.legend.auth.Requestmap" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${requestmapInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${requestmapInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: requestmapInstance, field: 'url', 'error')}">
								<label for="url" class="control-label"><g:message code="requestmap.url.label" default="Url" /></label>
				            	<div class="controls">
									<g:textField name="url" value="${requestmapInstance?.url}" />
									<span class="help-inline">${hasErrors(bean: requestmapInstance, field: 'url', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')}">
								<label for="configAttribute" class="control-label"><g:message code="requestmap.configAttribute.label" default="Config Attribute" /></label>
				            	<div class="controls">
									<g:textField name="configAttribute" value="${requestmapInstance?.configAttribute}" />
									<span class="help-inline">${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')}</span>
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
