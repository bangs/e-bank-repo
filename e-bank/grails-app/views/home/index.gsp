<%@ page import="zw.co.quantum.legend.model.Bulletin" %>

<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	
		<p>Managing clients, loan accounts, savings accounts with ease and speed. 
			</p>
	
		<br/>
		<div class="row">
			<div class="span4">
				
				<h3><g:img dir="kickstart/img" file="themes.png"/>Quick Links</h3>
				<div id="controllerList" class="dialog">
					<ul data-role="listview" data-split-icon="gear" data-filter="true">
					
						<g:render template="menu"></g:render>
						
					</ul>
				</div>
			</div>
			<div class="span4">
				<h3><g:img dir="kickstart/img" file="todo.png"/>Bulletin</h3>
				<p></p>
				<ul>
					<g:each in="${Bulletin.list()}" var="bulletin">
						<li>${bulletin.message}</li>
					</g:each>
				</ul>
			</div>
			<div class="span4">
				<h3><g:img dir="kickstart/img" file="info.png"/>User Info</h3>
				<p></p>
				<ul>
					<li>Welcome, <leg:currentUser field="firstName"/> <leg:currentUser field="lastName"/> </li>
					<li>Last login: <leg:currentUser field="lastLoginDate" /></li>
				</ul>
			</div>
		</div>
	
		<hr>

		<center>e-Products &copy 2012</center>
		
</body>

</html>
