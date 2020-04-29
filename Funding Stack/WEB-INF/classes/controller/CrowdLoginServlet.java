package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

public class CrowdLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CrowdLoginServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String page="";
		
		String email=request.getParameter("crow_email");
		String password=request.getParameter("crow_password");
		
		String loginquery="";
		if(email.equals("") || password.equals(""))
		{
			page="error.jsp?msg=fields";
			
		}
		else
		{
			try{
				Model m=new Model();
				m.setEmail(email);
				m.setPassword(password);
				loginquery="Select * from rcrowd where EMAIL='"+email+"' and PASSWORD='"+password+"'";
				ResultSet rs=Dao.login(m,loginquery);
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("cemail",email);  
				session.setAttribute("cpassword",password);
				page="SponsorerDashboard.jsp?sucessful";
			}
			else
			{
				page="error.jsp?msg=failed";
			}
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		response.sendRedirect(page);
	}

}
