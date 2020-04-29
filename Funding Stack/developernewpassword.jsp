<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Innovator New Password</title>
</head>
<body>
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
					<li><a href="projects.jsp" class="navigation_font"><img src="icons/project.ico"/> Projects</a></li>
					<li><a href="login.jsp" class="navigation_font"><img src="icons/signup.ico"/> Login</a></li>
				</ul>
			</div>
			
			</div>	
			</div>
		</nav>

   <div class="container-fluid bg-1 text-center">

 <form class="form-horizontal" action="InnovatorNewPasswordServlet" method="post">
					<fieldset>
				
						<!-- Form Name -->
						<br>
						<br>			
				
						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_password">Password:</label>
							<div class="col-md-4">
								<input id="inno_password" name="inno_password" type="password" placeholder="Enter new Password" class="form-control input-md" required="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_password">Confirm Password:</label>
							<div class="col-md-4">
								<input id="inno_confirmpassword" name="inno_confirmpassword" type="password" placeholder="Confirm Password" class="form-control input-md" required="">
							</div>
						</div>
						
					
						<!-- Button (Double) -->
							<div class="form-group" align="left">
								<label class="col-md-4 control-label" for="submitbtn"></label>
								<div class="col-md-3">
									<button type="submit" id="inno_submit" name="inno_submit" class="btn btn-success" action="InnovatorLoginServlet">Submit</button>
									<button id="inno_cancelbtn" name="cancelbtn" class="btn btn-danger">Cancel</button>
								</div>
							</div>
				
					</fieldset>
					<br><br><br><br><br><br><br><br>
				</form>
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
	            
</body>
</html>