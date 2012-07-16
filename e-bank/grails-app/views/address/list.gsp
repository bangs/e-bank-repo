
<%@ page import="zw.co.quantum.legend.model.Address" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'address.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="street" title="${message(code: 'address.street.label', default: 'Street')}" />
			
				<g:sortableColumn property="suburb" title="${message(code: 'address.suburb.label', default: 'Suburb')}" />
			
				<g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
			
				<g:sortableColumn property="country" title="${message(code: 'address.country.label', default: 'Country')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'address.telephone.label', default: 'Telephone')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${addressInstanceList}" status="i" var="addressInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: addressInstance, field: "street")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "suburb")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "city")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "country")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "telephone")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${addressInstanceTotal}" />
	</div>
</section>

</body>

</html>
