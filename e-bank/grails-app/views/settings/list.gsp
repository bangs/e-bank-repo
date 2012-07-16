
<%@ page import="zw.co.quantum.legend.model.Settings" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settings.label', default: 'Settings')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'settings.id.label', default: 'Id')}" />
						
				<g:sortableColumn property="startOfWeek" title="${message(code: 'settings.startOfWeek.label', default: 'Start Of Week')}" />
			
				<g:sortableColumn property="offDays" title="${message(code: 'settings.offDays.label', default: 'Off Days')}" />
			
				<g:sortableColumn property="baseCurrency" title="${message(code: 'settings.baseCurrency.label', default: 'Base Currency')}" />
			
				<g:sortableColumn property="customCurrency" title="${message(code: 'settings.customCurrency.label', default: 'Custom Currency')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${settingsInstanceList}" status="i" var="settingsInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${settingsInstance.id}">${fieldValue(bean: settingsInstance, field: "id")}</g:link></td>
						
				<td>${fieldValue(bean: settingsInstance, field: "startOfWeek")}</td>
			
				<td>${fieldValue(bean: settingsInstance, field: "offDays")}</td>
			
				<td>${fieldValue(bean: settingsInstance, field: "baseCurrency")}</td>
			
				<td>${fieldValue(bean: settingsInstance, field: "customCurrency")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${settingsInstanceTotal}" />
	</div>
</section>

</body>

</html>
