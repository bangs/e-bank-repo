<%@ page import="zw.co.quantum.legend.model.SavingsAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'savingsAccount.label', default: 'SavingsAccount')}" />
	<title>Capture Transaction</title>
</head>

<body>

<section id="create" class="first">

	<g:form action="postTransaction" class="form-horizontal" >
				
							<div class="control-group">
								<label for="transactionDate" class="control-label">Transaction Date</label>
				            	<div class="controls">
									<g:datePicker name="transactionDate" precision="day" default="${ new Date() }"  />
								</div>
							</div>
				
							<div class="control-group">
								<label for="transactionType" class="control-label">Transaction Type</label>
				            	<div class="controls">
									<g:select name="transactionType" from="['DEPOSIT', 'WITHDRAWAL']"/>
								</div>
							</div>
				
							<div class="control-group">
								<label for="amount" class="control-label">Amount</label>
				            	<div class="controls">
									<g:textField name="amount" />
								</div>
							</div>
				
							<div class="control-group">
								<label for="paymentType" class="control-label">Mode Of Transaction</label>
				            	<div class="controls">
									<g:select name="paymentType" from="${zw.co.quantum.legend.model.PaymentType.list()}" optionKey="name" optionValue="name" />
								</div>
							</div>
				
		<div class="form-actions">
			<g:hiddenField name="id" value="${savingsAccountInstance?.id}" />
			<g:submitButton name="create" class="save btn-primary" value="Save" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
