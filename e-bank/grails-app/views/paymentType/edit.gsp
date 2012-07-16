

<%@ page import="zw.co.quantum.legend.model.PaymentType" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentType.label', default: 'PaymentType')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${paymentTypeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${paymentTypeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${paymentTypeInstance?.id}" />
		<g:hiddenField name="version" value="${paymentTypeInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: paymentTypeInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="paymentType.name.label" default="Name" /></label>
							<div class="controls">
								<g:select name="name" from="${paymentTypeInstance.constraints.name.inList}" value="${paymentTypeInstance?.name}" valueMessagePrefix="paymentType.name"  />
								<span class="help-inline">${hasErrors(bean: paymentTypeInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: paymentTypeInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="paymentType.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${paymentTypeInstance.constraints.status.inList}" value="${paymentTypeInstance?.status}" valueMessagePrefix="paymentType.status"  />
								<span class="help-inline">${hasErrors(bean: paymentTypeInstance, field: 'status', 'error')}</span>
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
