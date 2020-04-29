<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="com.itextpdf.text.pdf.PdfImportedPage"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
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
<title>View Project</title>
</head>
<body>

<jsp:include page="developerheader.jsp"></jsp:include>
<%
String path=application.getRealPath("");
path=path+"images\\";
String project_id=(String)session.getAttribute("project_id");

String docpath = path+project_id+".pdf";
System.out.println(docpath);
%>
<!-- Container -->
 <div class="container-fluid bg-1 text-center">
 


<%
    response.reset();
    response.setContentType("application/pdf");
    File file = new File(docpath);
    response.setHeader("Content-Type", "application/pdf");
    response.setHeader("Content-Disposition",
            "inline;filename=Saba_PhBill.pdf");
    response.setContentLength((int) file.length());
    response.setHeader("Content-Type",
            getServletContext().getMimeType(file.getName()));
    response.setHeader("Content-Length", String.valueOf(file.length()));
    //OPen an input stream to the file and post the file contents thru the
    //servlet output stream to the browser
    FileInputStream in = new FileInputStream(file);
    ServletOutputStream outs = response.getOutputStream();
    response.setContentLength(in.available());
    byte[] buf = new byte[8192];
    int c = 0;
    try {
        while ((c = in.read(buf, 0, buf.length)) > 0) {
            //System.out.println("size:"+c);
            outs.write(buf, 0, c);
            out.write(outs.toString());
        }

    } catch (IOException ioe) {
        ioe.printStackTrace(System.out);
    } finally {
        outs.flush();
        outs.close();
        in.close();
    }
%>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>