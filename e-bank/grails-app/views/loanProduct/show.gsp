
<%@ page import="zw.co.quantum.legend.model.LoanProduct" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanProduct.label', default: 'LoanProduct')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.shortName.label" default="Short Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "shortName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.category.label" default="Category" /></td>
				
				<td valign="top" class="value"><g:link controller="productCategory" action="show" id="${loanProductInstance?.category?.id}">${loanProductInstance?.category?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.startDate.label" default="Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanProductInstance?.startDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.endDate.label" default="End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanProductInstance?.endDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.applicableFor.label" default="Applicable For" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "applicableFor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.minLoanAmount.label" default="Min Loan Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "minLoanAmount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.defaultLoanAmount.label" default="Default Loan Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "defaultLoanAmount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.maxLoanAmount.label" default="Max Loan Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "maxLoanAmount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.interestRateType.label" default="Interest Rate Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "interestRateType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.minInterestRate.label" default="Min Interest Rate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "minInterestRate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.defaultInterestRate.label" default="Default Interest Rate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "defaultInterestRate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.maxInterestRate.label" default="Max Interest Rate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "maxInterestRate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.frequencyOfInstallments.label" default="Frequency Of Installments" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "frequencyOfInstallments")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.recurInstallmentEvery.label" default="Recur Installment Every" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "recurInstallmentEvery")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.gracePeriodType.label" default="Grace Period Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "gracePeriodType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.gracePeriodDuration.label" default="Grace Period Duration" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "gracePeriodDuration")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.interestGLCode.label" default="Interest GLC ode" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${loanProductInstance?.interestGLCode?.id}">${loanProductInstance?.interestGLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.principalGLCode.label" default="Principal GLC ode" /></td>
				
				<td valign="top" class="value"><g:link controller="GLCode" action="show" id="${loanProductInstance?.principalGLCode?.id}">${loanProductInstance?.principalGLCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.canWaiveInterestOnLoanRepayment.label" default="Can Waive Interest On Loan Repayment" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${loanProductInstance?.canWaiveInterestOnLoanRepayment}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.compareWithCashFlow.label" default="Compare With Cash Flow" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${loanProductInstance?.compareWithCashFlow}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.fixedRepaymentSchedule.label" default="Fixed Repayment Schedule" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${loanProductInstance?.fixedRepaymentSchedule}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.includeInLoanCycleCounter.label" default="Include In Loan Cycle Counter" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${loanProductInstance?.includeInLoanCycleCounter}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanProductInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanProductInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanProduct.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanProductInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${loanProductInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</g:form>
	</div>
</section>

</body>

</html>
