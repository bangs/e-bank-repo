

<%@ page import="zw.co.quantum.legend.model.AppliedFee" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedFee.label', default: 'AppliedFee')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${appliedFeeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${appliedFeeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'entityId', 'error')}">
								<label for="entityId" class="control-label"><g:message code="appliedFee.entityId.label" default="Entity Id" /></label>
				            	<div class="controls">
									<g:textField name="entityId" value="${fieldValue(bean: appliedFeeInstance, field: 'entityId')}" />
									<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'entityId', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'entityType', 'error')}">
								<label for="entityType" class="control-label"><g:message code="appliedFee.entityType.label" default="Entity Type" /></label>
				            	<div class="controls">
									<g:textField name="entityType" maxlength="40" value="${appliedFeeInstance?.entityType}" />
									<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'entityType', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'fee', 'error')}">
								<label for="fee" class="control-label"><g:message code="appliedFee.fee.label" default="Fee" /></label>
				            	<div class="controls">
									<g:select name="fee.id" from="${zw.co.quantum.legend.model.Fee.list()}" optionKey="id" value="${appliedFeeInstance?.fee?.id}"  />
									<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'fee', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: appliedFeeInstance, field: 'status', 'error')}">
								<label for="status" class="control-label"><g:message code="appliedFee.status.label" default="Status" /></label>
				            	<div class="controls">
									<g:textField name="status" value="${appliedFeeInstance?.status}" />
									<span class="help-inline">${hasErrors(bean: appliedFeeInstance, field: 'status', 'error')}</span>
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
