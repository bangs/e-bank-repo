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
			
				<g:sortableColumn property="name" title="${message(code: 'loanProduct.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="shortName" title="${message(code: 'loanProduct.shortName.label', default: 'Short Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'loanProduct.description.label', default: 'Description')}" />
			
				<th><g:message code="loanProduct.category.label" default="Category" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${loanProductInstanceList}" status="i" var="loanProductInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${loanProductInstance.id}">${fieldValue(bean: loanProductInstance, field: "name")}</g:link></td>
									
				<td>${fieldValue(bean: loanProductInstance, field: "shortName")}</td>
			
				<td>${fieldValue(bean: loanProductInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: loanProductInstance, field: "category")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:if test="${loanProductInstanceTotal}">
			<bs:paginate total="${loanProductInstanceTotal}" />
		</g:if>
	</div>
</section>