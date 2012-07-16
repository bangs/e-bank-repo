

<%@ page import="zw.co.quantum.legend.model.ProductCategory" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${productCategoryInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${productCategoryInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${productCategoryInstance?.id}" />
		<g:hiddenField name="version" value="${productCategoryInstance?.version}" />
				
						<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="productCategory.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="100" value="${productCategoryInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'description', 'error')}">
							<label for="description"><g:message code="productCategory.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description" maxlength="160" value="${productCategoryInstance?.description}" />
								<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'description', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'type', 'error')}">
							<label for="type"><g:message code="productCategory.type.label" default="Type" /></label>
							<div class="controls">
								<g:select name="type" from="${productCategoryInstance.constraints.type.inList}" value="${productCategoryInstance?.type}" valueMessagePrefix="productCategory.type"  />
								<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'type', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="productCategory.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${productCategoryInstance.constraints.status.inList}" value="${productCategoryInstance?.status}" valueMessagePrefix="productCategory.status"  />
								<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'status', 'error')}</span>
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
