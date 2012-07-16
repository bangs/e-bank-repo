<%@ page import="zw.co.quantum.legend.model.AppliedFee" %>



<div class="fieldcontain ${hasErrors(bean: appliedFeeInstance, field: 'entityId', 'error')} required">
	<label for="entityId">
		<g:message code="appliedFee.entityId.label" default="Entity Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="entityId" value="${fieldValue(bean: appliedFeeInstance, field: 'entityId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedFeeInstance, field: 'entityType', 'error')} ">
	<label for="entityType">
		<g:message code="appliedFee.entityType.label" default="Entity Type" />
		
	</label>
	<g:textField name="entityType" maxlength="40" value="${appliedFeeInstance?.entityType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedFeeInstance, field: 'fee', 'error')} required">
	<label for="fee">
		<g:message code="appliedFee.fee.label" default="Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fee.id" from="${zw.co.quantum.legend.model.Fee.list()}" optionKey="id" value="${appliedFeeInstance?.fee?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: appliedFeeInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="appliedFee.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${appliedFeeInstance?.status}" />
</div>

