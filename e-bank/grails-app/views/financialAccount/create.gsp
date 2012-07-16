

<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'financialAccount.label', default: 'FinancialAccount')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${financialAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${financialAccountInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="next" class="form-horizontal" >
							<div class="control-group">
								<g:render template="client"></g:render>
							</div>
							
							<div class="control-group">
								<label for="superType" class="control-label" style="font-weight: bold;">Select Account Type</label>
				            	<div class="controls">
									<g:select name="superType" from="${FinancialAccount.constraints.superType.inList}" value="${financialAccountInstance?.superType}" valueMessagePrefix="financialAccount.superType"  />
									<span class="help-inline">${hasErrors(bean: financialAccountInstance, field: 'superType', 'error')}</span>
								</div>
							</div>
				<br/>
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="Next" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
