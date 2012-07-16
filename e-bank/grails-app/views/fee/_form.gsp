<%@ page import="zw.co.quantum.legend.model.Fee" %>



<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="fee.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${feeInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fee.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="60" value="${feeInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="fee.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="150" value="${feeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'transactionType', 'error')} ">
	<label for="transactionType">
		<g:message code="fee.transactionType.label" default="Transaction Type" />
		
	</label>
	<g:select name="transactionType" from="${feeInstance.constraints.transactionType.inList}" value="${feeInstance?.transactionType}" valueMessagePrefix="fee.transactionType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="fee.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${feeInstance.constraints.type.inList}" value="${feeInstance?.type}" valueMessagePrefix="fee.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'frequency', 'error')} ">
	<label for="frequency">
		<g:message code="fee.frequency.label" default="Frequency" />
		
	</label>
	<g:select name="frequency" from="${feeInstance.constraints.frequency.inList}" value="${feeInstance?.frequency}" valueMessagePrefix="fee.frequency"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'appliesTo', 'error')} ">
	<label for="appliesTo">
		<g:message code="fee.appliesTo.label" default="Applies To" />
		
	</label>
	<g:select name="appliesTo" from="${feeInstance.constraints.appliesTo.inList}" value="${feeInstance?.appliesTo}" valueMessagePrefix="fee.appliesTo"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="fee.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: feeInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'gLCode', 'error')} required">
	<label for="gLCode">
		<g:message code="fee.gLCode.label" default="GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${feeInstance?.gLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="fee.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${feeInstance.constraints.status.inList}" value="${feeInstance?.status}" valueMessagePrefix="fee.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'appliedFees', 'error')} ">
	<label for="appliedFees">
		<g:message code="fee.appliedFees.label" default="Applied Fees" />
		
	</label>
	
<ul>
<g:each in="${feeInstance?.appliedFees?}" var="a">
    <li><g:link controller="appliedFee" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="appliedFee" action="create" params="['fee.id': feeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'appliedFee.label', default: 'AppliedFee')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: feeInstance, field: 'defaultFees', 'error')} ">
	<label for="defaultFees">
		<g:message code="fee.defaultFees.label" default="Default Fees" />
		
	</label>
	<g:checkBox name="defaultFees" value="${feeInstance?.defaultFees}" />
</div>

