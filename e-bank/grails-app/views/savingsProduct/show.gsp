
<%@ page import="zw.co.quantum.legend.model.SavingsProduct" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsProduct.label', default: 'SavingsProduct')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.shortName.label" default="Short Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "shortName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.category.label" default="Category" /></td>
				
				<td valign="top" class="value"><g:link controller="productCategory" action="show" id="${savingsProductInstance?.category?.id}">${savingsProductInstance?.category?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.startDate.label" default="Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsProductInstance?.startDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.endDate.label" default="End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsProductInstance?.endDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.applicableFor.label" default="Applicable For" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "applicableFor")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.typeOfDeposits.label" default="Type Of Deposits" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "typeOfDeposits")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.recommendedDepositAmount.label" default="Recommended Deposit Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "recommendedDepositAmount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.maxAmountPerWithdrawal.label" default="Max Amount Per Withdrawal" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "maxAmountPerWithdrawal")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.interestRate.label" default="Interest Rate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "interestRate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.interestCalculationBalance.label" default="Interest Calculation Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "interestCalculationBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.interestCalculationTimePeriod.label" default="Interest Calculation Time Period" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "interestCalculationTimePeriod")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.interestPostingFrequency.label" default="Interest Posting Frequency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "interestPostingFrequency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.minInterestCalculationBalance.label" default="Min Interest Calculation Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "minInterestCalculationBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.depositGLCode.label" default="Deposit GLC ode" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${savingsProductInstance?.depositGLCode?.id}">${savingsProductInstance?.depositGLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.interestGLCode.label" default="Interest GLC ode" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${savingsProductInstance?.interestGLCode?.id}">${savingsProductInstance?.interestGLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: savingsProductInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsProductInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="savingsProduct.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${savingsProductInstance?.lastUpdated}" /></td>
				
			</tr>
				
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${savingsProductInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
