<%@ page import="zw.co.quantum.legend.model.Branch" %>

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
		<label for="username" class="control-label">
			<g:message code="user.username.label" default="Username" />
		</label>
		<div class="controls">
			<g:textField name="username" />
		</div>
	</div>
	
	<div class="control-group">
		<label for="lastName" class="control-label">
			<g:message code="user.lastName.label" default="Last Name" />
		</label>
		<div class="controls">
			<g:textField name="lastName" />
		</div>
	</div>
</div>
