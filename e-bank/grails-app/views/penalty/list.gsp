
<%@ page import="zw.co.quantum.legend.model.Penalty" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penalty.label', default: 'Penalty')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'penalty.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="appliesTo" title="${message(code: 'penalty.appliesTo.label', default: 'Applies To')}" />
			
				<g:sortableColumn property="gracePeriodType" title="${message(code: 'penalty.gracePeriodType.label', default: 'Grace Period Type')}" />
			
				<g:sortableColumn property="gracePeriodDuration" title="${message(code: 'penalty.gracePeriodDuration.label', default: 'Grace Period Duration')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${penaltyInstanceList}" status="i" var="penaltyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${penaltyInstance.id}">${fieldValue(bean: penaltyInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: penaltyInstance, field: "appliesTo")}</td>
			
				<td>${fieldValue(bean: penaltyInstance, field: "gracePeriodType")}</td>
			
				<td>${fieldValue(bean: penaltyInstance, field: "gracePeriodDuration")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${penaltyInstanceTotal}" />
	</div>
</section>

</body>

</html>
