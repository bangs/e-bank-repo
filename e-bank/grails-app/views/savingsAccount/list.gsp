
<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:javascript library="jquery"></g:javascript>
	<g:set var="entityName" value="${message(code: 'savingsAccount.label', default: 'SavingsAccount')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			<g:formRemote name="searchForm" url="[action:'search']" update="search-results">
				<g:render template="search"></g:render>
				<fieldset class="buttons">
					<g:actionSubmit value="Submit Query" class="edit" action="search"/>
				</fieldset>
			</g:formRemote>
		</div>
		<div id="search-results">
			<g:render template="listbody"></g:render>
		</div>		
		
</body>

</html>
