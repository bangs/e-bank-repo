

<%@ page import="zw.co.quantum.legend.model.Penalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penalty.label', default: 'Penalty')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${penaltyInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${penaltyInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${penaltyInstance?.id}" />
		<g:hiddenField name="version" value="${penaltyInstance?.version}" />
				
						
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="penalty.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="80" value="${penaltyInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'appliesTo', 'error')}">
							<label for="appliesTo"><g:message code="penalty.appliesTo.label" default="Applies To" /></label>
							<div class="controls">
								<g:select name="appliesTo" from="${penaltyInstance.constraints.appliesTo.inList}" value="${penaltyInstance?.appliesTo}" valueMessagePrefix="penalty.appliesTo"  />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'appliesTo', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gracePeriodType', 'error')}">
							<label for="gracePeriodType"><g:message code="penalty.gracePeriodType.label" default="Grace Period Type" /></label>
							<div class="controls">
								<g:select name="gracePeriodType" from="${penaltyInstance.constraints.gracePeriodType.inList}" value="${penaltyInstance?.gracePeriodType}" valueMessagePrefix="penalty.gracePeriodType"  />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gracePeriodType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gracePeriodDuration', 'error')}">
							<label for="gracePeriodDuration"><g:message code="penalty.gracePeriodDuration.label" default="Grace Period Duration" /></label>
							<div class="controls">
								<g:textField name="gracePeriodDuration" value="${fieldValue(bean: penaltyInstance, field: 'gracePeriodDuration')}" />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gracePeriodDuration', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'minCumulativeLimit', 'error')}">
							<label for="minCumulativeLimit"><g:message code="penalty.minCumulativeLimit.label" default="Min Cumulative Limit" /></label>
							<div class="controls">
								<g:textField name="minCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'minCumulativeLimit')}" />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'minCumulativeLimit', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'maxCumulativeLimit', 'error')}">
							<label for="maxCumulativeLimit"><g:message code="penalty.maxCumulativeLimit.label" default="Max Cumulative Limit" /></label>
							<div class="controls">
								<g:textField name="maxCumulativeLimit" value="${fieldValue(bean: penaltyInstance, field: 'maxCumulativeLimit')}" />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'maxCumulativeLimit', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'amount', 'error')}">
							<label for="amount"><g:message code="penalty.amount.label" default="Amount" /></label>
							<div class="controls">
								<g:textField name="amount" value="${fieldValue(bean: penaltyInstance, field: 'amount')}" />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'amount', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'frequency', 'error')}">
							<label for="frequency"><g:message code="penalty.frequency.label" default="Frequency" /></label>
							<div class="controls">
								<g:select name="frequency" from="${penaltyInstance.constraints.frequency.inList}" value="${penaltyInstance?.frequency}" valueMessagePrefix="penalty.frequency"  />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'frequency', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'gLCode', 'error')}">
							<label for="gLCode"><g:message code="penalty.gLCode.label" default="GLC ode" /></label>
							<div class="controls">
								<g:select name="gLCode.id" from="${zw.co.quantum.legend.model.GLCode.list()}" optionKey="id" value="${penaltyInstance?.gLCode?.id}"  />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'gLCode', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="penalty.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${penaltyInstance.constraints.status.inList}" value="${penaltyInstance?.status}" valueMessagePrefix="penalty.status"  />
								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'status', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: penaltyInstance, field: 'appliedPenalties', 'error')}">
							<label for="appliedPenalties"><g:message code="penalty.appliedPenalties.label" default="Applied Penalties" /></label>
							<div class="controls">
								
<ul>
<g:each in="${penaltyInstance?.appliedPenalties?}" var="a">
    <li><g:link controller="appliedPenalty" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="appliedPenalty" action="create" params="['penalty.id': penaltyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'appliedPenalty.label', default: 'AppliedPenalty')])}</g:link>

								<span class="help-inline">${hasErrors(bean: penaltyInstance, field: 'appliedPenalties', 'error')}</span>
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
