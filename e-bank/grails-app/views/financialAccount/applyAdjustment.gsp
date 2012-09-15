<%@ page import="zw.co.quantum.legend.model.FinancialAccount" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'financialAccount.label', default: 'FinancialAccount')}" />
	<title>Make Adjustment</title>
</head>

<body>

<section id="create" class="first">

	<g:form action="postAdjustment" class="form-horizontal" >
				
							<div class="control-group">
								<label for="transactionDate" class="control-label">Transaction Date</label>
				            	<div class="controls">
									<g:datePicker name="transactionDate" precision="day" default="${ new Date() }"  />
								</div>
							</div>
				
							<div class="control-group">
								<label for="amount" class="control-label">Amount</label>
				            	<div class="controls">
									<g:textField name="amount" />
								</div>
							</div>
				
							<div class="control-group">
								<label for="debitAccount" class="control-label">Debit Account</label>
				            	<div class="controls">
									<g:textField name="debitAccount" />
								</div>
							</div>
				
							<div class="control-group">
								<label for="creditAccount" class="control-label">Credit Account</label>
				            	<div class="controls">
									<g:textField name="creditAccount" />
								</div>
							</div>
							
							<div class="control-group">
								<label for="narrative" class="control-label">Narrative</label>
				            	<div class="controls">
									<g:textField name="narrative" />
								</div>
							</div>
				
		<div class="form-actions">
			<g:submitButton name="create" class="save btn-primary" value="Save" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
