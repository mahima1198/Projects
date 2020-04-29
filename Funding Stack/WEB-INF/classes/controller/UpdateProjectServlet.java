package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
//import javafx.scene.control.Alert;
import model.Model;

public class UpdateProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProjectServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String title = request.getParameter("inno_projtitle");
		String abs = request.getParameter("inno_projabstract");
		String description = request.getParameter("inno_projdescription");
		String expectedFund = request.getParameter("inno_projtarget");
		String page="";
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("iemail");
		String project_id = (String)session.getAttribute("project_id");
		
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
				String updateProjectQuery="update addproject set title='"+title+"', abstract='"+abs+"', description='"+description+"', expectedfund='"+expectedFund+"' where project_id='"+project_id+"'";
				boolean i=Dao.Register(m,updateProjectQuery);
				if(i==false)
				{
					page="viewproject.jsp";
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
		PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('User or password incorrect');");
		out.println("</script>");
		response.sendRedirect(page);	
	}

}
