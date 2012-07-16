<%@ page import="zw.co.quantum.legend.model.RepaymentSchedule" %>



<div class="fieldcontain ${hasErrors(bean: repaymentScheduleInstance, field: 'installmentNo', 'error')} required">
	<label for="installmentNo">
		<g:message code="repaymentSchedule.installmentNo.label" default="Installment No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="installmentNo" value="${fieldValue(bean: repaymentScheduleInstance, field: 'installmentNo')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: repaymentScheduleInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="repaymentSchedule.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day" value="${repaymentScheduleInstance?.dueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: repaymentScheduleInstance, field: 'principal', 'error')} required">
	<label for="principal">
		<g:message code="repaymentSchedule.principal.label" default="Principal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="principal" value="${fieldValue(bean: repaymentScheduleInstance, field: 'principal')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: repaymentScheduleInstance, field: 'interest', 'error')} required">
	<label for="interest">
		<g:message code="repaymentSchedule.interest.label" default="Interest" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="interest" value="${fieldValue(bean: repaymentScheduleInstance, field: 'interest')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: repaymentScheduleInstance, field: 'loanAccount', 'error')} required">
	<label for="loanAccount">
		<g:message code="repaymentSchedule.loanAccount.label" default="Loan Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="loanAccount.id" from="${zw.co.quantum.legend.model.LoanAccount.list()}" optionKey="id" value="${repaymentScheduleInstance?.loanAccount?.id}"  />
</div>

