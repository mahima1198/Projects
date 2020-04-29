package controller;

//import java.io.File;


import java.io.IOException;

import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.Dao;
import model.Model;


public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UploadServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String oldpath=getServletContext().getRealPath("");
		//System.out.print("Value aave e path :: "+oldpath);
		
		String title = request.getParameter("inno_projtitle");
		String abs = request.getParameter("inno_projabstract");
		String description = request.getParameter("inno_projdescription");
		String expectedFund = request.getParameter("inno_projtarget");
		String page="";
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("iemail");
		System.out.println("This is Upload servlet email :: "+email);
		if(title.equals("") || abs.equals("") || description.equals("") || expectedFund.equals(""))
		{
			page="error.jsp?msg=fields";
			
		}
		else
		{
			try{
				Model m=new Model();
				m.setTitle(title);
				m.setAbs(abs);
				m.setDescription(description);
				m.setExpectedFund(expectedFund);
				String addProjectQuery="insert into AddProject(Title,Abstract,Description,ExpectedFund,Email_Id ) values('"+title+"','"+abs+"','"+description+"','"+expectedFund+"','"+email+"')";
				boolean i=Dao.Register(m,addProjectQuery);
				if(i==false)
				{
					
					ResultSet rs = Dao.login(m, "select project_id from addproject where title='"+title+"'and email_id='"+email+"'");
					while(rs.next())
					{
						String proj_id = rs.getString(1);
						HttpSession projid = request.getSession();
						projid.setAttribute("project_id", proj_id);
						
					}
					page="addproject2.jsp";
				}
				else
				{
					page="error.jsp?msg=fields";
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		
		
		
		response.sendRedirect("addproject2.jsp");
		

		
	}

}


