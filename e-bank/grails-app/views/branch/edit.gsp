

<%@ page import="zw.co.quantum.legend.model.Branch" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit" class="first">

	<g:hasErrors bean="${branchInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${branchInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${branchInstance?.id}" />
		<g:hiddenField name="version" value="${branchInstance?.version}" />
								
						<div class="control-group ${hasErrors(bean: branchInstance, field: 'name', 'error')}">
							<label for="name"><g:message code="branch.name.label" default="Name" /></label>
							<div class="controls">
								<g:textField name="name" maxlength="100" value="${branchInstance?.name}" />
								<span class="help-inline">${hasErrors(bean: branchInstance, field: 'name', 'error')}</span>
							</div>
						</div>
				
						<div class="control-group ${hasErrors(bean: branchInstance, field: 'code', 'error')}">
							<label for="code"><g:message code="branch.code.label" default="Code" /></label>
							<div class="controls">
								<g:textField name="code" maxlength="20" value="${branchInstance?.code}" />
								<span class="help-inline">${hasErrors(bean: branchInstance, field: 'code', 'error')}</span>
							</div>
						</div>
				
		<div class="form-actions">
			<g:actionSubmit class="save btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="delete btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
