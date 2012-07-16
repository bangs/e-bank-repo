

<%@ page import="zw.co.quantum.legend.auth.User" %>
<%@ page import="zw.co.quantum.legend.auth.Role" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${userInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'branch', 'error')}">
								<label for="branch" class="control-label"><g:message code="user.branch.label" default="Branch" /></label>
				            	<div class="controls">
									<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" 
										optionKey="id" value="${userInstance?.branch?.id}"  noSelection="['':'--Select--']"/>
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'branch', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'lastName', 'error')}">
								<label for="lastName" class="control-label"><g:message code="user.lastName.label" default="Last Name" /></label>
				            	<div class="controls">
									<g:textField name="lastName" maxlength="30" value="${userInstance?.lastName}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'lastName', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'firstName', 'error')}">
								<label for="firstName" class="control-label"><g:message code="user.firstName.label" default="First Name" /></label>
				            	<div class="controls">
									<g:textField name="firstName" maxlength="30" value="${userInstance?.firstName}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'firstName', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'username', 'error')}">
								<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /></label>
				            	<div class="controls">
									<g:textField name="username" value="${userInstance?.username}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')}">
								<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /></label>
				            	<div class="controls">
									<g:passwordField name="password" value="${userInstance?.password}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}">
								<label for="accountExpired" class="control-label"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
				            	<div class="controls">
									<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}">
								<label for="accountLocked" class="control-label"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
				            	<div class="controls">
									<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')}">
								<label for="enabled" class="control-label"><g:message code="user.enabled.label" default="Enabled" /></label>
				            	<div class="controls">
									<g:checkBox name="enabled" value="${userInstance?.enabled}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'enabled', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}">
								<label for="passwordExpired" class="control-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
				            	<div class="controls">
									<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
									<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}</span>
								</div>
							</div>
							
							<div class="control-group ${hasErrors(bean: userInstance, field: 'userRoles', 'error')}">
								<label for="userRoles"><g:message code="user.userRoles.label" default="User Roles" /></label>
								<div class="controls">
									
									<ul>
									<g:each in="${Role.list()}" var="r">
									    <li><g:checkBox name="roles" value="${r.authority}" checked="false"/>${r.authority.replace('ROLE_', '') }</li>
									</g:each>
									</ul> 
	
								</div>
							</div>
				
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
