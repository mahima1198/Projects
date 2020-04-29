<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="model.Model"%>
<%@page import="dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="css_js.jsp"></jsp:include>
<body>

<jsp:include page="sponsorerheader.jsp"></jsp:include>


 <!-- Container -->
       <div class="container-fluid bg-1 text-center">
      <form class="form-horizontal" action="index.jsp" method="post">
      <!-- Form Name -->
      <br>
   
      <table class="table table-condensed">
          <thead>
            <tr>
              <th>Project ID</th>
              <th>Title</th>
              <th>Amount</th>
              <th>Innovator Email ID</th>
            </tr>
          </thead>
          <br>
          <tbody>
          <%
			HttpSession emailid= request.getSession();
			String email =(String) emailid.getAttribute("cemail");
			Model m =new Model();
			ResultSet rs = Dao.login(m,"select project_id,title,fund_amount,inno_email from fund where crow_email='"+email+"'"); 
			while(rs.next())
			{
			String title= rs.getString("title");
			String project_id= rs.getString("project_id");
			String fund_amount = rs.getString("fund_amount");
			String inno_email = rs.getString("inno_email");
			
		%>
      
            <tr>
            
              <td><div class="col-lg-3"><input value="<%=project_id%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              <td><div class="col-lg-3"><input value="<%=title%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              <td><div class="col-lg-3"><input value="<%=fund_amount%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              <td><div class="col-lg-3"><input value="<%=inno_email%>" name="textinput" type="text" placeholder="" class="form-control input-md"></div></td>
              
              
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