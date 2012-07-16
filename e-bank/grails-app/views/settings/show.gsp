
<%@ page import="zw.co.quantum.legend.model.Settings" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settings.label', default: 'Settings')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.startOfWeek.label" default="Start Of Week" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "startOfWeek")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.offDays.label" default="Off Days" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "offDays")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.baseCurrency.label" default="Base Currency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "baseCurrency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.customCurrency.label" default="Custom Currency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "customCurrency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.minimumInterest.label" default="Minimum Interest" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "minimumInterest")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.maximumInterest.label" default="Maximum Interest" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "maximumInterest")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.interestDays.label" default="Interest Days" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "interestDays")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.minimumIndebtnessRatio.label" default="Minimum Indebtness Ratio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "minimumIndebtnessRatio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.maximumIndebtnessRatio.label" default="Maximum Indebtness Ratio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "maximumIndebtnessRatio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.minimumNewClientAge.label" default="Minimum New Client Age" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "minimumNewClientAge")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.maximumNewClientAge.label" default="Maximum New Client Age" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "maximumNewClientAge")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.sessionTimeoutMinutes.label" default="Session Timeout Minutes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "sessionTimeoutMinutes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.batchJobSize.label" default="Batch Job Size" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "batchJobSize")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.maxDisbursalLimit.label" default="Max Disbursal Limit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "maxDisbursalLimit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${settingsInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${settingsInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.ageCheckEnabled.label" default="Age Check Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${settingsInstance?.ageCheckEnabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.allowInstallmentsAboveAmountDue.label" default="Allow Installments Above Amount Due" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${settingsInstance?.allowInstallmentsAboveAmountDue}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.allowInstallmentsBelowAmountDue.label" default="Allow Installments Below Amount Due" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${settingsInstance?.allowInstallmentsBelowAmountDue}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.groupLoansAllowed.label" default="Group Loans Allowed" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${settingsInstance?.groupLoansAllowed}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settings.uploadStorageDirectory.label" default="Upload Storage Directory" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settingsInstance, field: "uploadStorageDirectory")}</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${settingsInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
