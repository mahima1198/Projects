<%@page import="java.io.File"%>
<%@page import="model.Model"%>
<%@page import="dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="css_js.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;URL=./logout.jsp">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<script
type="text/javascript" language="javascript">    
javascript:window.history.forward(1);
</script>

<%  
response.setHeader("Pragma","no-cache");  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Expires","0");  
response.setDateHeader("Expires",-1);  
%>
<%
String project_id = request.getParameter("project_id");
System.out.println("Project ID :::::: "+project_id);
Model m =new Model();
ResultSet rs = Dao.login(m, "select * from addproject where project_id='"+project_id+"'");
String title=" ";
String abs=" ";
String description=" ";
String expectedfund=" ";
while(rs.next())
{
	title = rs.getString("title");
	abs = rs.getString("abstract");
	description = rs.getString("description");
	expectedfund = rs.getString("expectedfund");
}
HttpSession project_idSession = request.getSession();
project_idSession.setAttribute("project_id", project_id);
%>
  
  <style>
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #ffffff;
      	}
  .container-fluid {
	  color: #ffffff;
	  padding-top: 5px;
      padding-bottom: 5px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
	  font: 15px arial;
      letter-spacing: 2px;
  }
  .container-fluid  li a:hover {
      color: #01bfbd !important;
  }
  
  </style>
<title>Add Project</title>
</head>
<body>

<jsp:include page="developerheader.jsp"></jsp:include>

<!-- Container -->
 <div class="container-fluid bg-1 text-center">
<form class="form-horizontal" action="UpdateProjectServlet" method="post">
<!-- Form Name -->
<br>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projtitle">Title</label>  
  <div class="col-md-4">
  <input id="inno_projtitle" value="<%=title %>" name="inno_projtitle" type="text" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projabstract">Abstract</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="inno_projabstract" name="inno_projabstract"><%=abs %></textarea>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projdescription">Description</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="inno_projdescription" name="inno_projdescription"><%=description %></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projtarget">Expected Fund</label>  
  <div class="col-md-4">
  <input id="inno_projtarget" value="<%=expectedfund %>"name="inno_projtarget" type="text" class="form-control input-md" required="">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projsubmit"></label>
  <div class="col-md-3">
    <a href="viewdocument.jsp" target="_blank" class="btn btn-info" role="button">View Project Document</a>
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projsubmit"></label>
  <div class="col-md-3">
    <button id="inno_projupdate" name="inno_projsubmit" class="btn btn-success">Update Project</button>
    <a href="viewproject.jsp"  class="btn btn-danger" role="button">Cancel</a>
  </div>
</div>
</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>