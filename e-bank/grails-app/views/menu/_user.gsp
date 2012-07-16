<ul class="nav">
	<li class="dropdown">
		<a class="dropdown-toggle" href="#"> <sec:username/> <b class="caret"></b></a>
		<ul class="dropdown-menu">
		
			<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
			<li class=""><a href="${createLink(uri: '/user/list')}">View Profile</a></li>
			<li class=""><a href="${createLink(uri: '/user/changePassword')}">Change Password</a></li>
			
			<li class="divider"></li>
			<li class=""><g:link controller="logout" ><g:message code="default.logout.label"/></g:link></li>
			
<%--			<li class="divider"></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/imprint')}">Imprint</a></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/terms')}"><i>Terms of Use</i></a></li>--%>
		</ul>
	</li>
</ul>
