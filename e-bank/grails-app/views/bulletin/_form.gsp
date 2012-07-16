<%@ page import="zw.co.quantum.legend.model.Bulletin" %>



<div class="fieldcontain ${hasErrors(bean: bulletinInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="bulletin.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" maxlength="250" value="${bulletinInstance?.message}" />
</div>

<div class="fieldcontain ${hasErrors(bean: bulletinInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="bulletin.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day" value="${bulletinInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bulletinInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="bulletin.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day" value="${bulletinInstance?.endDate}"  />
</div>

