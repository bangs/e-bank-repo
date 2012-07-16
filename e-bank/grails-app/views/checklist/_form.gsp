<%@ page import="zw.co.quantum.legend.model.Checklist" %>



<div class="fieldcontain ${hasErrors(bean: checklistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="checklist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${checklistInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: checklistInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="checklist.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${checklistInstance.constraints.type.inList}" value="${checklistInstance?.type}" valueMessagePrefix="checklist.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: checklistInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="checklist.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${checklistInstance.constraints.status.inList}" value="${checklistInstance?.status}" valueMessagePrefix="checklist.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: checklistInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="checklist.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${checklistInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: checklistInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="checklist.items.label" default="Items" />
		
	</label>
	
<ul>
<g:each in="${checklistInstance?.items?}" var="i">
    <li><g:link controller="checklistItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="checklistItem" action="create" params="['checklist.id': checklistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'checklistItem.label', default: 'ChecklistItem')])}</g:link>

</div>

