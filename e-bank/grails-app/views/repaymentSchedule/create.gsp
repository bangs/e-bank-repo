

<%@ page import="zw.co.quantum.legend.model.RepaymentSchedule" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${repaymentScheduleInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${repaymentScheduleInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'installmentNo', 'error')}">
								<label for="installmentNo" class="control-label"><g:message code="repaymentSchedule.installmentNo.label" default="Installment No" /></label>
				            	<div class="controls">
									<g:textField name="installmentNo" value="${fieldValue(bean: repaymentScheduleInstance, field: 'installmentNo')}" />
									<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'installmentNo', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'dueDate', 'error')}">
								<label for="dueDate" class="control-label"><g:message code="repaymentSchedule.dueDate.label" default="Due Date" /></label>
				            	<div class="controls">
									<g:datePicker name="dueDate" precision="day" value="${repaymentScheduleInstance?.dueDate}"  />
									<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'dueDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'principal', 'error')}">
								<label for="principal" class="control-label"><g:message code="repaymentSchedule.principal.label" default="Principal" /></label>
				            	<div class="controls">
									<g:textField name="principal" value="${fieldValue(bean: repaymentScheduleInstance, field: 'principal')}" />
									<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'principal', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'interest', 'error')}">
								<label for="interest" class="control-label"><g:message code="repaymentSchedule.interest.label" default="Interest" /></label>
				            	<div class="controls">
									<g:textField name="interest" value="${fieldValue(bean: repaymentScheduleInstance, field: 'interest')}" />
									<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'interest', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'loanAccount', 'error')}">
								<label for="loanAccount" class="control-label"><g:message code="repaymentSchedule.loanAccount.label" default="Loan Account" /></label>
				            	<div class="controls">
									<g:select name="loanAccount.id" from="${zw.co.quantum.legend.model.LoanAccount.list()}" optionKey="id" value="${repaymentScheduleInstance?.loanAccount?.id}"  />
									<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'loanAccount', 'error')}</span>
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
