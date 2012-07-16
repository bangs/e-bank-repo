
<%@ page import="zw.co.quantum.legend.model.SavingsProduct" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsProduct.label', default: 'SavingsProduct')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
			
				<g:sortableColumn property="name" title="${message(code: 'savingsProduct.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="shortName" title="${message(code: 'savingsProduct.shortName.label', default: 'Short Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'savingsProduct.description.label', default: 'Description')}" />
			
				<th><g:message code="savingsProduct.category.label" default="Category" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${savingsProductInstanceList}" status="i" var="savingsProductInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${savingsProductInstance.id}">${fieldValue(bean: savingsProductInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: savingsProductInstance, field: "shortName")}</td>
			
				<td>${fieldValue(bean: savingsProductInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: savingsProductInstance, field: "category")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${savingsProductInstanceTotal}" />
	</div>
</section>

</body>

</html>
