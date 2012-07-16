<%@ page import="zw.co.quantum.legend.model.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="address.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" maxlength="150" value="${addressInstance?.street}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'suburb', 'error')} required">
	<label for="suburb">
		<g:message code="address.suburb.label" default="Suburb" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="suburb" maxlength="100" value="${addressInstance?.suburb}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="100" value="${addressInstance?.city}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" maxlength="100" value="${addressInstance?.country}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'telephone', 'error')} required">
	<label for="telephone">
		<g:message code="address.telephone.label" default="Telephone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telephone" maxlength="20" value="${addressInstance?.telephone}" />
</div>

