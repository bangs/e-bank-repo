

<%@ page import="zw.co.quantum.legend.model.Settings" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settings.label', default: 'Settings')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create" class="first">

	<g:hasErrors bean="${settingsInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${settingsInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
				
			
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'startOfWeek', 'error')}">
								<label for="startOfWeek" class="control-label"><g:message code="settings.startOfWeek.label" default="Start Of Week" /></label>
				            	<div class="controls">
									<g:select name="startOfWeek" from="${settingsInstance.constraints.startOfWeek.inList}" value="${settingsInstance?.startOfWeek}" valueMessagePrefix="settings.startOfWeek"  />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'startOfWeek', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'offDays', 'error')}">
								<label for="offDays" class="control-label"><g:message code="settings.offDays.label" default="Off Days" /></label>
				            	<div class="controls">
									<g:select name="offDays" from="${settingsInstance.constraints.offDays.inList}" value="${settingsInstance?.offDays}" valueMessagePrefix="settings.offDays"  />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'offDays', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'baseCurrency', 'error')}">
								<label for="baseCurrency" class="control-label"><g:message code="settings.baseCurrency.label" default="Base Currency" /></label>
				            	<div class="controls">
									<g:select name="baseCurrency" from="${settingsInstance.constraints.baseCurrency.inList}" value="${settingsInstance?.baseCurrency}" valueMessagePrefix="settings.baseCurrency"  />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'baseCurrency', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'customCurrency', 'error')}">
								<label for="customCurrency" class="control-label"><g:message code="settings.customCurrency.label" default="Custom Currency" /></label>
				            	<div class="controls">
									<g:textField name="customCurrency" maxlength="5" value="${settingsInstance?.customCurrency}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'customCurrency', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'minimumInterest', 'error')}">
								<label for="minimumInterest" class="control-label"><g:message code="settings.minimumInterest.label" default="Minimum Interest" /></label>
				            	<div class="controls">
									<g:textField name="minimumInterest" value="${fieldValue(bean: settingsInstance, field: 'minimumInterest')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'minimumInterest', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'maximumInterest', 'error')}">
								<label for="maximumInterest" class="control-label"><g:message code="settings.maximumInterest.label" default="Maximum Interest" /></label>
				            	<div class="controls">
									<g:textField name="maximumInterest" value="${fieldValue(bean: settingsInstance, field: 'maximumInterest')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'maximumInterest', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'interestDays', 'error')}">
								<label for="interestDays" class="control-label"><g:message code="settings.interestDays.label" default="Interest Days" /></label>
				            	<div class="controls">
									<g:select name="interestDays" from="${settingsInstance.constraints.interestDays.inList}" value="${fieldValue(bean: settingsInstance, field: 'interestDays')}" valueMessagePrefix="settings.interestDays"  />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'interestDays', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'minimumIndebtnessRatio', 'error')}">
								<label for="minimumIndebtnessRatio" class="control-label"><g:message code="settings.minimumIndebtnessRatio.label" default="Minimum Indebtness Ratio" /></label>
				            	<div class="controls">
									<g:textField name="minimumIndebtnessRatio" value="${fieldValue(bean: settingsInstance, field: 'minimumIndebtnessRatio')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'minimumIndebtnessRatio', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'maximumIndebtnessRatio', 'error')}">
								<label for="maximumIndebtnessRatio" class="control-label"><g:message code="settings.maximumIndebtnessRatio.label" default="Maximum Indebtness Ratio" /></label>
				            	<div class="controls">
									<g:textField name="maximumIndebtnessRatio" value="${fieldValue(bean: settingsInstance, field: 'maximumIndebtnessRatio')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'maximumIndebtnessRatio', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'minimumNewClientAge', 'error')}">
								<label for="minimumNewClientAge" class="control-label"><g:message code="settings.minimumNewClientAge.label" default="Minimum New Client Age" /></label>
				            	<div class="controls">
									<g:textField name="minimumNewClientAge" value="${fieldValue(bean: settingsInstance, field: 'minimumNewClientAge')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'minimumNewClientAge', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'maximumNewClientAge', 'error')}">
								<label for="maximumNewClientAge" class="control-label"><g:message code="settings.maximumNewClientAge.label" default="Maximum New Client Age" /></label>
				            	<div class="controls">
									<g:textField name="maximumNewClientAge" value="${fieldValue(bean: settingsInstance, field: 'maximumNewClientAge')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'maximumNewClientAge', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'sessionTimeoutMinutes', 'error')}">
								<label for="sessionTimeoutMinutes" class="control-label"><g:message code="settings.sessionTimeoutMinutes.label" default="Session Timeout Minutes" /></label>
				            	<div class="controls">
									<g:select name="sessionTimeoutMinutes" from="${30..180}" value="${fieldValue(bean: settingsInstance, field: 'sessionTimeoutMinutes')}"  />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'sessionTimeoutMinutes', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'batchJobSize', 'error')}">
								<label for="batchJobSize" class="control-label"><g:message code="settings.batchJobSize.label" default="Batch Job Size" /></label>
				            	<div class="controls">
									<g:textField name="batchJobSize" value="${fieldValue(bean: settingsInstance, field: 'batchJobSize')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'batchJobSize', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'maxDisbursalLimit', 'error')}">
								<label for="maxDisbursalLimit" class="control-label"><g:message code="settings.maxDisbursalLimit.label" default="Max Disbursal Limit" /></label>
				            	<div class="controls">
									<g:textField name="maxDisbursalLimit" value="${fieldValue(bean: settingsInstance, field: 'maxDisbursalLimit')}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'maxDisbursalLimit', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'ageCheckEnabled', 'error')}">
								<label for="ageCheckEnabled" class="control-label"><g:message code="settings.ageCheckEnabled.label" default="Age Check Enabled" /></label>
				            	<div class="controls">
									<g:checkBox name="ageCheckEnabled" value="${settingsInstance?.ageCheckEnabled}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'ageCheckEnabled', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'allowInstallmentsAboveAmountDue', 'error')}">
								<label for="allowInstallmentsAboveAmountDue" class="control-label"><g:message code="settings.allowInstallmentsAboveAmountDue.label" default="Allow Installments Above Amount Due" /></label>
				            	<div class="controls">
									<g:checkBox name="allowInstallmentsAboveAmountDue" value="${settingsInstance?.allowInstallmentsAboveAmountDue}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'allowInstallmentsAboveAmountDue', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'allowInstallmentsBelowAmountDue', 'error')}">
								<label for="allowInstallmentsBelowAmountDue" class="control-label"><g:message code="settings.allowInstallmentsBelowAmountDue.label" default="Allow Installments Below Amount Due" /></label>
				            	<div class="controls">
									<g:checkBox name="allowInstallmentsBelowAmountDue" value="${settingsInstance?.allowInstallmentsBelowAmountDue}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'allowInstallmentsBelowAmountDue', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'groupLoansAllowed', 'error')}">
								<label for="groupLoansAllowed" class="control-label"><g:message code="settings.groupLoansAllowed.label" default="Group Loans Allowed" /></label>
				            	<div class="controls">
									<g:checkBox name="groupLoansAllowed" value="${settingsInstance?.groupLoansAllowed}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'groupLoansAllowed', 'error')}</span>
								</div>
							</div>
				
							<div class="control-group ${hasErrors(bean: settingsInstance, field: 'uploadStorageDirectory', 'error')}">
								<label for="uploadStorageDirectory" class="control-label"><g:message code="settings.uploadStorageDirectory.label" default="Upload Storage Directory" /></label>
				            	<div class="controls">
									<g:textField name="uploadStorageDirectory" value="${settingsInstance?.uploadStorageDirectory}" />
									<span class="help-inline">${hasErrors(bean: settingsInstance, field: 'uploadStorageDirectory', 'error')}</span>
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
