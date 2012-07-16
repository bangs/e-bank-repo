

<%@ page import="zw.co.quantum.legend.model.Product" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${productInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${productInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'institution', 'error')}">
								<label for="institution" class="control-label"><g:message code="product.institution.label" default="Institution" /></label>
				            	<div class="controls">
									<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${productInstance?.institution?.id}"  />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'institution', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'name', 'error')}">
								<label for="name" class="control-label"><g:message code="product.name.label" default="Name" /></label>
				            	<div class="controls">
									<g:textField name="name" maxlength="70" value="${productInstance?.name}" />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'name', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'shortName', 'error')}">
								<label for="shortName" class="control-label"><g:message code="product.shortName.label" default="Short Name" /></label>
				            	<div class="controls">
									<g:textField name="shortName" maxlength="30" value="${productInstance?.shortName}" />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'shortName', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="product.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" maxlength="160" value="${productInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'description', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'category', 'error')}">
								<label for="category" class="control-label"><g:message code="product.category.label" default="Category" /></label>
				            	<div class="controls">
									<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" optionKey="id" value="${productInstance?.category?.id}"  />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'category', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'startDate', 'error')}">
								<label for="startDate" class="control-label"><g:message code="product.startDate.label" default="Start Date" /></label>
				            	<div class="controls">
									<g:datePicker name="startDate" precision="day" value="${productInstance?.startDate}"  />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'startDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'endDate', 'error')}">
								<label for="endDate" class="control-label"><g:message code="product.endDate.label" default="End Date" /></label>
				            	<div class="controls">
									<g:datePicker name="endDate" precision="day" value="${productInstance?.endDate}" default="none" noSelection="['': '']" />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'endDate', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'applicableFor', 'error')}">
								<label for="applicableFor" class="control-label"><g:message code="product.applicableFor.label" default="Applicable For" /></label>
				            	<div class="controls">
									<g:select name="applicableFor" from="${productInstance.constraints.applicableFor.inList}" value="${productInstance?.applicableFor}" valueMessagePrefix="product.applicableFor"  />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'applicableFor', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: productInstance, field: 'status', 'error')}">
								<label for="status" class="control-label"><g:message code="product.status.label" default="Status" /></label>
				            	<div class="controls">
									<g:select name="status" from="${productInstance.constraints.status.inList}" value="${productInstance?.status}" valueMessagePrefix="product.status"  />
									<span class="help-inline">${hasErrors(bean: productInstance, field: 'status', 'error')}</span>
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
