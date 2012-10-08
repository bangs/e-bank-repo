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
			
				<g:sortableColumn property="name" title="${message(code: 'corporateClient.name.label', default: 'Name')}" />
						
				<th><g:message code="corporateClient.address.label" default="Address" /></th>
		
				<g:sortableColumn property="mobile" title="${message(code: 'corporateClient.mobile.label', default: 'Mobile')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'corporateClient.email.label', default: 'Email')}" />
								
			</tr>
		</thead>
		<tbody>
		<g:each in="${corporateClientInstanceList}" status="i" var="corporateClientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${corporateClientInstance.id}">${fieldValue(bean: corporateClientInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: corporateClientInstance, field: "address")}</td>
						
				<td>${fieldValue(bean: corporateClientInstance, field: "mobile")}</td>
			
				<td>${fieldValue(bean: corporateClientInstance, field: "email")}</td>
									
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${corporateClientInstanceTotal}">
			<bs:paginate total="${corporateClientInstanceTotal}" />
		</g:if>
	</div>
</section>