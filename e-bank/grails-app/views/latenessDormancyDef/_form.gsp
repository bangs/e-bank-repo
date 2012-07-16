<%@ page import="zw.co.quantum.legend.model.LatenessDormancyDef" %>



<div class="fieldcontain ${hasErrors(bean: latenessDormancyDefInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="latenessDormancyDef.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${latenessDormancyDefInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod', 'error')} required">
	<label for="lateLoanRepaymentGracePeriod">
		<g:message code="latenessDormancyDef.lateLoanRepaymentGracePeriod.label" default="Late Loan Repayment Grace Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lateLoanRepaymentGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod', 'error')} required">
	<label for="dormantSavingsAccGracePeriod">
		<g:message code="latenessDormancyDef.dormantSavingsAccGracePeriod.label" default="Dormant Savings Acc Grace Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dormantSavingsAccGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: latenessDormancyDefInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="latenessDormancyDef.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${latenessDormancyDefInstance.constraints.status.inList}" value="${latenessDormancyDefInstance?.status}" valueMessagePrefix="latenessDormancyDef.status"  />
</div>

