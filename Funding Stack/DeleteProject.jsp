<%@page import="com.itextpdf.text.pdf.qrcode.Mode"%>
<%@page import="java.io.File"%>
<%@page import="model.Model"%>
<%@page import="dao.Dao"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String project_id = request.getParameter("project_id");
Model m = new Model();
boolean i = Dao.Register(m, "delete from addproject where project_id='"+project_id+"'");
if(i==false)
{
	response.sendRedirect("viewproject.jsp");
}
else
{
	response.sendRedirect("error.jsp?msg=project_delete_failed");
}


%>
</body>
</html>