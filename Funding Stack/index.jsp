
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.Model" %>
<%@ page import="dao.Dao" %>
<%@ page import="java.sql.*" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="css_js.jsp"></jsp:include>
		
		<link rel="icon" type="image/png" href="icons/favicon.png">
		<title>Funding Stack - Home </title>

	</head>
<%
String query = "select sum(expectedfund) from addproject";
Model m = new Model();
ResultSet rs = Dao.login(m, query);
String amount="";
while(rs.next())
{
	amount = rs.getString(1);
}

query = "select count(project_id) from addproject";
rs = Dao.login(m, query);
String totalProject="";
while(rs.next())
{
	totalProject= rs.getString(1);
}


query = "select count(email) from rcrowd";
rs = Dao.login(m, query);
String totalSponsor="";
while(rs.next())
{
	totalSponsor= rs.getString(1);
}

%>
<body class="movebackground">
	
	<jsp:include page="header.jsp"></jsp:include>
	<br><br><br>
	<!--  Content Start -->
		<!-- Top Navigation Bar Black -->
		
			
		<nav class="navbar">
			<div class="well well-md bg-blue">
			<div class="container-fluid">
			
					<ul class="nav navbar-nav navbar-right hover">
					</ul>
			<div class="container-fluid">
				<div class="navbar-header">
				</div>				
				<ul class="nav nav-pills navbar-nav navbar-right hover">
					<li><a href="#" class="navigation_font"><img src="icons/home.ico"/> Home</a></li>
					<li><a href="#" class="navigation_font"><img src="icons/project.ico"/> Projects</a></li>
					<li><a href="login.jsp" class="navigation_font"><img src="icons/signup.ico"/> Login</a></li>
				</ul>
			</div>
			
			</div>	
			</div>
		</nav>
		
		<!-- End Navigation Bar -->
		
		
		<!-- Start Moving Tab Slide -->
		
		
		<div class='container carousel'>
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner text-center" role="listbox">
                    <div class="item active">
                        <div class="col-lg-12 pull-right">
                            <img src="images/display_img_0.jpg" height="80%" width="100%">
                        </div>
                    </div>
                    <div class="item">                    
                        <div class="col-lg-12 pull-right">
                            <img src="images/display_img_1.jpg"  height="80%" width="100%">
                        </div>
                    </div> 
                    <div class="item">                    
                        <div class="col-lg-12 pull-right">
                            <img src="images/display_img_2.jpg" height="80%" width="100%">
                        </div>
                    </div> 
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
		
		<br><br>
		
		
		<!-- Some gap between two Modules -->
		<br><br>
	<!-- Content End -->
	
	
		<jsp:include page="projects.jsp"></jsp:include>
		<!-- Numbers Start -->
		<div class="jumbotron bg-smallblack">
			<div class="container">
					
				<center>
				<div class="col-sm-4">
					<h3 class="numbertitle"><%=totalProject %>+</h3>
					<h2>Projects</h2>
				</div>
				<div class="col-sm-4">
					<h3 class="numbertitle"><%=totalSponsor %>+</h3>
					<h2>Sponsors</h2>
				</div>
				<div class="col-sm-4">
					<h3 class="numbertitle"><%=amount %>$</h3>
					<h2>Funding</h2>
				</div>
				</center>
			</div>
		</div>
	<!-- Numbers End -->
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>