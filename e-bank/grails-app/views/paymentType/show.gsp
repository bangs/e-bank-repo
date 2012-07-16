
<%@ page import="zw.co.quantum.legend.model.PaymentType" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentType.label', default: 'PaymentType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentType.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentTypeInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentType.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentTypeInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentType.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${paymentTypeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentType.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${paymentTypeInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${paymentTypeInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
