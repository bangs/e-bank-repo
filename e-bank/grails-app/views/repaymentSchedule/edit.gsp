

<%@ page import="zw.co.quantum.legend.model.RepaymentSchedule" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'repaymentSchedule.label', default: 'RepaymentSchedule')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${repaymentScheduleInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${repaymentScheduleInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${repaymentScheduleInstance?.id}" />
		<g:hiddenField name="version" value="${repaymentScheduleInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'installmentNo', 'error')}">
							<label for="installmentNo"><g:message code="repaymentSchedule.installmentNo.label" default="Installment No" /></label>
							<div class="controls">
								<g:textField name="installmentNo" value="${fieldValue(bean: repaymentScheduleInstance, field: 'installmentNo')}" />
								<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'installmentNo', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'dueDate', 'error')}">
							<label for="dueDate"><g:message code="repaymentSchedule.dueDate.label" default="Due Date" /></label>
							<div class="controls">
								<g:datePicker name="dueDate" precision="day" value="${repaymentScheduleInstance?.dueDate}"  />
								<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'dueDate', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'principal', 'error')}">
							<label for="principal"><g:message code="repaymentSchedule.principal.label" default="Principal" /></label>
							<div class="controls">
								<g:textField name="principal" value="${fieldValue(bean: repaymentScheduleInstance, field: 'principal')}" />
								<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'principal', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'interest', 'error')}">
							<label for="interest"><g:message code="repaymentSchedule.interest.label" default="Interest" /></label>
							<div class="controls">
								<g:textField name="interest" value="${fieldValue(bean: repaymentScheduleInstance, field: 'interest')}" />
								<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'interest', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: repaymentScheduleInstance, field: 'loanAccount', 'error')}">
							<label for="loanAccount"><g:message code="repaymentSchedule.loanAccount.label" default="Loan Account" /></label>
							<div class="controls">
								<g:select name="loanAccount.id" from="${zw.co.quantum.legend.model.LoanAccount.list()}" optionKey="id" value="${repaymentScheduleInstance?.loanAccount?.id}"  />
								<span class="help-inline">${hasErrors(bean: repaymentScheduleInstance, field: 'loanAccount', 'error')}</span>
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
