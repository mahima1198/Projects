package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

public class CrowdProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrowdProfile() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String cnm=request.getParameter("crow_name");
		
		String ccn=request.getParameter("crow_contact");
		String cwhi=request.getParameter("crow_whoami");
		String coccup=request.getParameter("crow_occupation");
		HttpSession session = request.getSession();
		String page="";
		String emailid=(String)session.getAttribute("cemail");
		String updatequery="update crowprofile set(name,contact,gender,occupation)=('"+cnm+"','"+ccn+"','"+cwhi+"','"+coccup+"') where emailid='"+emailid+"' ";
		
		
		try 
		{
		
			Model m=new Model();

			if(Dao.update(m,updatequery)!=0)
			{
				page="SponsorerDashboard.jsp?msg=success";
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
		response.sendRedirect(page);
	}

}
