<%@ page import="zw.co.quantum.legend.model.ChecklistItem" %>



<div class="fieldcontain ${hasErrors(bean: checklistItemInstance, field: 'checklist', 'error')} required">
	<label for="checklist">
		<g:message code="checklistItem.checklist.label" default="Checklist" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="checklist.id" from="${zw.co.quantum.legend.model.Checklist.list()}" optionKey="id" value="${checklistItemInstance?.checklist?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: checklistItemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="checklistItem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="200" value="${checklistItemInstance?.description}" />
</div>

