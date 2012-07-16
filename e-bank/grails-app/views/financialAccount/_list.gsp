<section id="list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="accountNumber" title="${message(code: 'financialAccount.accountNumber.label', default: 'Account Number')}" />

				<g:sortableColumn property="accountName" title="${message(code: 'financialAccount.accountName.label', default: 'Account Name')}" />
			
				<th><g:message code="financialAccount.branch.label" default="Branch" /></th>
			
				<g:sortableColumn property="superType" title="Account Type" />
				
				<g:sortableColumn property="ownerType" title="Owner Type" />
				
			</tr>
		</thead>
		<tbody>
		<g:each in="${financialAccountInstanceList}" status="i" var="financialAccountInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${financialAccountInstance.id}">${fieldValue(bean: financialAccountInstance, field: "accountNumber")}</g:link></td>
			
				<td>${fieldValue(bean: financialAccountInstance, field: "accountName")}</td>
			
				<td>${fieldValue(bean: financialAccountInstance, field: "branch")}</td>
						
				<td>${fieldValue(bean: financialAccountInstance, field: "superType")}</td>
				
				<td>${fieldValue(bean: financialAccountInstance, field: "ownerType")}</td>
						
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${financialAccountInstanceTotal}">
			<bs:paginate total="${financialAccountInstanceTotal}" />
		</g:if>
	</div>
</section>