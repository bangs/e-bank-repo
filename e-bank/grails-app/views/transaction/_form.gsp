<%@ page import="zw.co.quantum.legend.model.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'valueDate', 'error')} required">
	<label for="valueDate">
		<g:message code="transaction.valueDate.label" default="Value Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="valueDate" precision="day" value="${transactionInstance?.valueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'reference', 'error')} ">
	<label for="reference">
		<g:message code="transaction.reference.label" default="Reference" />
		
	</label>
	<g:textField name="reference" maxlength="30" value="${transactionInstance?.reference}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sourceAccountNo', 'error')} ">
	<label for="sourceAccountNo">
		<g:message code="transaction.sourceAccountNo.label" default="Source Account No" />
		
	</label>
	<g:textField name="sourceAccountNo" maxlength="30" value="${transactionInstance?.sourceAccountNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sourceAccountType', 'error')} ">
	<label for="sourceAccountType">
		<g:message code="transaction.sourceAccountType.label" default="Source Account Type" />
		
	</label>
	<g:textField name="sourceAccountType" maxlength="50" value="${transactionInstance?.sourceAccountType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sourceAccountClass', 'error')} ">
	<label for="sourceAccountClass">
		<g:message code="transaction.sourceAccountClass.label" default="Source Account Class" />
		
	</label>
	<g:textField name="sourceAccountClass" maxlength="60" value="${transactionInstance?.sourceAccountClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'destinationAccountNo', 'error')} ">
	<label for="destinationAccountNo">
		<g:message code="transaction.destinationAccountNo.label" default="Destination Account No" />
		
	</label>
	<g:textField name="destinationAccountNo" maxlength="30" value="${transactionInstance?.destinationAccountNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'destinationAccountType', 'error')} ">
	<label for="destinationAccountType">
		<g:message code="transaction.destinationAccountType.label" default="Destination Account Type" />
		
	</label>
	<g:textField name="destinationAccountType" maxlength="50" value="${transactionInstance?.destinationAccountType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'destinationAccountClass', 'error')} ">
	<label for="destinationAccountClass">
		<g:message code="transaction.destinationAccountClass.label" default="Destination Account Class" />
		
	</label>
	<g:textField name="destinationAccountClass" maxlength="60" value="${transactionInstance?.destinationAccountClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'paymentRef', 'error')} ">
	<label for="paymentRef">
		<g:message code="transaction.paymentRef.label" default="Payment Ref" />
		
	</label>
	<g:textField name="paymentRef" maxlength="30" value="${transactionInstance?.paymentRef}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="transaction.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${transactionInstance.constraints.type.inList}" value="${transactionInstance?.type}" valueMessagePrefix="transaction.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'narrative', 'error')} ">
	<label for="narrative">
		<g:message code="transaction.narrative.label" default="Narrative" />
		
	</label>
	<g:textField name="narrative" maxlength="120" value="${transactionInstance?.narrative}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'gLCode', 'error')} ">
	<label for="gLCode">
		<g:message code="transaction.gLCode.label" default="GLC ode" />
		
	</label>
	<g:textField name="gLCode" value="${transactionInstance?.gLCode}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'initiator', 'error')} ">
	<label for="initiator">
		<g:message code="transaction.initiator.label" default="Initiator" />
		
	</label>
	<g:select name="initiator.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${transactionInstance?.initiator?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'approver', 'error')} ">
	<label for="approver">
		<g:message code="transaction.approver.label" default="Approver" />
		
	</label>
	<g:select name="approver.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${transactionInstance?.approver?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="transaction.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: transactionInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="transaction.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${transactionInstance.constraints.status.inList}" value="${transactionInstance?.status}" valueMessagePrefix="transaction.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'postings', 'error')} ">
	<label for="postings">
		<g:message code="transaction.postings.label" default="Postings" />
		
	</label>
	
<ul>
<g:each in="${transactionInstance?.postings?}" var="p">
    <li><g:link controller="posting" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="posting" action="create" params="['transaction.id': transactionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'posting.label', default: 'Posting')])}</g:link>

</div>

