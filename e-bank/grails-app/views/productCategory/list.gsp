
<%@ page import="zw.co.quantum.legend.model.ProductCategory" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
						
				<g:sortableColumn property="name" title="${message(code: 'productCategory.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'productCategory.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'productCategory.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'productCategory.status.label', default: 'Status')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'productCategory.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productCategoryInstanceList}" status="i" var="productCategoryInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productCategoryInstance.id}">${fieldValue(bean: productCategoryInstance, field: "name")}</g:link></td>
						
				<td>${fieldValue(bean: productCategoryInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: productCategoryInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: productCategoryInstance, field: "status")}</td>
			
				<td><g:formatDate date="${productCategoryInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productCategoryInstanceTotal}" />
	</div>
</section>

</body>

</html>
