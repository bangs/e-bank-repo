<%@ page import="zw.co.quantum.legend.model.Branch" %>
<%@ page import="zw.co.quantum.legend.model.IndividualClient" %>
 
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
		<label for="lastName" class="control-label">
			Lastname
		</label>
		<div class="controls">
			<g:textField name="lastName" />
		</div>
	</div>
	
	<div class="control-group">
		<label for="firstName" class="control-label">
			Firstname
		</label>
		<div class="controls">
			<g:textField name="firstName" />
		</div>
	</div>
	
</div>
