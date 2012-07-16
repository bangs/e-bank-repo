

<%@ page import="zw.co.quantum.legend.model.LatenessDormancyDef" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${latenessDormancyDefInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${latenessDormancyDefInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${latenessDormancyDefInstance?.id}" />
		<g:hiddenField name="version" value="${latenessDormancyDefInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod', 'error')}">
							<label for="lateLoanRepaymentGracePeriod"><g:message code="latenessDormancyDef.lateLoanRepaymentGracePeriod.label" default="Late Loan Repayment Grace Period" /></label>
							<div class="controls">
								<g:textField name="lateLoanRepaymentGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod')}" />
								<span class="help-inline">${hasErrors(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod', 'error')}">
							<label for="dormantSavingsAccGracePeriod"><g:message code="latenessDormancyDef.dormantSavingsAccGracePeriod.label" default="Dormant Savings Acc Grace Period" /></label>
							<div class="controls">
								<g:textField name="dormantSavingsAccGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod')}" />
								<span class="help-inline">${hasErrors(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: latenessDormancyDefInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="latenessDormancyDef.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${latenessDormancyDefInstance.constraints.status.inList}" value="${latenessDormancyDefInstance?.status}" valueMessagePrefix="latenessDormancyDef.status"  />
								<span class="help-inline">${hasErrors(bean: latenessDormancyDefInstance, field: 'status', 'error')}</span>
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
