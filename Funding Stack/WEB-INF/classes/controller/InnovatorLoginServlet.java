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

public class InnovatorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InnovatorLoginServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		String page="";
		String email=request.getParameter("inno_email");
		String password=request.getParameter("inno_password");
		String loginquery="";
		if(email.equals("") || password.equals(""))
		{
			page="error.jsp?msg=fields";
			
		}
		else
		{
			try{
				Model m=new Model();
				m.setUname(email);
				m.setPassword(password);
				loginquery="Select * from RINNO where EMAIL='"+email+"' and PASSWORD='"+password+"'";
				ResultSet rs=Dao.login(m,loginquery);
			
			if(rs.next())
			{
				
				HttpSession session=request.getSession();
				session.setAttribute("iemail",email); 
				session.setAttribute("ipassword",password);
				page="DeveloperDashboard.jsp?msg=successfull";
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
