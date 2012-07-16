

<%@ page import="zw.co.quantum.legend.model.Penalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penalty.label', default: 'Penalty')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${penaltyInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${penaltyInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
					
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="penalty.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="80" value="${penaltyInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'appliesTo', 'error')}">
								<label for="appliesTo" class="control-label"><g:message code="penalty.appliesTo.label" default="Applies To" /></label>
				            	<div class="controls">
									<g:select name="appliesTo" from="${penaltyInstance.constraints.appliesTo.inList}" value="${penaltyInstance?.appliesTo}" valueMessagePrefix="penalty.appliesTo"  />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'appliesTo', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gracePeriodType', 'error')}">
								<label for="gracePeriodType" class="control-label"><g:message code="penalty.gracePeriodType.label" default="Grace Period Type" /></label>
				            	<div class="controls">
									<g:select name="gracePeriodType" from="${penaltyInstance.constraints.gracePeriodType.inList}" value="${penaltyInstance?.gracePeriodType}" valueMessagePrefix="penalty.gracePeriodType"  />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gracePeriodType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gracePeriodDuration', 'error')}">
								<label for="gracePeriodDuration" class="control-label"><g:message code="penalty.gracePeriodDuration.label" default="Grace Period Duration" /></label>
				            	<div class="controls">
									<g:textField name="gracePeriodDuration" value="${fieldValue(bean: penaltyInstance, field: 'gracePeriodDuration')}" />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gracePeriodDuration', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'minCumulativeLimit', 'error')}">
								<label for="minCumulativeLimit" class="control-label"><g:message code="penalty.minCumulativeLimit.label" default="Min Cumulative Limit" /></label>
				            	<div class="controls">
									<g:textField name="minCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'minCumulativeLimit')}" />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'minCumulativeLimit', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'maxCumulativeLimit', 'error')}">
								<label for="maxCumulativeLimit" class="control-label"><g:message code="penalty.maxCumulativeLimit.label" default="Max Cumulative Limit" /></label>
				            	<div class="controls">
									<g:textField name="maxCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'maxCumulativeLimit')}" />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'maxCumulativeLimit', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'amount', 'error')}">
								<label for="amount" class="control-label"><g:message code="penalty.amount.label" default="Amount" /></label>
				            	<div class="controls">
									<g:textField name="amount" value="${fieldValue(bean: penaltyInstance, field: 'amount')}" />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'amount', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'frequency', 'error')}">
								<label for="frequency" class="control-label"><g:message code="penalty.frequency.label" default="Frequency" /></label>
				            	<div class="controls">
									<g:select name="frequency" from="${penaltyInstance.constraints.frequency.inList}" value="${penaltyInstance?.frequency}" valueMessagePrefix="penalty.frequency"  />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'frequency', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gLCode', 'error')}">
								<label for="gLCode" class="control-label"><g:message code="penalty.gLCode.label" default="GLC ode" /></label>
				            	<div class="controls">
									<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${penaltyInstance?.gLCode?.id}"  />
									<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gLCode', 'error')}</span>
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
