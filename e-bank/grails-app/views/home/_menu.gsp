<sec:ifAnyGranted roles="ROLE_ADMIN">
						
	<li class="controller">
		<g:link controller="institution">Institutions</g:link>
	</li>
	<li class="controller">
		<g:link controller="branch">Branches</g:link>
	</li>
	<li class="controller">
		<g:link controller="user">Users</g:link>
	</li>
	<li class="controller">
		<g:link controller="role">Roles</g:link>
	</li>
	<li class="controller">
		<g:link controller="requestmap">Access Rights</g:link>
	</li>
	<li class="controller">
		<g:link controller="settings">Settings</g:link>
	</li>
	<li class="controller">
		<g:link controller="bulletin">Bulletins</g:link>
	</li>
	<li class="controller">
		<g:link controller="systemAccount">System Accounts</g:link>
	</li>									
</sec:ifAnyGranted>
						
<sec:ifAnyGranted roles="ROLE_SUPERVISOR">
						
	<li class="controller">
		<g:link controller="checklist">Checklists</g:link>
	</li>
	<li class="controller">
		<g:link controller="collateralType">Collateral Types</g:link>
	</li>
	<li class="controller">
		<g:link controller="fee">Fees</g:link>
	</li>
	<li class="controller">
		<g:link controller="fund">Funds</g:link>
	</li>
	<li class="controller">
		<g:link controller="GLCode">GL Codes</g:link>
	</li>
	<li class="controller">
		<g:link controller="holiday">Holidays</g:link>
	</li>
	<li class="controller">
		<g:link controller="latenessDormancyDef">Lateness & Dormancy</g:link>
	</li>
	<li class="controller">
		<g:link controller="paymentType">Payment Types</g:link>
	</li>
	<li class="controller">
		<g:link controller="penalty">Penalties</g:link>
	</li>
	<li class="controller">
		<g:link controller="productCategory">Product Categories</g:link>
	</li>
	<li class="controller">
		<g:link controller="loanProduct">Loan Products</g:link>
	</li>
	<li class="controller">
		<g:link controller="savingsProduct">Savings Products</g:link>
	</li>

</sec:ifAnyGranted>
						
<sec:ifAnyGranted roles="ROLE_OFFICER">
	<li class="controller">
		<g:link controller="client" action="create">Register Client</g:link>
	</li>				
	<li class="controller">
		<g:link controller="individualClient">Individual Clients</g:link>
	</li>
	<li class="controller">
		<g:link controller="corporateClient">Corporate Clients</g:link>
	</li>
	<li class="controller">
		<g:link controller="clientGroup">Client Groups</g:link>
	</li>
	<li class="controller">
		<g:link controller="loanAccount">Loan Accounts</g:link>
	</li>
	<li class="controller">
		<g:link controller="savingsAccount">Savings Accounts</g:link>
	</li>
					
</sec:ifAnyGranted>

<sec:ifAnyGranted roles="ROLE_APPROVER">
	<li class="controller">
		<g:link controller="financialAccount" action="approveList">Approve Accounts</g:link>
	</li>
</sec:ifAnyGranted>

<sec:ifAnyGranted roles="ROLE_DISBURSER">
	<li class="controller">
		<g:link controller="loanAccount" action="disburseList">Disburse Loans</g:link>
	</li>
</sec:ifAnyGranted>
						