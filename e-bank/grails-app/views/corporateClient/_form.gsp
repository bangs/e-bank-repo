<%@ page import="zw.co.quantum.legend.model.CorporateClient" %>



<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="corporateClient.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${corporateClientInstance.constraints.type.inList}" value="${corporateClientInstance?.type}" valueMessagePrefix="corporateClient.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="corporateClient.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" maxlength="20" value="${corporateClientInstance?.mobile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="corporateClient.email.label" default="Email" />
		
	</label>
	<g:textField name="email" maxlength="120" value="${corporateClientInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="corporateClient.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${corporateClientInstance?.address?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'registeredBy', 'error')} required">
	<label for="registeredBy">
		<g:message code="corporateClient.registeredBy.label" default="Registered By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${corporateClientInstance?.registeredBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="corporateClient.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${corporateClientInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="corporateClient.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${corporateClientInstance.constraints.status.inList}" value="${corporateClientInstance?.status}" valueMessagePrefix="corporateClient.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="corporateClient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${corporateClientInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: corporateClientInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="corporateClient.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" maxlength="30" value="${corporateClientInstance?.externalId}" />
</div>

