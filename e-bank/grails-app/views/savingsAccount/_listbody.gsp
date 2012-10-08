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
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'savingsAccount.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="accountName" title="${message(code: 'savingsAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="savingsAccount.branch.label" default="Branch" /></th>
						
				<g:sortableColumn property="type" title="${message(code: 'savingsAccount.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'savingsAccount.status.label', default: 'Status')}" />
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${savingsAccountInstanceList}" status="i" var="savingsAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${savingsAccountInstance.id}">${fieldValue(bean: savingsAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: savingsAccountInstance, field: "status")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${savingsAccountInstanceTotal}">
			<bs:paginate total="${savingsAccountInstanceTotal}" />
		</g:if>
	</div>
</section>