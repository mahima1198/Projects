package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

public class InnovatorProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InnovatorProfile() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inm=request.getParameter("inno_name");
		System.out.println(inm);
		String icn=request.getParameter("inno_contact");
		String ied=request.getParameter("inno_qualification");
		String ioccup=request.getParameter("inno_whoami");
		String iabtme=request.getParameter("inno_aboutme");
		HttpSession session = request.getSession();
		String page="";
		String emailid=(String)session.getAttribute("iemail");
		String updatequery="update innoprofile set(name,contact,education,occupation,aboutme)=('"+inm+"','"+icn+"','"+ied+"','"+ioccup+"','"+iabtme+"') where emailid='"+emailid+"' ";

		try 
		{
		
			Model m=new Model();

			if(Dao.update(m,updatequery)!=0)
			{
				page="DeveloperDashboard.jsp?msg=success";
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
