<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>



<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="savingsAccount.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${savingsAccountInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="savingsAccount.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" maxlength="30" value="${savingsAccountInstance?.accountNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'ownerId', 'error')} ">
	<label for="ownerId">
		<g:message code="savingsAccount.ownerId.label" default="Owner Id" />
		
	</label>
	<g:textField name="ownerId" maxlength="30" value="${savingsAccountInstance?.ownerId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'ownerClass', 'error')} ">
	<label for="ownerClass">
		<g:message code="savingsAccount.ownerClass.label" default="Owner Class" />
		
	</label>
	<g:textField name="ownerClass" maxlength="60" value="${savingsAccountInstance?.ownerClass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'ownerType', 'error')} ">
	<label for="ownerType">
		<g:message code="savingsAccount.ownerType.label" default="Owner Type" />
		
	</label>
	<g:textField name="ownerType" maxlength="30" value="${savingsAccountInstance?.ownerType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'superType', 'error')} required">
	<label for="superType">
		<g:message code="savingsAccount.superType.label" default="Super Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="superType" from="${savingsAccountInstance.constraints.superType.inList}" value="${savingsAccountInstance?.superType}" valueMessagePrefix="savingsAccount.superType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="savingsAccount.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="product.id" from="${zw.co.quantum.legend.model.SavingsProduct.list()}" optionKey="id" value="${savingsAccountInstance?.product?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'groupAccountType', 'error')} ">
	<label for="groupAccountType">
		<g:message code="savingsAccount.groupAccountType.label" default="Group Account Type" />
		
	</label>
	<g:select name="groupAccountType" from="${savingsAccountInstance.constraints.groupAccountType.inList}" value="${savingsAccountInstance?.groupAccountType}" valueMessagePrefix="savingsAccount.groupAccountType"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="savingsAccount.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${savingsAccountInstance.constraints.type.inList}" value="${savingsAccountInstance?.type}" valueMessagePrefix="savingsAccount.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: savingsAccountInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="savingsAccount.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${savingsAccountInstance.constraints.status.inList}" value="${savingsAccountInstance?.status}" valueMessagePrefix="savingsAccount.status"  />
</div>

