
<%@ page import="zw.co.quantum.legend.model.Penalty" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penalty.label', default: 'Penalty')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.appliesTo.label" default="Applies To" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "appliesTo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.gracePeriodType.label" default="Grace Period Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "gracePeriodType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.gracePeriodDuration.label" default="Grace Period Duration" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "gracePeriodDuration")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.minCumulativeLimit.label" default="Min Cumulative Limit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "minCumulativeLimit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.maxCumulativeLimit.label" default="Max Cumulative Limit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "maxCumulativeLimit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.frequency.label" default="Frequency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "frequency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.gLCode.label" default="GL Code" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${penaltyInstance?.gLCode?.id}">${penaltyInstance?.gLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penaltyInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${penaltyInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${penaltyInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penalty.appliedPenalties.label" default="Applied Penalties" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${penaltyInstance.appliedPenalties}" var="a">
						<li><g:link controller="appliedPenalty" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${penaltyInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
