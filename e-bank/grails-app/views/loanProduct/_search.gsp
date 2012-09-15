<%@ page import="zw.co.quantum.legend.model.LoanProduct" %>
<%@ page import="zw.co.quantum.legend.model.ProductCategory" %>

<div class="form-horizontal">
	<div class="control-group" class="control-label">
		<label for="category.id">
			<g:message code="loanProduct.category.label" default="Category" />
		</label>
		<div class="controls">
			<g:select name="category.id" from="${ProductCategory.list()}" 
					optionKey="id" noSelection="['':'--Select--']"/>
		</div>
	</div>
	<div class="control-group" class="control-label">
		<label for="interestRateType">
			Interest Rate Type
		</label>
		<div class="controls">
			<g:select name="interestRateType" from="${LoanProduct.constraints.interestRateType.inList}" 
					noSelection="['':'--Select--']"/>
		</div>
	</div>
	
	<div class="control-group">
		<label for="canWaiveInterest" class="control-label">
			Can Waive Interest
		</label>
		<div class="controls">
			<g:checkBox name="canWaiveInterest" />
		</div>
	</div>
</div>
