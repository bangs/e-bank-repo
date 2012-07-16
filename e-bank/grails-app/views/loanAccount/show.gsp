
<%@ page import="zw.co.quantum.legend.model.LoanAccount" %>
<%@ page import="zw.co.quantum.legend.util.Constants" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'loanAccount.label', default: 'LoanAccount')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show" class="first">

	<table class="table">
		<tbody>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.accountName.label" default="Account Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "accountName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.accountNumber.label" default="Account Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "accountNumber")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.branch.label" default="Branch" /></td>
				
				<td valign="top" class="value"><g:link controller="branch" action="show" id="${loanAccountInstance?.branch?.id}">${loanAccountInstance?.branch?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.product.label" default="Product" /></td>
				
				<td valign="top" class="value"><g:link controller="loanProduct" action="show" id="${loanAccountInstance?.product?.id}">${loanAccountInstance?.product?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.loanOfficer.label" default="Loan Officer" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${loanAccountInstance?.loanOfficer?.id}">${loanAccountInstance?.loanOfficer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.groupAccountType.label" default="Group Account Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "groupAccountType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.amount.label" default="Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "amount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.interestRate.label" default="Interest Rate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "interestRate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.numOfInstallments.label" default="Num Of Installments" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "numOfInstallments")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.repaymentsGracePeriod.label" default="Repayments Grace Period" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "repaymentsGracePeriod")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.disbursalDate.label" default="Disbursal Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanAccountInstance?.disbursalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.sourceOfFunds.label" default="Source Of Funds" /></td>
				
				<td valign="top" class="value"><g:link controller="fund" action="show" id="${loanAccountInstance?.sourceOfFunds?.id}">${loanAccountInstance?.sourceOfFunds?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.purposeOfLoan.label" default="Purpose Of Loan" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "purposeOfLoan")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.collateralType.label" default="Collateral Type" /></td>
				
				<td valign="top" class="value"><g:link controller="collateralType" action="show" id="${loanAccountInstance?.collateralType?.id}">${loanAccountInstance?.collateralType?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.collateralNotes.label" default="Collateral Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "collateralNotes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.guarantorDetails.label" default="Guarantor Details" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "guarantorDetails")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.externalId.label" default="External Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "externalId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.standing.label" default="Standing" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "standing")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: loanAccountInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanAccountInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="loanAccount.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${loanAccountInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
	<div class="buttons">
		<g:form>
			<g:hiddenField name="id" value="${loanAccountInstance?.id}" />
			<span class="button"><g:actionSubmit class="edit btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
			<g:if test="${ Constants.STATUS_PENDING_APPROVAL.equals(loanAccountInstance?.status) }">
				<span class="button"><g:actionSubmit class="edit btn-secondary" action="approve" value="Approve" /></span>
			</g:if>
			<g:if test="${ Constants.STATUS_PENDING_DISBURSEMENT.equals(loanAccountInstance?.status) }">
				<span class="button"><g:actionSubmit class="edit btn-secondary" action="disburseLoan" value="Disburse" /></span>
			</g:if>
		</g:form>
	</div>
</section>

</body>

</html>
