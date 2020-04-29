<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.IOException" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="model.*" %>
    <%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registeration_Inovator</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <jsp:include page="css_js.jsp"></jsp:include>

  
   <style>
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #ffffff;
      	}
  
  </style>
  
</head>

<body>



<%
HttpSession se=request.getSession(); 
String emailid=(String)session.getAttribute("iemail");
try{
	Model m=new  Model();
	String selectquery=("select * from innoprofile where emailid='"+emailid+"'");
	
	ResultSet rs=Dao.login(m,selectquery);
	while(rs.next())
	{
		String inm=rs.getString(2);
		String icn=rs.getString(3);
		String ied=rs.getString(4);
		String ioccup=rs.getString(5);
		String iabtme=rs.getString(6);
		out.println("hello"+inm); 
		%>
		
<jsp:include page="developerheader.jsp"></jsp:include>

   <div class="container-fluid bg-1 text-center">
   <form class="form-inline" action="InnovatorProfile" method="post">
  <div class="form-group">
    <label class="sr-only" for="inno_name">Name </label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
      <input id="inno_name" name="inno_name" type="text" class="form-control"  placeholder="Name" value=<%=inm %>>
    </div>
	</br>
	</br>
	 <label class="sr-only" for="inno_contact">Contact</label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span> </div>
      <input id="inno_contact" name="inno_contact" type="text" class="form-control"  placeholder="Contact-No" value=<%=icn %>>
    </div>
	</br>
	</br>
	 <label class="sr-only" for="inno_qualification">Qualification</label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-education"></span> </div>
      <input id="inno_qualification" name="inno_qualification" type="text" class="form-control"  placeholder="Educational Qualification" value=<%=ied %>>
    </div>
	</br>
	</br>
	 
	 <label class="sr-only" for="inno_whoami">Who Am I?</label>
	 <div class="input-group">
	 <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
	                <select class="form-control" name="inno_whoami" id="inno_whoami">
	                    <option selected value=<%=ioccup%>>
	                        Select
	                    </option>
						<option value="Student">
	                        Student
	                    </option>
	    
	                    <option value="Company">
	                        Company
	                    </option>
	    
	                    <option value="Developer">
	                        Developer
	                    </option>
	                </select>
	            </div>
	</br>
	</br>
	 <label class="sr-only" for="inno_aboutme">About Me</label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
	  <textarea id="inno_aboutme" name="inno_aboutme" class="form-control" rows="5"  placeholder="About Me"><%=iabtme %></textarea>
    </div>
	</br>
	</br>
  </div>
  </br>
  <button type="submit" class="btn btn-primary" action="InnovatorProfile">Update</button>
</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<%		
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		
	} %>
</body>
</html>