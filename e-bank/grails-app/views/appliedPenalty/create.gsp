

<%@ page import="zw.co.quantum.legend.model.AppliedPenalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedPenalty.label', default: 'AppliedPenalty')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${appliedPenaltyInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${appliedPenaltyInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'entityId', 'error')}">
								<label for="entityId" class="control-label"><g:message code="appliedPenalty.entityId.label" default="Entity Id" /></label>
				            	<div class="controls">
									<g:textField name="entityId" value="${fieldValue(bean: appliedPenaltyInstance, field: 'entityId')}" />
									<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'entityId', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'entityType', 'error')}">
								<label for="entityType" class="control-label"><g:message code="appliedPenalty.entityType.label" default="Entity Type" /></label>
				            	<div class="controls">
									<g:textField name="entityType" maxlength="40" value="${appliedPenaltyInstance?.entityType}" />
									<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'entityType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'penalty', 'error')}">
								<label for="penalty" class="control-label"><g:message code="appliedPenalty.penalty.label" default="Penalty" /></label>
				            	<div class="controls">
									<g:select name="penalty.id" from="${zw.co.quantum.legend.model.Penalty.list()}" optionKey="id" value="${appliedPenaltyInstance?.penalty?.id}"  />
									<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'penalty', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'status', 'error')}">
								<label for="status" class="control-label"><g:message code="appliedPenalty.status.label" default="Status" /></label>
				            	<div class="controls">
									<g:textField name="status" value="${appliedPenaltyInstance?.status}" />
									<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'status', 'error')}</span>
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
