<%@ page import="zw.co.quantum.legend.model.Penalty" %>



<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="penalty.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${penaltyInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="penalty.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="80" value="${penaltyInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'appliesTo', 'error')} ">
	<label for="appliesTo">
		<g:message code="penalty.appliesTo.label" default="Applies To" />
		
	</label>
	<g:select name="appliesTo" from="${penaltyInstance.constraints.appliesTo.inList}" value="${penaltyInstance?.appliesTo}" valueMessagePrefix="penalty.appliesTo"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'gracePeriodType', 'error')} ">
	<label for="gracePeriodType">
		<g:message code="penalty.gracePeriodType.label" default="Grace Period Type" />
		
	</label>
	<g:select name="gracePeriodType" from="${penaltyInstance.constraints.gracePeriodType.inList}" value="${penaltyInstance?.gracePeriodType}" valueMessagePrefix="penalty.gracePeriodType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'gracePeriodDuration', 'error')} required">
	<label for="gracePeriodDuration">
		<g:message code="penalty.gracePeriodDuration.label" default="Grace Period Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gracePeriodDuration" value="${fieldValue(bean: penaltyInstance, field: 'gracePeriodDuration')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'minCumulativeLimit', 'error')} required">
	<label for="minCumulativeLimit">
		<g:message code="penalty.minCumulativeLimit.label" default="Min Cumulative Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'minCumulativeLimit')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'maxCumulativeLimit', 'error')} required">
	<label for="maxCumulativeLimit">
		<g:message code="penalty.maxCumulativeLimit.label" default="Max Cumulative Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'maxCumulativeLimit')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="penalty.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" value="${fieldValue(bean: penaltyInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'frequency', 'error')} ">
	<label for="frequency">
		<g:message code="penalty.frequency.label" default="Frequency" />
		
	</label>
	<g:select name="frequency" from="${penaltyInstance.constraints.frequency.inList}" value="${penaltyInstance?.frequency}" valueMessagePrefix="penalty.frequency"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'gLCode', 'error')} required">
	<label for="gLCode">
		<g:message code="penalty.gLCode.label" default="GLC ode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${penaltyInstance?.gLCode?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="penalty.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${penaltyInstance.constraints.status.inList}" value="${penaltyInstance?.status}" valueMessagePrefix="penalty.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: penaltyInstance, field: 'appliedPenalties', 'error')} ">
	<label for="appliedPenalties">
		<g:message code="penalty.appliedPenalties.label" default="Applied Penalties" />
		
	</label>
	
<ul>
<g:each in="${penaltyInstance?.appliedPenalties?}" var="a">
    <li><g:link controller="appliedPenalty" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="appliedPenalty" action="create" params="['penalty.id': penaltyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty')])}</g:link>

</div>

