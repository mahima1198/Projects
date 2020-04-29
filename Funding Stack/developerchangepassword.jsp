<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Developer ChangePassword</title>
</head>
<body>
<jsp:include page="developerheader.jsp"></jsp:include>


   <div class="container-fluid bg-1 text-center">

 <form class="form-horizontal" action="InnovatorChangePasswordServlet" method="post">
					<fieldset>
				
						<!-- Form Name -->
						<br>
						<br>			
				
						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_opassword">Old Password:</label>
							<div class="col-md-4">
								<input id="inno_opassword" name="inno_opassword" type="password" placeholder="Enter Old Password" class="form-control input-md" required="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_npassword">New Password:</label>
							<div class="col-md-4">
								<input id="inno_npassword" name="inno_npassword" type="password" placeholder="Enter new Password" class="form-control input-md" required="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="inno_cpassword">Confirm Password:</label>
							<div class="col-md-4">
								<input id="inno_cpassword" name="inno_cpassword" type="password" placeholder="Confirm Password" class="form-control input-md" required="">
							</div>
						</div>
						
					
						<!-- Button (Double) -->
							<div class="form-group" align="left">
								<label class="col-md-4 control-label" for="submitbtn"></label>
								<div class="col-md-3">
									<button type="submit" id="inno_submit" name="inno_submit" class="btn btn-success" action="InnovatorChangePasswordServlet">Change Password</button>
									<a href="DeveloperDashboard.jsp"  class="btn btn-danger" role="button">Cancel</a>
								</div>
							</div>
				
					</fieldset>
					<br><br><br><br><br><br><br><br>
				</form>
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>