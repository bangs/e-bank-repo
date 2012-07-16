

<%@ page import="zw.co.quantum.legend.model.IndividualClient" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'individualClient.label', default: 'IndividualClient')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${individualClientInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${individualClientInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${individualClientInstance?.id}" />
		<g:hiddenField name="version" value="${individualClientInstance?.version}" />
									
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'salutation', 'error')}">
							<label for="salutation"><g:message code="individualClient.salutation.label" default="Salutation" /></label>
							<div class="controls">
								<g:select name="salutation" from="${individualClientInstance.constraints.salutation.inList}" value="${individualClientInstance?.salutation}" valueMessagePrefix="individualClient.salutation"  />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'salutation', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'lastName', 'error')}">
							<label for="lastName"><g:message code="individualClient.lastName.label" default="Last Name" /></label>
							<div class="controls">
								<g:textField name="lastName" maxlength="60" value="${individualClientInstance?.lastName}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'lastName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'firstName', 'error')}">
							<label for="firstName"><g:message code="individualClient.firstName.label" default="First Name" /></label>
							<div class="controls">
								<g:textField name="firstName" maxlength="60" value="${individualClientInstance?.firstName}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'firstName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'dateOfBirth', 'error')}">
							<label for="dateOfBirth"><g:message code="individualClient.dateOfBirth.label" default="Date Of Birth" /></label>
							<div class="controls">
								<g:datePicker name="dateOfBirth" precision="day" value="${individualClientInstance?.dateOfBirth}"  />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'dateOfBirth', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'maritalStatus', 'error')}">
							<label for="maritalStatus"><g:message code="individualClient.maritalStatus.label" default="Marital Status" /></label>
							<div class="controls">
								<g:select name="maritalStatus" from="${individualClientInstance.constraints.maritalStatus.inList}" value="${individualClientInstance?.maritalStatus}" valueMessagePrefix="individualClient.maritalStatus"  />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'maritalStatus', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'gender', 'error')}">
							<label for="gender"><g:message code="individualClient.gender.label" default="Gender" /></label>
							<div class="controls">
								<g:select name="gender" from="${individualClientInstance.constraints.gender.inList}" value="${individualClientInstance?.gender}" valueMessagePrefix="individualClient.gender"  />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'gender', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'nationalId', 'error')}">
							<label for="nationalId"><g:message code="individualClient.nationalId.label" default="National Id" /></label>
							<div class="controls">
								<g:textField name="nationalId" maxlength="20" value="${individualClientInstance?.nationalId}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'nationalId', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'citizenship', 'error')}">
							<label for="citizenship"><g:message code="individualClient.citizenship.label" default="Citizenship" /></label>
							<div class="controls">
								<g:textField name="citizenship" maxlength="50" value="${individualClientInstance?.citizenship}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'citizenship', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'mobile', 'error')}">
							<label for="mobile"><g:message code="individualClient.mobile.label" default="Mobile" /></label>
							<div class="controls">
								<g:textField name="mobile" maxlength="20" value="${individualClientInstance?.mobile}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'mobile', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'email', 'error')}">
							<label for="email"><g:message code="individualClient.email.label" default="Email" /></label>
							<div class="controls">
								<g:textField name="email" maxlength="120" value="${individualClientInstance?.email}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'email', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'companyName', 'error')}">
							<label for="companyName"><g:message code="individualClient.companyName.label" default="Company Name" /></label>
							<div class="controls">
								<g:textField name="companyName" maxlength="100" value="${individualClientInstance?.companyName}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'companyName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'nextOfKinName', 'error')}">
							<label for="nextOfKinName"><g:message code="individualClient.nextOfKinName.label" default="Next Of Kin Name" /></label>
							<div class="controls">
								<g:textField name="nextOfKinName" maxlength="100" value="${individualClientInstance?.nextOfKinName}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'nextOfKinName', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'status', 'error')}">
							<label for="status"><g:message code="individualClient.status.label" default="Status" /></label>
							<div class="controls">
								<g:select name="status" from="${individualClientInstance.constraints.status.inList}" value="${individualClientInstance?.status}" valueMessagePrefix="individualClient.status"  />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'status', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'photoPath', 'error')}">
							<label for="photoPath"><g:message code="individualClient.photoPath.label" default="Photo Path" /></label>
							<div class="controls">
								<g:textField name="photoPath" value="${individualClientInstance?.photoPath}" />
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'photoPath', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: individualClientInstance, field: 'groups', 'error')}">
							<label for="groups"><g:message code="individualClient.groups.label" default="Groups" /></label>
							<div class="controls">
								
								<span class="help-inline">${hasErrors(bean: individualClientInstance, field: 'groups', 'error')}</span>
							</div>
						</div>
				
		<div class="form-actions">
			<g:actionSubmit class="save btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
