
<%@ page import="zw.co.quantum.legend.model.AppliedPenalty" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedPenalty.label', default: 'AppliedPenalty')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'appliedPenalty.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="entityId" title="${message(code: 'appliedPenalty.entityId.label', default: 'Entity Id')}" />
			
				<g:sortableColumn property="entityType" title="${message(code: 'appliedPenalty.entityType.label', default: 'Entity Type')}" />
			
				<th><g:message code="appliedPenalty.penalty.label" default="Penalty" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'appliedPenalty.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'appliedPenalty.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${appliedPenaltyInstanceList}" status="i" var="appliedPenaltyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${appliedPenaltyInstance.id}">${fieldValue(bean: appliedPenaltyInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: appliedPenaltyInstance, field: "entityId")}</td>
			
				<td>${fieldValue(bean: appliedPenaltyInstance, field: "entityType")}</td>
			
				<td>${fieldValue(bean: appliedPenaltyInstance, field: "penalty")}</td>
			
				<td><g:formatDate date="${appliedPenaltyInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${appliedPenaltyInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${appliedPenaltyInstanceTotal}" />
	</div>
</section>

</body>

</html>
