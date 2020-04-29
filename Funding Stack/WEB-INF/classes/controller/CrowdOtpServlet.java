package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CrowdOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CrowdOtpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String cotp=request.getParameter("crow_otp");
		
		HttpSession session=request.getSession();
		String copt1=(String)session.getAttribute("cotp");
		String emailid=(String)session.getAttribute("cemailid");
		String page="";
		
		if(cotp.equals(""))
		{
			page="/otp.jsp?msg=abc";
		}
		else if(cotp.equals(copt1))
		{
			response.sendRedirect("sponsorernewpassword.jsp");
		}
	}

}
