<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	<link rel="shortcut icon" href="${resource(dir:'images',file:'legend.ico')}" type="image/x-icon" />
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap.css')}" />
	<link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-responsive.css')}" />
	<link rel="stylesheet" href="${resource(dir:'kickstart/css',file:'docs.css')}" />
	<link rel="stylesheet" href="${resource(dir:'kickstart/css',file:'kickstart.css')}" />

    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png">
    
    <g:layoutHead />
	
    <!-- Note: Place at the end of the document to load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="${resource(dir:'bootstrap/js',file:'bootstrap.js')}"></script>
    <script src="${resource(dir:'kickstart/js',file:'kickstart.js')}"></script>
	<g:javascript library="application" />
	<r:layoutResources />
</head>

<body>
	<div id="Navbar" class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
				</a>

				<a class="brand" href="${createLink(uri: '/')}">
					<img class="logo" src="${resource(dir:'kickstart/img',file:'legend.png')}" alt="${meta(name:'app.name')}" height="25" border="0" />
					${meta(name:'app.name')}
					<small> v${meta(name:'app.version')}</small>
				</a>

          		<div class="nav-collapse">
          			<ul class="nav">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Browse <b class="caret"></b></a>
							<ul class="dropdown-menu">
			                   
			                   <g:render template="/home/menu"></g:render>
			                   
							</ul>
						</li>
					</ul>
				
					<div class="pull-right">
						<g:render template="/menu/language"/>														
						<g:render template="/menu/info"/>	
						<sec:ifLoggedIn>
							<g:render template="/menu/user"/>	
						</sec:ifLoggedIn>													
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<g:if test="${ pageProperty(name:'page.header') }">
   		<g:pageProperty name="page.header" />
	</g:if>

	<g:else>
		<header id="Header" class="jumbotron masthead">
			<div class="inner">
				<div class="container">
					<h1 class="title"><g:layoutTitle default="${meta(name:'app.name')}" /></h1>
				</div>
			</div>
		</header>
	</g:else>
  
	<div id="Content" class="container">
		<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
		<g:if test="${	params.controller != null
					&&	params.controller != ''
					&&	params.controller != 'home'
					&&  params.controller != 'login'
		}">
			<ul id="Menu" class="nav nav-pills">
		        
		        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		        
		        <%-- Set which "pill" of the menu is active --%>
				
				<g:if test="${ params.action != 'approveList' }">
				
					<li class="${ params.action == "list" ? 'active' : '' }">
						<g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
					</li>
					
					<g:if test="${ params.controller != 'loanAccount' || (params.controller == 'loanAccount' && session.clientNo) }">
						<li class="${ params.action == "create" ? 'active' : '' }">
							<g:link action="create"><g:message code="default.new.label"  args="[entityName]"/></g:link>
						</li>
					 </g:if>
					 
					<g:if test="${ params.controller == 'loanAccount' 
									&& (params.action == 'show' 
											|| params.action == 'repaymentSchedule' 
											|| params.action == 'transactionHistory'
											|| params.action == 'applyPayment')
								}">
						<li class="${ params.action == 'show' ? 'active' : '' }">
							<g:link action="show" id="${loanAccountInstance.id}">Show Loan Account</g:link>
						</li>
						<li class="${ params.action == 'repaymentSchedule' ? 'active' : '' }">
							<g:link action="repaymentSchedule" id="${loanAccountInstance.id}">Repayment Schedule</g:link>
						</li>
						<li class="${ params.action == 'transactionHistory' ? 'active' : '' }">
							<g:link action="transactionHistory" id="${loanAccountInstance.id}">Transaction History</g:link>
						</li>
						<li class="${ params.action == 'applyPayment' ? 'active' : '' }">
							<g:link action="applyPayment" id="${loanAccountInstance.id}">Apply Payment</g:link>
						</li>
					</g:if>
				
				</g:if>
				
			</ul>
        </g:if>
                        
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>
            
		<g:layoutBody />
        <g:pageProperty name="page.body" />
	</div>

	<g:if test="${ pageProperty(name:'page.footer') }">
	    <g:pageProperty name="page.footer" />
	</g:if>
	<g:else>
		<footer id="Footer">
		</footer>
	</g:else>
		
    <r:layoutResources />
</body>

</html>