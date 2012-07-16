<%@ page import="zw.co.quantum.legend.model.PaymentType" %>



<div class="fieldcontain ${hasErrors(bean: paymentTypeInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="paymentType.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${paymentTypeInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: paymentTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="paymentType.name.label" default="Name" />
		
	</label>
	<g:select name="name" from="${paymentTypeInstance.constraints.name.inList}" value="${paymentTypeInstance?.name}" valueMessagePrefix="paymentType.name"  />
</div>

<div class="fieldcontain ${hasErrors(bean: paymentTypeInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="paymentType.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${paymentTypeInstance.constraints.status.inList}" value="${paymentTypeInstance?.status}" valueMessagePrefix="paymentType.status"  />
</div>

