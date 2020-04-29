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

import model.Model;
import dao.Dao;
import mail.FundMail;
import mail.PasswordMail;

public class FundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page="";
		String amount = request.getParameter("fund");
		HttpSession session = request.getSession();
		String crow_email  = (String) session.getAttribute("cemail"); 
		String project_id =(String) session.getAttribute("project_id");
		String inno_email="";
		String title="";
		String emailquery = "select email_id,title from addproject where project_id='"+project_id+"'";
		Model m = new Model();
		ResultSet rs = Dao.login(m, emailquery);
		try {
			while(rs.next())
			{
				inno_email = rs.getString(1);
				title=rs.getString(2);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(amount+inno_email+project_id);
		String query = "insert into fund(project_id,title,fund_amount,crow_email,inno_email) values('"+project_id+"','"+title+"','"+amount+"','"+crow_email+"','"+inno_email+"')";
		System.out.println(query);

		String msg = "You got Sponsorship of $ "+amount+" on Your Project Title : "+title+" ENJOY IT !!!!";
		boolean result = Dao.Register(m, query);
		if(result == false)
		{
			FundMail pm=new FundMail();
			boolean status=false;
			try {
				status = pm.sendMail(inno_email,msg);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(status);
			if(status)
			{
				page="sponsorerviewallproject.jsp";
			}
			else
			{
				page="error.jsp?msg=failedtoemail";
			}
		}
		else
		{
			page="error.jsp?msg=funderror";
		}
		response.sendRedirect(page);
	}
	

}
