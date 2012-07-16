<%@ page import="zw.co.quantum.legend.model.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="150" value="${institutionInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="institution.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="250" value="${institutionInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="institution.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${institutionInstance?.address?.id}"  />
</div>

