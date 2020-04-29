<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Model" %>
<%@ page import="dao.Dao" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
<title>projects</title>
</head>
<%
String query = "select title, description,project_id from addproject order by project_id desc fetch first 4 rows only";
Model m = new Model();
ResultSet rs = Dao.login(m, query);
String [] projtitle = new String[4];
String [] description = new String[4];
String [] project_id = new String[4];
int no=0;
while(rs.next())
{
	projtitle[no] =  rs.getString(1);
	description[no] = rs.getString(2);
	project_id[no] = "images\\"+rs.getString(3)+".jpg";
	System.out.print("\n"+project_id[no]);
	no++;
}

%>

<body>


		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="<%=project_id[0] %>" alt="Project 0">
					<div class="caption">
						<h3><%= projtitle[0] %></h3>
						<p><%=description[0] %></p>
						<p><a href="login.jsp" class="btn btn-primary">Read More</a></p>
					</div>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="<%=project_id[1] %>" alt="Project 1">
					<div class="caption">
						<h3><%= projtitle[1] %></h3>
						<p><%=description[1] %></p>
						<p><a href="login.jsp" class="btn btn-primary">Read More</a></p>
					</div>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="<%=project_id[2] %>" alt="Project 2">
					<div class="caption">
						<h3><%= projtitle[2] %></h3>
						<p><%=description[2] %></p>
						<p><a href="login.jsp" class="btn btn-primary">Read More</a></p>
					</div>
				</div>
			</div>
			
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="<%=project_id[3] %>" alt="Project 3">
					<div class="caption">
						<h3><%= projtitle[3] %></h3>
						<p><%=description[3] %></p>
						<p><a href="login.jsp" class="btn btn-primary">Read More</a></p>
					</div>
				</div>
			</div>
			
		</div>
</body>
</html>