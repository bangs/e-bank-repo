

<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'financialAccount.label', default: 'FinancialAccount')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${financialAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${financialAccountInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${financialAccountInstance?.id}" />
		<g:hiddenField name="version" value="${financialAccountInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'branch', 'error')}">
							<label for="branch"><g:message code="financialAccount.branch.label" default="Branch" /></label>
							<div class="controls">
								<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${financialAccountInstance?.branch?.id}"  />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'branch', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'accountNumber', 'error')}">
							<label for="accountNumber"><g:message code="financialAccount.accountNumber.label" default="Account Number" /></label>
							<div class="controls">
								<g:textField name="accountNumber" maxlength="30" value="${financialAccountInstance?.accountNumber}" />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'accountNumber', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'ownerId', 'error')}">
							<label for="ownerId"><g:message code="financialAccount.ownerId.label" default="Owner Id" /></label>
							<div class="controls">
								<g:textField name="ownerId" maxlength="30" value="${financialAccountInstance?.ownerId}" />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'ownerId', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'ownerClass', 'error')}">
							<label for="ownerClass"><g:message code="financialAccount.ownerClass.label" default="Owner Class" /></label>
							<div class="controls">
								<g:textField name="ownerClass" maxlength="60" value="${financialAccountInstance?.ownerClass}" />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'ownerClass', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'ownerType', 'error')}">
							<label for="ownerType"><g:message code="financialAccount.ownerType.label" default="Owner Type" /></label>
							<div class="controls">
								<g:textField name="ownerType" maxlength="30" value="${financialAccountInstance?.ownerType}" />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'ownerType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: financialAccountInstance, field: 'superType', 'error')}">
							<label for="superType"><g:message code="financialAccount.superType.label" default="Super Type" /></label>
							<div class="controls">
								<g:select name="superType" from="${financialAccountInstance.constraints.superType.inList}" value="${financialAccountInstance?.superType}" valueMessagePrefix="financialAccount.superType"  />
								<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'superType', 'error')}</span>
							</div>
						</div>
				
		<div class="form-actions">
			<g:actionSubmit class="save btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
