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
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'loanAccount.accountNumber.label', default: 'Account Number')}" />
			
				<g:sortableColumn property="accountName" title="${message(code: 'loanAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="loanAccount.branch.label" default="Branch" /></th>
						
				<g:sortableColumn property="type" title="${message(code: 'loanAccount.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'loanAccount.status.label', default: 'Status')}" />
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${loanAccountInstanceList}" status="i" var="loanAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${loanAccountInstance.id}">${fieldValue(bean: loanAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "branch")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: loanAccountInstance, field: "status")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${loanAccountInstanceTotal}">
			<bs:paginate total="${loanAccountInstanceTotal}" />
		</g:if>
	</div>
</section>