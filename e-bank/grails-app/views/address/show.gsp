
<%@ page import="zw.co.quantum.legend.model.Address" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.street.label" default="Street" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "street")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.suburb.label" default="Suburb" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "suburb")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.city.label" default="City" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "city")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.country.label" default="Country" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "country")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${addressInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${addressInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${addressInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
