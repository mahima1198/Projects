package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.Dao;
import mail.PasswordMail;
import model.Model;

public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForgotServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				}		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String emailid=request.getParameter("emailid");
		String page="";
		String loginquery="select * from rinno where email='"+emailid+"'";
		String data="12345678901234567890123456789012345678901234567890123456789012345678901234567890";
		String otp="";
		
		if(emailid.equals(""))
		{
			page="error.jsp?msg=fields";
		}
		
		else
		{
		
		try {
			Model m=new Model();
			m.setEmail(emailid);
			ResultSet rs= Dao.login(m, loginquery);
			if(rs.next())
			{
				String password=rs.getString("password");
				HttpSession session=request.getSession();
				session.setAttribute("email", "emailid");
				session.setAttribute("pass", "password");			
				char ch[]=data.toCharArray();
				for(int i=0;i<4;i++)
				{	
					int j=(int)((Math.random())*80);
					otp=otp+ch[j];
				}
				session.setAttribute(otp, "otp");
				PasswordMail pm=new PasswordMail();
				boolean status=pm.sendMail(emailid, otp);
				System.out.println(status);
				if(status)
				{
					page="otp.jsp?msg=qwerty";
				}
				else
				{
					page="forgotpassword.jsp?msg=asd";
				}
			}
			else
			{
				page="forgotpassword.jsp?msg=zxc";
			}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				}
		
		response.sendRedirect(page);
						
						

	}

}
