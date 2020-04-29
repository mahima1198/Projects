<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="css_js.jsp"></jsp:include>
	<title>Funding Stack - Login</title>
	
	<script>
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
	
	<style>
	.test + .tooltip > .tooltip-inner {
      background-color: #000000; 
      color: #FFFFFF; 
      border: 1px solid green; 
      padding: 15px;
      font-size: 20px;
  }
  
 
  .test + .tooltip.left > .tooltip-arrow {
      border-left: 5px solid red;
  }
 
  .test + .tooltip.right > .tooltip-arrow {
      border-right: 5px solid black;
  }
	</style>
</head>
<body class="">
<jsp:include page="header.jsp"></jsp:include>
<br>

		<nav class="navbar">
			<div class="well well-md bg-blue">
			<div class="container-fluid">
			
					<ul class="nav navbar-nav navbar-right hover">
					</ul>
			<div class="container-fluid">
				<div class="navbar-header">
				</div>				
				<ul class="nav nav-pills navbar-nav navbar-right hover">
					<li><a href="index.jsp" class="navigation_font"><img src="icons/home.ico"/> Home</a></li>
					<li><a href="#" class="navigation_font"><img src="icons/project.ico"/> Projects</a></li>
					<li><a href="login.jsp" class="navigation_font"><img src="icons/signup.ico"/> Login</a></li>
				</ul>
			</div>
			
			</div>	
			</div>
		</nav>


	<div class="container">
	<center>
	<img src="images/innovator.PNG" data-toggle="tooltip" data-placement="left" title="Any person who posts the project on FUNDING STACK!">
	<img src="images/crowd.PNG" data-toggle="tooltip" data-placement="right" title="Any person who wishes to fund the project developed by the innovators!">
	</center>
		
		<h2>Login</h2>	
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#innovator">Innovator</a></li>
			<li><a data-toggle="tab" href="#crowd">Crowd</a></li>
		</ul>
		<br><br>
		<center>
		<div class="well bg-1" style=" width:70%;">
		<div class="tab-content">
			<div id="innovator" class="tab-pane fade in active">
	            <form class="form-horizontal" action="InnovatorLoginServlet" method="post">
					<fieldset>
				
						<!-- Form Name -->
						<br>
						<br>			
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_email">Email</label>  
							<div class="col-md-5">
								<input id="inno_email" name="inno_email" type="email" placeholder="Enter your Email" class="form-control input-md" required="">		
							</div>
						</div>
				
						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_password">Password </label>
							<div class="col-md-5">
								<input id="inno_password" name="inno_password" type="password" placeholder="Enter  Password" class="form-control input-md" required="">
								
							</div>
						</div>
						
						<div class="well-sm">
						<p><a href="developerforgotpassword.jsp">Forgot your Password</a></p>
						<hr style="color:#FFFFFF;">
						<p>Not a member yet?<a href="signup.jsp">Sign Up</a></p>

						</div>
						<!-- Button (Double) -->
							<div class="form-group" align="left">
								<label class="col-md-4 control-label" for="submitbtn"></label>
								<div class="col-md-8">
									<button type="submit" id="inno_submit" name="inno_submit" class="btn btn-success" action="InnovatorLoginServlet">Submit</button>
									<a href="index.jsp"  class="btn btn-danger" role="button">Cancel</a>
								</div>
							</div>
				
					</fieldset>
				</form>
	            
			</div>
			<div id="crowd" class="tab-pane fade">
	      		<form class="form-horizontal" action="CrowdLoginServlet" method="post">
					<fieldset>
				
						<!-- Form Name -->
						<br>
						<br>			
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="crow_email">Email</label>  
							<div class="col-md-5">
								<input id="crow_email" name="crow_email" type="email" placeholder="Enter your Email" class="form-control input-md" required="">		
							</div>
						</div>
				
						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="crow_password">Password </label>
							<div class="col-md-5">
								<input id="crow_password" name="crow_password" type="password" placeholder="Enter  Password" class="form-control input-md" required="">
								
							</div>
						</div>
						
						<div class="well-sm">
						<p><a href="sponsorerforgotpassword.jsp">Forgot your Password</a></p>
						
						<hr>
						<p>Not a member yet?<a href="signup.jsp">Sign Up</a></p>

						</div>
						<!-- Button (Double) -->
							<div class="form-group" align="left">
								<label class="col-md-4 control-label" for="submitbtn"></label>
								<div class="col-md-8">
									<button id="spo_submitbtn" name="submitbtn" class="btn btn-success" action="CrowdLoginServlet">Submit</button>
									<a href="index.jsp"  class="btn btn-danger" role="button">Cancel</a>
								</div>
							</div>
				
					</fieldset>
				</form>
			</div>
	    </div>
	</div>
	</center>
	</div>
	<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>