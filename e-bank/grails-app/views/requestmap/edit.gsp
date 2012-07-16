

<%@ page import="zw.co.quantum.legend.auth.Requestmap" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${requestmapInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${requestmapInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${requestmapInstance?.id}" />
		<g:hiddenField name="version" value="${requestmapInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: requestmapInstance, field: 'url', 'error')}">
							<label for="url"><g:message code="requestmap.url.label" default="Url" /></label>
							<div class="controls">
								<g:textField name="url" value="${requestmapInstance?.url}" />
								<span class="help-inline">${hasErrors(bean: requestmapInstance, field: 'url', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')}">
							<label for="configAttribute"><g:message code="requestmap.configAttribute.label" default="Config Attribute" /></label>
							<div class="controls">
								<g:textField name="configAttribute" value="${requestmapInstance?.configAttribute}" />
								<span class="help-inline">${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')}</span>
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
