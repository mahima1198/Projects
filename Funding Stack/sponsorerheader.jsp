<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="css_js.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sponsorer header</title>
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css"> 
 		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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
					<li><a href="SponsorerDashboard.jsp" class="navigation_font"> <span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="sponsorerviewallproject.jsp" class="navigation_font"> <span class="glyphicon glyphicon-folder-open"></span>View All Projects</a></li>
					
					<li><a href="sponsorerfundedproject.jsp" class="navigation_font"><span class="glyphicon glyphicon-folder-open"> </span>My Funded Projects</a></li>
					
					<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        					<span class="glyphicon glyphicon-folder-open"></span> Profile <span class="caret"></span></a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				        	<a class="dropdown-item" href="sponsorerprofile.jsp"><span class="glyphicon glyphicon-user"></span> My Profile</a><br>
				     	   <a class="dropdown-item" href="sponsorerchangepassword.jsp"><span class="glyphicon glyphicon-lock"></span> Change Password</a>
				        </div>
      				</li>	
					
					<li><a href="sponsorerlogout.jsp" class="navigation_font"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
			
			</div>	
			</div>
		</nav>
<br><br>
</body>
</html>