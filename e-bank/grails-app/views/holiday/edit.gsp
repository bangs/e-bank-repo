

<%@ page import="zw.co.quantum.legend.model.Holiday" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${holidayInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${holidayInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${holidayInstance?.id}" />
		<g:hiddenField name="version" value="${holidayInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: holidayInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="holiday.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="40" value="${holidayInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: holidayInstance, field: 'startDate', 'error')}">
							<label for="startDate"><g:message code="holiday.startDate.label" default="Start Date" /></label>
							<div class="controls">
								<g:datePicker name="startDate" precision="day" value="${holidayInstance?.startDate}"  />
								<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'startDate', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: holidayInstance, field: 'endDate', 'error')}">
							<label for="endDate"><g:message code="holiday.endDate.label" default="End Date" /></label>
							<div class="controls">
								<g:datePicker name="endDate" precision="day" value="${holidayInstance?.endDate}"  />
								<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'endDate', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: holidayInstance, field: 'repaymentRule', 'error')}">
							<label for="repaymentRule"><g:message code="holiday.repaymentRule.label" default="Repayment Rule" /></label>
							<div class="controls">
								<g:select name="repaymentRule" from="${holidayInstance.constraints.repaymentRule.inList}" value="${holidayInstance?.repaymentRule}" valueMessagePrefix="holiday.repaymentRule"  />
								<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'repaymentRule', 'error')}</span>
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
