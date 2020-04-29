package controller;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao;
import model.Model;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LoginServlet() {
        super();    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String page="";
		String uname=request.getParameter("dev_uname");
		String password=request.getParameter("dev_password");
		String loginquery="";
		if(uname.equals("") || password.equals(""))
		{
			page="error.jsp?msg=fields";
			
		}
		else
		{
			try{
			Model m=new Model();
			m.setUname(uname);
			m.setPassword(password);
			loginquery="Select * from register where emailid='"+uname+"' and pwd='"+password+"'";
			ResultSet rs=Dao.login(m,loginquery);
			if(rs.next())
			{
				page="DeveloperDashboard.jsp?sucessful";
			}
			else
			{
				page="error.jsp?error";
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
