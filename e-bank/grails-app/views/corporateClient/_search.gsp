<%@ page import="zw.co.quantum.legend.model.Branch" %>
<%@ page import="zw.co.quantum.legend.model.CorporateClient" %>
 
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
		<label for="name" class="control-label">
			Name
		</label>
		<div class="controls">
			<g:textField name="name" />
		</div>
	</div>
	
</div>
