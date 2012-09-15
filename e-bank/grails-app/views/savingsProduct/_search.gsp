<%@ page import="zw.co.quantum.legend.model.SavingsProduct" %>
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

</div>
