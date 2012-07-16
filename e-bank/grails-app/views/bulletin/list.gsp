
<%@ page import="zw.co.quantum.legend.model.Bulletin" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bulletin.label', default: 'Bulletin')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="id" title="${message(code: 'bulletin.id.label', default: 'Id')}" />
			
				<g:sortableColumn property="message" title="${message(code: 'bulletin.message.label', default: 'Message')}" />
			
				<g:sortableColumn property="startDate" title="${message(code: 'bulletin.startDate.label', default: 'Start Date')}" />
			
				<g:sortableColumn property="endDate" title="${message(code: 'bulletin.endDate.label', default: 'End Date')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'bulletin.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'bulletin.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bulletinInstanceList}" status="i" var="bulletinInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${bulletinInstance.id}">${fieldValue(bean: bulletinInstance, field: "id")}</g:link></td>
			
				<td>${fieldValue(bean: bulletinInstance, field: "message")}</td>
			
				<td><g:formatDate date="${bulletinInstance.startDate}" /></td>
			
				<td><g:formatDate date="${bulletinInstance.endDate}" /></td>
			
				<td><g:formatDate date="${bulletinInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${bulletinInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${bulletinInstanceTotal}" />
	</div>
</section>

</body>

</html>
