package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

public class CrowdRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CrowdRegisterServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String page="";
		String name=request.getParameter("crowd_name");
		String email=request.getParameter("crowd_email");
		String password=request.getParameter("crowd_pass");
		String cmpassword = request.getParameter("crowd_cpass");
		 
		String registerquery="";
		String profilequery="";
		
		if(name.equals("") || email.equals("") || password.equals("") || cmpassword.equals(""))
		{
			page="error.jsp?msg=fields";
			
		}
		
		if(!password.equals(cmpassword))
		{
			page="error.jsp?msg=passcmp";
		}
		else
		{
			try{
				Model m=new Model();
				m.setName(name);
				m.setEmail(email);
				m.setPassword(password);
				registerquery="insert into RCROWD(NAME,EMAIL,PASSWORD) values('"+name+"','"+email+"','"+password+"')";
				profilequery="insert into crowprofile(name,emailid) values('"+name+"','"+email+"')";
				
				boolean i1=Dao.Register(m,registerquery);
				
				boolean i2=Dao.Register(m,profilequery);
				if(i1==false && i2==false)
				{
					page="login.jsp?msg=successfull";
				}
				else
				{
					
					page="error.jsp?msg=emailexist";
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


