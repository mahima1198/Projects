<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Innovator OTP Page</title>
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

<form class="form-horizontal" action="InnovatorOtpServlet" method="post">
<br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_otp">OTP</label>  
  <div class="col-md-4">
  <input id="inno_otp" name="inno_otp" type="text" placeholder="Enter OTP" class="form-control input-md">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_submit"></label>
  <div class="col-md-3">
    <button id="inno_submit" name="inno_submit" class="btn btn-success" action="InnovatorOypServlet">Submit OTP</button>
    <button id="inno_reset" name="inno_reset" class="btn btn-danger">Cancel</button>
  </div>
</div>






<script type="text/javascript">
<%
try
{
String msg=request.getParameter("msg");
	if(msg.equals("qwerty"))
	{%>
	alert("Otp Has been Sent to Mailid");
	<%}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


</script>


<br><br><br><br><br><br><br><br>
</form>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>