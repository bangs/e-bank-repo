

<%@ page import="zw.co.quantum.legend.model.ProductCategory" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${productCategoryInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${productCategoryInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="productCategory.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="100" value="${productCategoryInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="productCategory.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textArea name="description" maxlength="160" value="${productCategoryInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productCategoryInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="productCategory.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${productCategoryInstance.constraints.type.inList}" value="${productCategoryInstance?.type}" valueMessagePrefix="productCategory.type"  />
									<span class="help-inline">${hasErrors(bean: productCategoryInstance, field: 'type', 'error')}</span>
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
