

<%@ page import="zw.co.quantum.legend.model.LatenessDormancyDef" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'latenessDormancyDef.label', default: 'LatenessDormancyDef')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${latenessDormancyDefInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${latenessDormancyDefInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod', 'error')}">
								<label for="lateLoanRepaymentGracePeriod" class="control-label"><g:message code="latenessDormancyDef.lateLoanRepaymentGracePeriod.label" default="Late Loan Repayment Grace Period" /></label>
				            	<div class="controls">
									<g:textField name="lateLoanRepaymentGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod')}" />
									<span class="help-inline">${hasErrors(bean: latenessDormancyDefInstance, field: 'lateLoanRepaymentGracePeriod', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod', 'error')}">
								<label for="dormantSavingsAccGracePeriod" class="control-label"><g:message code="latenessDormancyDef.dormantSavingsAccGracePeriod.label" default="Dormant Savings Acc Grace Period" /></label>
				            	<div class="controls">
									<g:textField name="dormantSavingsAccGracePeriod" value="${fieldValue(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod')}" />
									<span class="help-inline">${hasErrors(bean: latenessDormancyDefInstance, field: 'dormantSavingsAccGracePeriod', 'error')}</span>
								</div>
							</div>
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
