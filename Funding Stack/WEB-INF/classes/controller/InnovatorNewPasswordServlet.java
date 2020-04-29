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

public class InnovatorNewPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InnovatorNewPasswordServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inno_password=request.getParameter("inno_password");
		String inno_confirmpassword=request.getParameter("inno_confirmpassword");
		String page="";
		HttpSession session=request.getSession();
		
		HttpSession sessionemail = request.getSession();
		String email=(String)sessionemail.getAttribute("iemail");
		System.out.println("EMAIL ID IS :::::::::: "+email);
		
		String sql="update rinno set password='"+inno_password+"' where email='"+email+"'";
		if(inno_password.equals(inno_confirmpassword))
		{
			Model m=new Model();
			m.setEmail(email);
			m.setPassword(inno_password);
		try {
			int i=	Dao.update(m,sql);
			if(i!=0)
			{
				page="login.jsp?msg=successfull";
			
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
