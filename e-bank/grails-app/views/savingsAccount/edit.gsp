

<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsAccount.label', default: 'SavingsAccount')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${savingsAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${savingsAccountInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${savingsAccountInstance?.id}" />
		<g:hiddenField name="version" value="${savingsAccountInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: savingsAccountInstance, field: 'product', 'error')}">
							<label for="product"><g:message code="savingsAccount.product.label" default="Product" /></label>
							<div class="controls">
								<g:select name="product.id" from="${zw.co.quantum.legend.model.SavingsProduct.list()}" optionKey="id" value="${savingsAccountInstance?.product?.id}"  />
								<span class="help-inline">${hasErrors(bean: savingsAccountInstance, field: 'product', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: savingsAccountInstance, field: 'groupAccountType', 'error')}">
							<label for="groupAccountType"><g:message code="savingsAccount.groupAccountType.label" default="Group Account Type" /></label>
							<div class="controls">
								<g:select name="groupAccountType" from="${savingsAccountInstance.constraints.groupAccountType.inList}" value="${savingsAccountInstance?.groupAccountType}" valueMessagePrefix="savingsAccount.groupAccountType"  />
								<span class="help-inline">${hasErrors(bean: savingsAccountInstance, field: 'groupAccountType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: savingsAccountInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="savingsAccount.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${savingsAccountInstance.constraints.type.inList}" value="${savingsAccountInstance?.type}" valueMessagePrefix="savingsAccount.type"  />
								<span class="help-inline">${hasErrors(bean: savingsAccountInstance, field: 'type', 'error')}</span>
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
