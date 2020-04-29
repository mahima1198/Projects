<%@page import="java.io.File"%>
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
<form class="form-horizontal" action="UploadServlet2" method="post" enctype="multipart/form-data">
<!-- Form Name -->
<br>

<%
String path=application.getRealPath("");
path=path+"images\\";
String emailid=(String)session.getAttribute("iemail");
String project_id = (String)session.getAttribute("project_id");
System.out.println("Prject ID is :::::::: "+project_id);
path=path+project_id+".jpg";
String docpath = path+project_id+".pdf";

System.out.println("Path is ::::::: "+path);
File f=new File(path);
File docf = new File(docpath);
String src="";
String docsrc = "";
if(f.exists())
{
src=f.getName();
}
else
{
	src="profile.jpg";
}

if(docf.exists())
{
docsrc=docf.getName();
}
else
{
	docsrc="none";
}

%>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projdoc">Project Documents</label>
  <div class="col-md-4">
  
    <input id="inno_projdoc" name="inno_projdoc" value="<%=docsrc %>" class="input-file" type="file">
  </div>
</div>




<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projimage">Project Image</label>
  <div class="col-md-4">
    <!--  <input id="inno_projimage" name="inno_projimage" class="input-file" type="file">-->
    <img src="images/<%=src%>" style="width:125px; height:125px;margin:10px">
	<input type="file" id="inno_projimage" name="inno_projimage" class="input-file" accept="image/JPEG">
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_projsubmit"></label>
  <div class="col-md-3">
    <button id="inno_projsubmit" name="inno_projsubmit" class="btn btn-success">Submit Project</button>
    <button id="inno_projcancel" name="inno_projcancel" class="btn btn-danger">Cancel</button>
  </div>
</div>
</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>