<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<jsp:include page="css_js.jsp"></jsp:include>
</head>
<body>

<jsp:include page="sponsorerheader.jsp"></jsp:include>

<div class="container-fluid bg-1 text-center">
<form class="form-horizontal" action="FundServlet" method="post">
<br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_emailid">Fund</label>  
  <div class="col-md-4">
  <input id="fund" name="fund" type="text" placeholder="Enter Amount" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="inno_submit"></label>
  <div class="col-md-3">
    <button id="submit" name="submit" class="btn btn-success">Raise</button>
    
  </div>
</div>



<br><br><br><br><br><br><br><br>
</form>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>