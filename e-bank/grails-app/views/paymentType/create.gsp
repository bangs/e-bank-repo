

<%@ page import="zw.co.quantum.legend.model.PaymentType" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentType.label', default: 'PaymentType')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${paymentTypeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${paymentTypeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: paymentTypeInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="paymentType.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:select name="name" from="${paymentTypeInstance.constraints.name.inList}" value="${paymentTypeInstance?.name}" valueMessagePrefix="paymentType.name"  />
									<span class="help-inline">${hasErrors(bean: paymentTypeInstance, field: 'name', 'error')}</span>
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
