
<%@ page import="zw.co.quantum.legend.model.AppliedFee" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'appliedFee.label', default: 'AppliedFee')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'appliedFee.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="entityId" title="${message(code: 'appliedFee.entityId.label', default: 'Entity Id')}" />
			
				<g:sortableColumn property="entityType" title="${message(code: 'appliedFee.entityType.label', default: 'Entity Type')}" />
			
				<th><g:message code="appliedFee.fee.label" default="Fee" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'appliedFee.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'appliedFee.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${appliedFeeInstanceList}" status="i" var="appliedFeeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${appliedFeeInstance.id}">${fieldValue(bean: appliedFeeInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: appliedFeeInstance, field: "entityId")}</td>
			
				<td>${fieldValue(bean: appliedFeeInstance, field: "entityType")}</td>
			
				<td>${fieldValue(bean: appliedFeeInstance, field: "fee")}</td>
			
				<td><g:formatDate date="${appliedFeeInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${appliedFeeInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${appliedFeeInstanceTotal}" />
	</div>
</section>

</body>

</html>
