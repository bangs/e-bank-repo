

<%@ page import="zw.co.quantum.legend.model.AppliedFee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedFee.label', default: 'AppliedFee')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${appliedFeeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${appliedFeeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${appliedFeeInstance?.id}" />
		<g:hiddenField name="version" value="${appliedFeeInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'entityId', 'error')}">
							<label for="entityId"><g:message code="appliedFee.entityId.label" default="Entity Id" /></label>
							<div class="controls">
								<g:textField name="entityId" value="${fieldValue(bean: appliedFeeInstance, field: 'entityId')}" />
								<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'entityId', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'entityType', 'error')}">
							<label for="entityType"><g:message code="appliedFee.entityType.label" default="Entity Type" /></label>
							<div class="controls">
								<g:textField name="entityType" maxlength="40" value="${appliedFeeInstance?.entityType}" />
								<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'entityType', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'fee', 'error')}">
							<label for="fee"><g:message code="appliedFee.fee.label" default="Fee" /></label>
							<div class="controls">
								<g:select name="fee.id" from="${zw.co.quantum.legend.model.Fee.list()}" optionKey="id" value="${appliedFeeInstance?.fee?.id}"  />
								<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'fee', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="appliedFee.status.label" default="Status" /></label>
							<div class="controls">
								<g:textField name="status" value="${appliedFeeInstance?.status}" />
								<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'status', 'error')}</span>
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
