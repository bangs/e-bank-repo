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
			
				<g:sortableColumn property="name" title="${message(code: 'clientGroup.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'clientGroup.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="accountType" title="${message(code: 'clientGroup.accountType.label', default: 'Account Type')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'clientGroup.email.label', default: 'Email')}" />
			
				<th><g:message code="clientGroup.address.label" default="Address" /></th>
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${clientGroupInstanceList}" status="i" var="clientGroupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clientGroupInstance.id}">${fieldValue(bean: clientGroupInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "accountType")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: clientGroupInstance, field: "address")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${clientGroupInstanceTotal}">
			<bs:paginate total="${clientGroupInstanceTotal}" />
		</g:if>
	</div>
</section>
