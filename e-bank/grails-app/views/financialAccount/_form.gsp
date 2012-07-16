<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>



<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="financialAccount.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${financialAccountInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="financialAccount.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" maxlength="30" value="${financialAccountInstance?.accountNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'ownerId', 'error')} ">
	<label for="ownerId">
		<g:message code="financialAccount.ownerId.label" default="Owner Id" />
		
	</label>
	<g:textField name="ownerId" maxlength="30" value="${financialAccountInstance?.ownerId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'ownerClass', 'error')} ">
	<label for="ownerClass">
		<g:message code="financialAccount.ownerClass.label" default="Owner Class" />
		
	</label>
	<g:textField name="ownerClass" maxlength="60" value="${financialAccountInstance?.ownerClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'ownerType', 'error')} ">
	<label for="ownerType">
		<g:message code="financialAccount.ownerType.label" default="Owner Type" />
		
	</label>
	<g:textField name="ownerType" maxlength="30" value="${financialAccountInstance?.ownerType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: financialAccountInstance, field: 'superType', 'error')} required">
	<label for="superType">
		<g:message code="financialAccount.superType.label" default="Super Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="superType" from="${financialAccountInstance.constraints.superType.inList}" value="${financialAccountInstance?.superType}" valueMessagePrefix="financialAccount.superType"  />
</div>

