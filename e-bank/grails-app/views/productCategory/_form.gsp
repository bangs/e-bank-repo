<%@ page import="zw.co.quantum.legend.model.ProductCategory" %>



<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="productCategory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" value="${productCategoryInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="productCategory.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${productCategoryInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="productCategory.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${productCategoryInstance.constraints.type.inList}" value="${productCategoryInstance?.type}" valueMessagePrefix="productCategory.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="productCategory.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${productCategoryInstance.constraints.status.inList}" value="${productCategoryInstance?.status}" valueMessagePrefix="productCategory.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="productCategory.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${productCategoryInstance?.institution?.id}"  />
</div>

