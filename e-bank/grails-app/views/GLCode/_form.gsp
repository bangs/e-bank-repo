<%@ page import="zw.co.quantum.legend.model.GLCode" %>



<div class="fieldcontain ${hasErrors(bean: GLCodeInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="GLCode.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${GLCodeInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: GLCodeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="GLCode.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="20" value="${GLCodeInstance?.code}" />
</div>

<div class="fieldcontain ${hasErrors(bean: GLCodeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="GLCode.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${GLCodeInstance.constraints.type.inList}" value="${GLCodeInstance?.type}" valueMessagePrefix="GLCode.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: GLCodeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="GLCode.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${GLCodeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: GLCodeInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="GLCode.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${GLCodeInstance.constraints.status.inList}" value="${GLCodeInstance?.status}" valueMessagePrefix="GLCode.status"  />
</div>

