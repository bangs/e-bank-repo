
<%@ page import="zw.co.quantum.legend.auth.Requestmap" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'requestmap.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="url" title="${message(code: 'requestmap.url.label', default: 'Url')}" />
			
				<g:sortableColumn property="configAttribute" title="${message(code: 'requestmap.configAttribute.label', default: 'Config Attribute')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${requestmapInstanceList}" status="i" var="requestmapInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${requestmapInstance.id}">${fieldValue(bean: requestmapInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: requestmapInstance, field: "url")}</td>
			
				<td>${fieldValue(bean: requestmapInstance, field: "configAttribute")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${requestmapInstanceTotal}" />
	</div>
</section>

</body>

</html>
