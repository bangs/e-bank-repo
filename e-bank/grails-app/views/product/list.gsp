
<%@ page import="zw.co.quantum.legend.model.Product" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
			
				<th><g:message code="product.institution.label" default="Institution" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="shortName" title="${message(code: 'product.shortName.label', default: 'Short Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
			
				<th><g:message code="product.category.label" default="Category" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: productInstance, field: "institution")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "shortName")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "category")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productInstanceTotal}" />
	</div>
</section>

</body>

</html>
