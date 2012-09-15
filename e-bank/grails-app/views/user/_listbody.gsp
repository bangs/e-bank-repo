<h4>Search Results</h4>
<div class="messages">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
</div>		
<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
						
				<th><g:message code="user.branch.label" default="Branch" /></th>
			
				<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
						
				<g:sortableColumn property="password" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: userInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
						
				<td>${fieldValue(bean: userInstance, field: "enabled")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${userInstanceTotal}">
			<bs:paginate total="${userInstanceTotal}" />
		</g:if>
	</div>
</section>