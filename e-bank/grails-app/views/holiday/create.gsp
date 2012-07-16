

<%@ page import="zw.co.quantum.legend.model.Holiday" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${holidayInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${holidayInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: holidayInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="holiday.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="40" value="${holidayInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: holidayInstance, field: 'startDate', 'error')}">
								<label for="startDate" class="control-label"><g:message code="holiday.startDate.label" default="Start Date" /></label>
				            	<div class="controls">
									<g:datePicker name="startDate" precision="day" value="${holidayInstance?.startDate}"  />
									<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'startDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: holidayInstance, field: 'endDate', 'error')}">
								<label for="endDate" class="control-label"><g:message code="holiday.endDate.label" default="End Date" /></label>
				            	<div class="controls">
									<g:datePicker name="endDate" precision="day" value="${holidayInstance?.endDate}"  />
									<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'endDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: holidayInstance, field: 'repaymentRule', 'error')}">
								<label for="repaymentRule" class="control-label"><g:message code="holiday.repaymentRule.label" default="Repayment Rule" /></label>
				            	<div class="controls">
									<g:select name="repaymentRule" from="${holidayInstance.constraints.repaymentRule.inList}" value="${holidayInstance?.repaymentRule}" valueMessagePrefix="holiday.repaymentRule"  />
									<span class="help-inline">${hasErrors(bean: holidayInstance, field: 'repaymentRule', 'error')}</span>
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
