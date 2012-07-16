<%@ page import="zw.co.quantum.legend.model.Settings" %>



<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="settings.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" optionKey="id" value="${settingsInstance?.institution?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'startOfWeek', 'error')} ">
	<label for="startOfWeek">
		<g:message code="settings.startOfWeek.label" default="Start Of Week" />
		
	</label>
	<g:select name="startOfWeek" from="${settingsInstance.constraints.startOfWeek.inList}" value="${settingsInstance?.startOfWeek}" valueMessagePrefix="settings.startOfWeek"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'offDays', 'error')} ">
	<label for="offDays">
		<g:message code="settings.offDays.label" default="Off Days" />
		
	</label>
	<g:select name="offDays" from="${settingsInstance.constraints.offDays.inList}" value="${settingsInstance?.offDays}" valueMessagePrefix="settings.offDays"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'baseCurrency', 'error')} ">
	<label for="baseCurrency">
		<g:message code="settings.baseCurrency.label" default="Base Currency" />
		
	</label>
	<g:select name="baseCurrency" from="${settingsInstance.constraints.baseCurrency.inList}" value="${settingsInstance?.baseCurrency}" valueMessagePrefix="settings.baseCurrency"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'customCurrency', 'error')} ">
	<label for="customCurrency">
		<g:message code="settings.customCurrency.label" default="Custom Currency" />
		
	</label>
	<g:textField name="customCurrency" maxlength="5" value="${settingsInstance?.customCurrency}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'minimumInterest', 'error')} required">
	<label for="minimumInterest">
		<g:message code="settings.minimumInterest.label" default="Minimum Interest" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minimumInterest" value="${fieldValue(bean: settingsInstance, field: 'minimumInterest')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'maximumInterest', 'error')} required">
	<label for="maximumInterest">
		<g:message code="settings.maximumInterest.label" default="Maximum Interest" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maximumInterest" value="${fieldValue(bean: settingsInstance, field: 'maximumInterest')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'interestDays', 'error')} required">
	<label for="interestDays">
		<g:message code="settings.interestDays.label" default="Interest Days" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="interestDays" from="${settingsInstance.constraints.interestDays.inList}" value="${fieldValue(bean: settingsInstance, field: 'interestDays')}" valueMessagePrefix="settings.interestDays"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'minimumIndebtnessRatio', 'error')} required">
	<label for="minimumIndebtnessRatio">
		<g:message code="settings.minimumIndebtnessRatio.label" default="Minimum Indebtness Ratio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minimumIndebtnessRatio" value="${fieldValue(bean: settingsInstance, field: 'minimumIndebtnessRatio')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'maximumIndebtnessRatio', 'error')} required">
	<label for="maximumIndebtnessRatio">
		<g:message code="settings.maximumIndebtnessRatio.label" default="Maximum Indebtness Ratio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maximumIndebtnessRatio" value="${fieldValue(bean: settingsInstance, field: 'maximumIndebtnessRatio')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'minimumNewClientAge', 'error')} required">
	<label for="minimumNewClientAge">
		<g:message code="settings.minimumNewClientAge.label" default="Minimum New Client Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minimumNewClientAge" value="${fieldValue(bean: settingsInstance, field: 'minimumNewClientAge')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'maximumNewClientAge', 'error')} required">
	<label for="maximumNewClientAge">
		<g:message code="settings.maximumNewClientAge.label" default="Maximum New Client Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maximumNewClientAge" value="${fieldValue(bean: settingsInstance, field: 'maximumNewClientAge')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'sessionTimeoutMinutes', 'error')} required">
	<label for="sessionTimeoutMinutes">
		<g:message code="settings.sessionTimeoutMinutes.label" default="Session Timeout Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sessionTimeoutMinutes" from="${30..180}" value="${fieldValue(bean: settingsInstance, field: 'sessionTimeoutMinutes')}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'batchJobSize', 'error')} required">
	<label for="batchJobSize">
		<g:message code="settings.batchJobSize.label" default="Batch Job Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="batchJobSize" value="${fieldValue(bean: settingsInstance, field: 'batchJobSize')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'maxDisbursalLimit', 'error')} required">
	<label for="maxDisbursalLimit">
		<g:message code="settings.maxDisbursalLimit.label" default="Max Disbursal Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxDisbursalLimit" value="${fieldValue(bean: settingsInstance, field: 'maxDisbursalLimit')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'ageCheckEnabled', 'error')} ">
	<label for="ageCheckEnabled">
		<g:message code="settings.ageCheckEnabled.label" default="Age Check Enabled" />
		
	</label>
	<g:checkBox name="ageCheckEnabled" value="${settingsInstance?.ageCheckEnabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'allowInstallmentsAboveAmountDue', 'error')} ">
	<label for="allowInstallmentsAboveAmountDue">
		<g:message code="settings.allowInstallmentsAboveAmountDue.label" default="Allow Installments Above Amount Due" />
		
	</label>
	<g:checkBox name="allowInstallmentsAboveAmountDue" value="${settingsInstance?.allowInstallmentsAboveAmountDue}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'allowInstallmentsBelowAmountDue', 'error')} ">
	<label for="allowInstallmentsBelowAmountDue">
		<g:message code="settings.allowInstallmentsBelowAmountDue.label" default="Allow Installments Below Amount Due" />
		
	</label>
	<g:checkBox name="allowInstallmentsBelowAmountDue" value="${settingsInstance?.allowInstallmentsBelowAmountDue}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'groupLoansAllowed', 'error')} ">
	<label for="groupLoansAllowed">
		<g:message code="settings.groupLoansAllowed.label" default="Group Loans Allowed" />
		
	</label>
	<g:checkBox name="groupLoansAllowed" value="${settingsInstance?.groupLoansAllowed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: settingsInstance, field: 'uploadStorageDirectory', 'error')} ">
	<label for="uploadStorageDirectory">
		<g:message code="settings.uploadStorageDirectory.label" default="Upload Storage Directory" />
		
	</label>
	<g:textField name="uploadStorageDirectory" value="${settingsInstance?.uploadStorageDirectory}" />
</div>

