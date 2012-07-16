<%@ page import="zw.co.quantum.legend.model.AppliedPenalty" %>



<div class="fieldcontain ${hasErrors(bean: appliedPenaltyInstance, field: 'entityId', 'error')} required">
	<label for="entityId">
		<g:message code="appliedPenalty.entityId.label" default="Entity Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="entityId" value="${fieldValue(bean: appliedPenaltyInstance, field: 'entityId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedPenaltyInstance, field: 'entityType', 'error')} ">
	<label for="entityType">
		<g:message code="appliedPenalty.entityType.label" default="Entity Type" />
		
	</label>
	<g:textField name="entityType" maxlength="40" value="${appliedPenaltyInstance?.entityType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedPenaltyInstance, field: 'penalty', 'error')} required">
	<label for="penalty">
		<g:message code="appliedPenalty.penalty.label" default="Penalty" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="penalty.id" from="${zw.co.quantum.legend.model.Penalty.list()}" optionKey="id" value="${appliedPenaltyInstance?.penalty?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedPenaltyInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="appliedPenalty.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${appliedPenaltyInstance?.status}" />
</div>

