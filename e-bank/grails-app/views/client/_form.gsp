<%@ page import="zw.co.quantum.legend.model.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="client.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${clientInstance.constraints.type.inList}" value="${clientInstance?.type}" valueMessagePrefix="client.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="client.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" maxlength="20" value="${clientInstance?.mobile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		
	</label>
	<g:textField name="email" maxlength="120" value="${clientInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="client.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${clientInstance?.address?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'registeredBy', 'error')} required">
	<label for="registeredBy">
		<g:message code="client.registeredBy.label" default="Registered By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${clientInstance?.registeredBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="client.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${clientInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="client.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${clientInstance.constraints.status.inList}" value="${clientInstance?.status}" valueMessagePrefix="client.status"  />
</div>

