<%@ page import="zw.co.quantum.legend.model.Fund" %>



<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="fund.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${fundInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fund.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="80" value="${fundInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="fund.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="30" value="${fundInstance?.code}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="fund.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${fundInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="fund.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${fundInstance.constraints.status.inList}" value="${fundInstance?.status}" valueMessagePrefix="fund.status"  />
</div>

