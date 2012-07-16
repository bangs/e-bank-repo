<%@ page import="zw.co.quantum.legend.auth.Requestmap" %>



<div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="requestmap.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" value="${requestmapInstance?.url}" />
</div>

<div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')} required">
	<label for="configAttribute">
		<g:message code="requestmap.configAttribute.label" default="Config Attribute" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="configAttribute" value="${requestmapInstance?.configAttribute}" />
</div>

