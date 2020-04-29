<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.io.IOException" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="model.*" %>
    <%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sponsorer Profile</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
  <!-- CSS Code-->
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #ffffff;
  }
  .btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

#img-upload{
    width: 100%;
}
  p {font-size: 16px;}
  .margin {margin-bottom: 90px;}
 
  </style>
</head>
</head>
<%
HttpSession se=request.getSession(); 
String emailid=(String)session.getAttribute("cemail");
try{
	Model m=new  Model();
	String selectquery=("select * from crowprofile where emailid='"+emailid+"'");
	ResultSet rs=Dao.login(m,selectquery);
	
	while(rs.next())
	{
		String cnm=rs.getString(2);
		String ccn=rs.getString(3);
		String cwhi=rs.getString(4);
		String coccup=rs.getString(5);
		//out.println("hello"+cnm); 
		%>
<body>
<jsp:include page="sponsorerheader.jsp"></jsp:include>

<div class="container-fluid bg-1 text-center">
   <form class="form-inline" action="CrowdProfile" method="post">
  <div class="form-group">
  <br>
    <label class="sr-only" for="crow_name">Name </label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
      <input id="crow_name" name="crow_name" type="text" class="form-control" placeholder="Name" value=<%=cnm %>>
    </div>
	</br>
	</br>
	 <label class="sr-only" for="crow_contact">Contact</label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span> </div>
      <input id="crow_contact" name="crow_contact" type="text" class="form-control" placeholder="Contact-No" value=<%=ccn %>>
    </div>
	</br>
	</br>
	 
	 <label class="sr-only" for="crow_whoami">who am I?</label>
	 <div class="input-group">
	 <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
	                <select id="crow_whoamI" name="crow_whoami" class="form-control">
	                    <option selected value=<%=cwhi %>>
	                         Select
	                    </option>
						<option value="male">
	                       Male
	                    </option>
	    
	                    <option value="female">
	                        Female
	                    </option>
	    
	                    <option value="other">
	                        Other
	                    </option>
	                </select>
	            </div>
	</br>
	</br>
	 <label class="sr-only" for="crow_occupation">Occupation</label>
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </div>
      <input id="crow_occupation" name="crow_occupation" type="text" class="form-control" placeholder="Occupation" value=<%=coccup %>>
    </div>
	</br>
	</br>
  <button type="submit" class="btn btn-primary" action="CrowdProfile">Update</button>
</form>
</div>

	</br>
	</br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<%		
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		
	} %>
</html>