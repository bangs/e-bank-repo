<%@ page import="zw.co.quantum.legend.model.IndividualClient" %>



<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="individualClient.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${individualClientInstance.constraints.type.inList}" value="${individualClientInstance?.type}" valueMessagePrefix="individualClient.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="individualClient.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" maxlength="20" value="${individualClientInstance?.mobile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="individualClient.email.label" default="Email" />
		
	</label>
	<g:textField name="email" maxlength="120" value="${individualClientInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="individualClient.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="address.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${individualClientInstance?.address?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'registeredBy', 'error')} required">
	<label for="registeredBy">
		<g:message code="individualClient.registeredBy.label" default="Registered By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="registeredBy.id" from="${zw.co.quantum.legend.auth.User.list()}" optionKey="id" value="${individualClientInstance?.registeredBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="individualClient.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" optionKey="id" value="${individualClientInstance?.branch?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="individualClient.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${individualClientInstance.constraints.status.inList}" value="${individualClientInstance?.status}" valueMessagePrefix="individualClient.status"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'salutation', 'error')} required">
	<label for="salutation">
		<g:message code="individualClient.salutation.label" default="Salutation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="salutation" from="${individualClientInstance.constraints.salutation.inList}" value="${individualClientInstance?.salutation}" valueMessagePrefix="individualClient.salutation"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="individualClient.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="60" value="${individualClientInstance?.lastName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="individualClient.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="60" value="${individualClientInstance?.firstName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="individualClient.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day" value="${individualClientInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="individualClient.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${individualClientInstance.constraints.maritalStatus.inList}" value="${individualClientInstance?.maritalStatus}" valueMessagePrefix="individualClient.maritalStatus"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="individualClient.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${individualClientInstance.constraints.gender.inList}" value="${individualClientInstance?.gender}" valueMessagePrefix="individualClient.gender"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'nationalId', 'error')} required">
	<label for="nationalId">
		<g:message code="individualClient.nationalId.label" default="National Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nationalId" maxlength="20" value="${individualClientInstance?.nationalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'citizenship', 'error')} required">
	<label for="citizenship">
		<g:message code="individualClient.citizenship.label" default="Citizenship" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="citizenship" maxlength="50" value="${individualClientInstance?.citizenship}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'companyName', 'error')} required">
	<label for="companyName">
		<g:message code="individualClient.companyName.label" default="Company Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyName" maxlength="100" value="${individualClientInstance?.companyName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'companyAddress', 'error')} required">
	<label for="companyAddress">
		<g:message code="individualClient.companyAddress.label" default="Company Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="companyAddress.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${individualClientInstance?.companyAddress?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'nextOfKinName', 'error')} required">
	<label for="nextOfKinName">
		<g:message code="individualClient.nextOfKinName.label" default="Next Of Kin Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nextOfKinName" maxlength="100" value="${individualClientInstance?.nextOfKinName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'nextOfKinAddress', 'error')} required">
	<label for="nextOfKinAddress">
		<g:message code="individualClient.nextOfKinAddress.label" default="Next Of Kin Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nextOfKinAddress.id" from="${zw.co.quantum.legend.model.Address.list()}" optionKey="id" value="${individualClientInstance?.nextOfKinAddress?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'photoPath', 'error')} ">
	<label for="photoPath">
		<g:message code="individualClient.photoPath.label" default="Photo Path" />
		
	</label>
	<g:textField name="photoPath" value="${individualClientInstance?.photoPath}" />
</div>

<div class="fieldcontain ${hasErrors(bean: individualClientInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="individualClient.groups.label" default="Groups" />
		
	</label>
	
</div>

