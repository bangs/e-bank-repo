<%@ page import="zw.co.quantum.legend.model.Holiday" %>



<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="holiday.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${holidayInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="holiday.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="40" value="${holidayInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="holiday.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day" value="${holidayInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="holiday.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day" value="${holidayInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'repaymentRule', 'error')} ">
	<label for="repaymentRule">
		<g:message code="holiday.repaymentRule.label" default="Repayment Rule" />
		
	</label>
	<g:select name="repaymentRule" from="${holidayInstance.constraints.repaymentRule.inList}" value="${holidayInstance?.repaymentRule}" valueMessagePrefix="holiday.repaymentRule"  />
</div>

