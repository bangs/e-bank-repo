<%@ page import="zw.co.quantum.legend.model.CollateralType" %>



<div class="fieldcontain ${hasErrors(bean: collateralTypeInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="collateralType.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${collateralTypeInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: collateralTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="collateralType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" value="${collateralTypeInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: collateralTypeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="collateralType.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="160" value="${collateralTypeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: collateralTypeInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="collateralType.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${collateralTypeInstance.constraints.status.inList}" value="${collateralTypeInstance?.status}" valueMessagePrefix="collateralType.status"  />
</div>

