<%@ page import="zw.co.quantum.legend.model.Branch" %>
<%@ page import="zw.co.quantum.legend.model.SystemAccount" %>
 
<div class="form-horizontal">
	<div class="control-group" class="control-label">
		<label for="branch">
			<g:message code="user.branch.label" default="Branch" />
		</label>
		<div class="controls">
			<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" 
					optionKey="id" noSelection="['':'--Select--']"/>
		</div>
	</div>
	
	<div class="control-group">
		<label for="type" class="control-label">
			Type
		</label>
		<div class="controls">
			<g:select name="type" from="${SystemAccount.constraints.type.inList}" 
					noSelection="['':'--Select--']"/>		
		</div>
	</div>
	
	<div class="control-group">
		<label for="accountNumber" class="control-label">
			Account Number
		</label>
		<div class="controls">
			<g:textField name="accountNumber" />
		</div>
	</div>
</div>
