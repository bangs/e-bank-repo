<%@ page import="zw.co.quantum.legend.model.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="product.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${productInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="70" value="${productInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'shortName', 'error')} required">
	<label for="shortName">
		<g:message code="product.shortName.label" default="Short Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shortName" maxlength="30" value="${productInstance?.shortName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="160" value="${productInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="product.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="category.id" from="${zw.co.quantum.legend.model.ProductCategory.list()}" optionKey="id" value="${productInstance?.category?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="product.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day" value="${productInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="product.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day" value="${productInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'applicableFor', 'error')} required">
	<label for="applicableFor">
		<g:message code="product.applicableFor.label" default="Applicable For" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="applicableFor" from="${productInstance.constraints.applicableFor.inList}" value="${productInstance?.applicableFor}" valueMessagePrefix="product.applicableFor"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="product.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${productInstance.constraints.status.inList}" value="${productInstance?.status}" valueMessagePrefix="product.status"  />
</div>

