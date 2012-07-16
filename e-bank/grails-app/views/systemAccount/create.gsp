

<%@ page import="zw.co.quantum.legend.model.SystemAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:javascript library="jquery"></g:javascript>
	<g:set var="entityName" value="${message(code: 'systemAccount.label', default: 'SystemAccount')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${systemAccountInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${systemAccountInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
							
							<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'accountNumber', 'error')}">
								<label for="accountNumber" class="control-label"><g:message code="systemAccount.accountNumber.label" default="Account Number" /></label>
				            	<div class="controls">
									<g:textField name="accountNumber" maxlength="30" value="${systemAccountInstance?.accountNumber}" />
									<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'accountNumber', 'error')}</span>
								</div>
							</div>
							
							<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'type', 'error')}">
								<label for="type" class="control-label"><g:message code="systemAccount.type.label" default="Type" /></label>
				            	<div class="controls">
									<g:select name="type" from="${systemAccountInstance.constraints.type.inList}" value="${systemAccountInstance?.type}" valueMessagePrefix="systemAccount.type"  />
									<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'type', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: systemAccountInstance, field: 'description', 'error')}">
								<label for="description" class="control-label"><g:message code="systemAccount.description.label" default="Description" /></label>
				            	<div class="controls">
									<g:textField name="description" value="${systemAccountInstance?.description}" />
									<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'description', 'error')}</span>
								</div>
							</div>
							
							<div class="control-group">
								<label for="type" class="control-label"><g:message code="systemAccount.ownerType.label" default="Owner Type" /></label>
				            	<div class="controls">
									<g:select name="ownerType" from="['INSTITUTION', 'BRANCH']" value="${systemAccountInstance?.ownerType}" valueMessagePrefix="systemAccount.ownerType"  
										onChange="${remoteFunction(action:'processOwnerTypeValueChange', params:'\'ownerType=\' + this.value', update:'owner_select')}"
										noSelection="['':'--Select--']" />
									<span class="help-inline">${hasErrors(bean: systemAccountInstance, field: 'ownerType', 'error')}</span>
								</div>
							</div>
							
							<div id="owner_select"></div>
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
