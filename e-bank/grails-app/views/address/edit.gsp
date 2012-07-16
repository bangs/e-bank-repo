

<%@ page import="zw.co.quantum.legend.model.Address" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${addressInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${addressInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${addressInstance?.id}" />
		<g:hiddenField name="version" value="${addressInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: addressInstance, field: 'street', 'error')}">
							<label for="street"><g:message code="address.street.label" default="Street" /></label>
							<div class="controls">
								<g:textField name="street" maxlength="150" value="${addressInstance?.street}" />
								<span class="help-inline">${hasErrors(bean: addressInstance, field: 'street', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: addressInstance, field: 'suburb', 'error')}">
							<label for="suburb"><g:message code="address.suburb.label" default="Suburb" /></label>
							<div class="controls">
								<g:textField name="suburb" maxlength="100" value="${addressInstance?.suburb}" />
								<span class="help-inline">${hasErrors(bean: addressInstance, field: 'suburb', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: addressInstance, field: 'city', 'error')}">
							<label for="city"><g:message code="address.city.label" default="City" /></label>
							<div class="controls">
								<g:textField name="city" maxlength="100" value="${addressInstance?.city}" />
								<span class="help-inline">${hasErrors(bean: addressInstance, field: 'city', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: addressInstance, field: 'country', 'error')}">
							<label for="country"><g:message code="address.country.label" default="Country" /></label>
							<div class="controls">
								<g:textField name="country" maxlength="100" value="${addressInstance?.country}" />
								<span class="help-inline">${hasErrors(bean: addressInstance, field: 'country', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: addressInstance, field: 'telephone', 'error')}">
							<label for="telephone"><g:message code="address.telephone.label" default="Telephone" /></label>
							<div class="controls">
								<g:textField name="telephone" maxlength="20" value="${addressInstance?.telephone}" />
								<span class="help-inline">${hasErrors(bean: addressInstance, field: 'telephone', 'error')}</span>
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
