<%@ page import="zw.co.quantum.legend.model.SystemAccount" %>



<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="systemAccount.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${systemAccountInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="systemAccount.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" maxlength="30" value="${systemAccountInstance?.accountNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'ownerId', 'error')} ">
	<label for="ownerId">
		<g:message code="systemAccount.ownerId.label" default="Owner Id" />
		
	</label>
	<g:textField name="ownerId" maxlength="30" value="${systemAccountInstance?.ownerId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'ownerClass', 'error')} ">
	<label for="ownerClass">
		<g:message code="systemAccount.ownerClass.label" default="Owner Class" />
		
	</label>
	<g:textField name="ownerClass" maxlength="60" value="${systemAccountInstance?.ownerClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'ownerType', 'error')} ">
	<label for="ownerType">
		<g:message code="systemAccount.ownerType.label" default="Owner Type" />
		
	</label>
	<g:textField name="ownerType" maxlength="30" value="${systemAccountInstance?.ownerType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'superType', 'error')} required">
	<label for="superType">
		<g:message code="systemAccount.superType.label" default="Super Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="superType" from="${systemAccountInstance.constraints.superType.inList}" value="${systemAccountInstance?.superType}" valueMessagePrefix="systemAccount.superType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="systemAccount.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${systemAccountInstance.constraints.type.inList}" value="${systemAccountInstance?.type}" valueMessagePrefix="systemAccount.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: systemAccountInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="systemAccount.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${systemAccountInstance?.description}" />
</div>

