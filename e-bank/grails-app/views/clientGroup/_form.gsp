<%@ page import="zw.co.quantum.legend.model.ClientGroup" %>



<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="clientGroup.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${clientGroupInstance.constraints.type.inList}" value="${clientGroupInstance?.type}" valueMessagePrefix="clientGroup.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="clientGroup.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" maxlength="20" value="${clientGroupInstance?.mobile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="clientGroup.email.label" default="Email" />
		
	</label>
	<g:textField name="email" maxlength="120" value="${clientGroupInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="clientGroup.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${clientGroupInstance?.address?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'registeredBy', 'error')} required">
	<label for="registeredBy">
		<g:message code="clientGroup.registeredBy.label" default="Registered By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${clientGroupInstance?.registeredBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="clientGroup.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${clientGroupInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="clientGroup.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${clientGroupInstance.constraints.status.inList}" value="${clientGroupInstance?.status}" valueMessagePrefix="clientGroup.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="clientGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${clientGroupInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="clientGroup.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${clientGroupInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'accountType', 'error')} ">
	<label for="accountType">
		<g:message code="clientGroup.accountType.label" default="Account Type" />
		
	</label>
	<g:select name="accountType" from="${clientGroupInstance.constraints.accountType.inList}" value="${clientGroupInstance?.accountType}" valueMessagePrefix="clientGroup.accountType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="clientGroup.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" maxlength="30" value="${clientGroupInstance?.externalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: clientGroupInstance, field: 'clients', 'error')} ">
	<label for="clients">
		<g:message code="clientGroup.clients.label" default="Clients" />
		
	</label>
	<g:select name="clients" from="${zw.co.quantum.legend.model.IndividualClient.list()}" multiple="yes" optionKey="id" size="5" value="${clientGroupInstance?.clients*.id}" />
</div>

