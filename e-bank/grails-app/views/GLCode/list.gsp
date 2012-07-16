
<%@ page import="zw.co.quantum.legend.model.GLCode" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'GLCode.label', default: 'GLCode')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'GLCode.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'GLCode.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'GLCode.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'GLCode.status.label', default: 'Status')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${GLCodeInstanceList}" status="i" var="GLCodeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${GLCodeInstance.id}">${fieldValue(bean: GLCodeInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: GLCodeInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: GLCodeInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: GLCodeInstance, field: "status")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${GLCodeInstanceTotal}" />
	</div>
</section>

</body>

</html>
