package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

public class CrowdNewPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CrowdNewPasswordServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String crow_password=request.getParameter("crow_password");
		String crow_confirmpassword=request.getParameter("crow_confirmpassword");
		String page="";
		HttpSession session=request.getSession();
		
		String email=(String)session.getAttribute("cemail");
		
		String sql="update cinno set password='"+crow_password+"' where email='"+email+"'";
		if(crow_password.equals(crow_confirmpassword))
		{
			Model m=new Model();
			m.setEmail(email);
			m.setPassword(crow_password);
		try {
			int i=	Dao.update(m,sql);
			if(i!=0)
			{
				page="login.jsp?msg=sucessful";
			
			}
			else
			{
				page="error.jsp?msg=failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		}
		else
		{
			page="error.jsp?msg=newpassword";
		}
		response.sendRedirect(page);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
