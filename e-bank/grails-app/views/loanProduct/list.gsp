
<%@ page import="zw.co.quantum.legend.model.LoanProduct" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanProduct.label', default: 'LoanProduct')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'loanProduct.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="shortName" title="${message(code: 'loanProduct.shortName.label', default: 'Short Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'loanProduct.description.label', default: 'Description')}" />
			
				<th><g:message code="loanProduct.category.label" default="Category" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${loanProductInstanceList}" status="i" var="loanProductInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${loanProductInstance.id}">${fieldValue(bean: loanProductInstance, field: "name")}</g:link></td>
									
				<td>${fieldValue(bean: loanProductInstance, field: "shortName")}</td>
			
				<td>${fieldValue(bean: loanProductInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: loanProductInstance, field: "category")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${loanProductInstanceTotal}" />
	</div>
</section>

</body>

</html>
