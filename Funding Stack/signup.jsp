<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		
		<h2>Register</h2>	
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#innovator">Innovator</a></li>
			<li><a data-toggle="tab" href="#crowd">Crowd</a></li>
		</ul>
		<br><br>
		<center>
		<div class="well bg-1" style=" width:70%;">
		<div class="tab-content">
			<div id="innovator" class="tab-pane fade in active">
	            <form class="form-horizontal" method="post" action="InnovatorRegisterServlet">
					<fieldset>
					
					<!-- Form Name -->
					
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="inno_name">Name</label>  
					  <div class="col-md-4">
					  <input id="inno_name" name="inno_name" type="text" placeholder="Enter Name" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="inno_email">Email ID</label>  
					  <div class="col-md-4">
					  <input id="inno_email" name="inno_email" type="email" placeholder="Enter Email ID" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Password input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="inno_pass">Password</label>
					  <div class="col-md-4">
					    <input id="inno_pass" name="inno_pass" type="password" placeholder="Enter Password" class="form-control input-md" required="">
					  
					  </div>
					</div>
					
					<!-- Password input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="inno_cpass">Confirm Password</label>
					  <div class="col-md-4">
					    <input id="inno_cpass" name="inno_cpass" type="password" placeholder="Enter Confirm Password" class="form-control input-md" required="">
					  
					  </div>
					</div>
					
					<!-- Button (Double) -->
					<div class="form-group" align="left">
					  <label class="col-md-4 control-label" for="inno_submit"></label>
					  <div class="col-md-8">
					    <button type="submit" id="inno_submit" name="inno_submit" class="btn btn-success" action="InnovatorRegisterServlet">Submit</button>
					    <button id="inno_cancel" name="inno_cancel" class="btn btn-danger">Cancel</button>
					  </div>
					</div>
					
					</fieldset>
					</form>
					<div class="well-sm">
						
						<p>Already a Member?<a href="login.jsp"> Login</a></p>
					</div>            	            
			</div>
			<div id="crowd" class="tab-pane fade">
				<form class="form-horizontal" action="CrowdRegisterServlet" method="post">
					<fieldset>
					
					<!-- Form Name -->
					
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="crowd_name">Name</label>  
					  <div class="col-md-4">
					  <input id="crowd_name" name="crowd_name" type="text" placeholder="Enter Name" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="crowd_email">Email ID</label>  
					  <div class="col-md-4">
					  <input id="crowd_email" name="crowd_email" type="email" placeholder="Enter Email ID" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Password input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="crowd_pass">Password</label>
					  <div class="col-md-4">
					    <input id="crowd_pass" name="crowd_pass" type="password" placeholder="Enter Password" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Password input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="crowd_cpass">Confirm Password</label>
					  <div class="col-md-4">
					    <input id="crowd_cpass" name="crowd_cpass" type="password" placeholder="Enter Confirm Password" class="form-control input-md" required="">
					    
					  </div>
					</div>
					
					<!-- Button (Double) -->
					<div class="form-group" align="left">
					  <label class="col-md-4 control-label" for="crowd_submit"></label>
					  <div class="col-md-8">
					    <button id="crowd_submit" name="crowd_submit" class="btn btn-success" action="CrowdRegisterServlet">Submit</button>
					    <button id="crowd_cancel" name="crowd_cancel" class="btn btn-danger">Cancel</button>
					  </div>
					</div>
					
					</fieldset>
					</form>
					<div class="well-sm">
						
						<p>Already a Member?<a href="login.jsp"> Login</a></p>
					</div>           
									
			</div>
	    </div>
	</div>
	</center>
	</div>
	<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>