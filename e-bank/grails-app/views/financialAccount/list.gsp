
<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'financialAccount.label', default: 'FinancialAccount')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
	<g:render template="list"></g:render>

</body>

</html>
