<%@ page import="zw.co.quantum.legend.model.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="branch.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${branchInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="branch.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${branchInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="branch.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="20" value="${branchInstance?.code}" />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="branch.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${branchInstance.constraints.status.inList}" value="${branchInstance?.status}" valueMessagePrefix="branch.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'clients', 'error')} ">
	<label for="clients">
		<g:message code="branch.clients.label" default="Clients" />
		
	</label>
	
<ul>
<g:each in="${branchInstance?.clients?}" var="c">
    <li><g:link controller="client" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="client" action="create" params="['branch.id': branchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'client.label', default: 'Client')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="branch.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${zw.co.quantum.legend.auth.User.list()}" multiple="yes" optionKey="id" size="5" value="${branchInstance?.users*.id}" />
</div>

