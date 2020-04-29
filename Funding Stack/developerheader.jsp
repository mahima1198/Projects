<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="css_js.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Developer header</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="">
	<a class="navbar-brand" href="#"><img src="images/logo.jpg" height="145px" width="145px" class="img-rounded sm" alt="Cinque Terre"></a>
	<center><img src="images/funding_stack_img.png" height="145px" width="696px" class="img-rounded sm" alt="Cinque Terre"></center>
</div>
<br><br><br>
		
		<nav class="navbar">
			<div class="well well-md bg-blue">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-right hover">
				</ul>
			<div class="container-fluid">
				<div class="navbar-header">
				</div>				
				<ul class="nav nav-pills navbar-nav navbar-right hover">
					
					<li><a href="DeveloperDashboard.jsp" class="navigation_font"> <span class="glyphicon glyphicon-home"></span> Home</a></li>
					
					<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        					<span class="glyphicon glyphicon-folder-open"></span> Project <span class="caret"></span></a>
        				</a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				        	<a class="dropdown-item" href="addproject.jsp"><span class="glyphicon glyphicon-plus"></span>Add Project</a><br>
				     	   <a class="dropdown-item" href="viewproject.jsp"><span class="glyphicon glyphicon-folder-open">View Project</a>
				        </div>
      				</li>
      				
      				<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        					<span class="glyphicon glyphicon-folder-open"></span> Profile <span class="caret"></span></a>
        				</a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				        	<a class="dropdown-item" href="developerprofile.jsp"><span class="glyphicon glyphicon-user"></span> My Profile</a><br>
				     	   <a class="dropdown-item" href="developerchangepassword.jsp"><span class="glyphicon glyphicon-lock"> Change Password</a>
				        </div>
      				</li>				
					
					<li><a href="viewcrowd.jsp" class="navigation_font"><span class="glyphicon glyphicon-user"></span> Crowd</a></li>
					
					<li><a href="developerlogout.jsp" class="navigation_font"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
			</div>	
			</div>
		</nav>
<br><br>
</body>
</html>


