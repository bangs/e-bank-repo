<section id="list" class="first">
<h4>Search Results</h4>
<div class="messages">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
</div>		

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'systemAccount.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="accountName" title="${message(code: 'systemAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="systemAccount.branch.label" default="Branch" /></th>
						
				<g:sortableColumn property="type" title="${message(code: 'systemAccount.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'systemAccount.description.label', default: 'Description')}" />
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${systemAccountInstanceList}" status="i" var="systemAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${systemAccountInstance.id}">${fieldValue(bean: systemAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: systemAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: systemAccountInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: systemAccountInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: systemAccountInstance, field: "description")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${systemAccountInstanceTotal}">
			<bs:paginate total="${systemAccountInstanceTotal}" />
		</g:if>
	</div>
</section>