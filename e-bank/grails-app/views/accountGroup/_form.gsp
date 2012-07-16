<%@ page import="zw.co.quantum.legend.model.AccountGroup" %>



<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="accountGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${accountGroupInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="accountGroup.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${accountGroupInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="accountGroup.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${accountGroupInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'recruitedBy', 'error')} required">
	<label for="recruitedBy">
		<g:message code="accountGroup.recruitedBy.label" default="Recruited By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="recruitedBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${accountGroupInstance?.recruitedBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="accountGroup.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" maxlength="30" value="${accountGroupInstance?.externalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="accountGroup.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${accountGroupInstance?.address?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="accountGroup.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${accountGroupInstance.constraints.status.inList}" value="${accountGroupInstance?.status}" valueMessagePrefix="accountGroup.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'loanAccounts', 'error')} ">
	<label for="loanAccounts">
		<g:message code="accountGroup.loanAccounts.label" default="Loan Accounts" />
		
	</label>
	
<ul>
<g:each in="${accountGroupInstance?.loanAccounts?}" var="l">
    <li><g:link controller="loanAccount" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="loanAccount" action="create" params="['accountGroup.id': accountGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'loanAccount.label', default: 'LoanAccount')])}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: accountGroupInstance, field: 'savingsAccounts', 'error')} ">
	<label for="savingsAccounts">
		<g:message code="accountGroup.savingsAccounts.label" default="Savings Accounts" />
		
	</label>
	
<ul>
<g:each in="${accountGroupInstance?.savingsAccounts?}" var="s">
    <li><g:link controller="savingsAccount" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="savingsAccount" action="create" params="['accountGroup.id': accountGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'savingsAccount.label', default: 'SavingsAccount')])}</g:link>

</div>

