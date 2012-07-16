<%@ page import="zw.co.quantum.legend.model.Posting" %>



<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'transaction', 'error')} required">
	<label for="transaction">
		<g:message code="posting.transaction.label" default="Transaction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="transaction.id" from="${zw.co.quantum.legend.model.Transaction.list()}" optionKey="id" value="${postingInstance?.transaction?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'accountNumber', 'error')} ">
	<label for="accountNumber">
		<g:message code="posting.accountNumber.label" default="Account Number" />
		
	</label>
	<g:textField name="accountNumber" maxlength="30" value="${postingInstance?.accountNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'narrative', 'error')} ">
	<label for="narrative">
		<g:message code="posting.narrative.label" default="Narrative" />
		
	</label>
	<g:textField name="narrative" maxlength="100" value="${postingInstance?.narrative}" />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="posting.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${postingInstance.constraints.type.inList}" value="${postingInstance?.type}" valueMessagePrefix="posting.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="posting.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: postingInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="posting.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="balance" value="${fieldValue(bean: postingInstance, field: 'balance')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: postingInstance, field: 'valueDate', 'error')} required">
	<label for="valueDate">
		<g:message code="posting.valueDate.label" default="Value Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="valueDate" precision="day" value="${postingInstance?.valueDate}"  />
</div>

