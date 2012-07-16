

<%@ page import="zw.co.quantum.legend.model.AppliedPenalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedPenalty.label', default: 'AppliedPenalty')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${appliedPenaltyInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${appliedPenaltyInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${appliedPenaltyInstance?.id}" />
		<g:hiddenField name="version" value="${appliedPenaltyInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'entityId', 'error')}">
							<label for="entityId"><g:message code="appliedPenalty.entityId.label" default="Entity Id" /></label>
							<div class="controls">
								<g:textField name="entityId" value="${fieldValue(bean: appliedPenaltyInstance, field: 'entityId')}" />
								<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'entityId', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'entityType', 'error')}">
							<label for="entityType"><g:message code="appliedPenalty.entityType.label" default="Entity Type" /></label>
							<div class="controls">
								<g:textField name="entityType" maxlength="40" value="${appliedPenaltyInstance?.entityType}" />
								<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'entityType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'penalty', 'error')}">
							<label for="penalty"><g:message code="appliedPenalty.penalty.label" default="Penalty" /></label>
							<div class="controls">
								<g:select name="penalty.id" from="${zw.co.quantum.legend.model.Penalty.list()}" optionKey="id" value="${appliedPenaltyInstance?.penalty?.id}"  />
								<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'penalty', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedPenaltyInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="appliedPenalty.status.label" default="Status" /></label>
							<div class="controls">
								<g:textField name="status" value="${appliedPenaltyInstance?.status}" />
								<span class="help-inline">${hasErrors(bean: appliedPenaltyInstance, field: 'status', 'error')}</span>
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
