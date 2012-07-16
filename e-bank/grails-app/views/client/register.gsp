<%@ page import="zw.co.quantum.legend.model.Client" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title>Client Registration</title>
</head>

<body>

<section id="create" class="first">
	
	<g:form action="next" class="form-horizontal" >
				
		<div class="control-group">
			<label for="type" class="control-label"><g:message code="client.type.label" default="Type" /></label>
			<div class="controls">
				<g:select name="type" from="${Client.constraints.type.inList}" valueMessagePrefix="client.type"  />
			</div>
		</div>
					
		<div class="form-actions">
			<g:submitButton name="next" class="save btn-primary" value="Next" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
