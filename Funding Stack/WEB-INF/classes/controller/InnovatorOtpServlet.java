package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InnovatorOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InnovatorOtpServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		String iotp=request.getParameter("inno_otp");
		HttpSession session=request.getSession();
		String iopt1=(String)session.getAttribute("iotp");
		String iem=(String)session.getAttribute("iemail");
		String page="";
		System.out.println(iotp+iopt1);
		if(iotp.equals(""))
		{
			page="/otp.jsp?msg=abc";
		}
		else if(iotp.equals(iopt1))
		{
			response.sendRedirect("developernewpassword.jsp");
		}
	}

}
