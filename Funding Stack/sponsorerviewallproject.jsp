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


<script>
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
<jsp:include page="sponsorerheader.jsp"></jsp:include>          
      
      <!-- Container -->
       <div class="container-fluid bg-1 text-center">
      <form class="form-horizontal" action="sponsorerviewallproject2.jsp" method="post">
      <!-- Form Name -->
      <br>
   
      
      <table class="table table-condensed">
          <thead>
            <tr>
              <th>Project ID</th>
              <th>Title</th>
            </tr>
          </thead>
          <br>
          <tbody>
          <%

			HttpSession emailid= request.getSession();
			String email =(String) emailid.getAttribute("iemail");
			Model m =new Model();
			ResultSet rs = Dao.login(m,"select project_id,title from addproject"); 
			while(rs.next())
			{
			String title= rs.getString("title");
			String project_id= rs.getString("project_id");
			session.setAttribute(project_id, "project_id");
			
		%>
      
            <tr>
            
              <td><div class="col-md-3"><input value="<%=project_id%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              <td><div class="col-md-7"><input value="<%=title%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              <td><div class="col-md-1"><button id="project_id" value="<%=project_id%>"name="project_id" class="btn btn-info">View</button></div></td>
              
              
            </tr>
            <%

			}
		
			 %>
            
           </tbody>
        </table>
      
      </form>
      </div>
      
      <jsp:include page="footer.jsp"></jsp:include>
      
      
      </body>
</html>