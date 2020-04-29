package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


public class UploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UploadServlet2() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("iemail");
		
		HttpSession projid = request.getSession();
		String project_id = (String) projid.getAttribute("project_id");
		
		System.out.println("Upload servlet 2 Email iD :: "+email);
		String path=getServletContext().getRealPath("");
		path=path+"images\\";
		String path1=path+project_id+".jpg";
		
		MultipartRequest mr=new MultipartRequest(request, path,10*1024*1024);
		File f2=mr.getFile("inno_projimage");
		File f1=new File(path1);		
		f1.delete();
		f2.renameTo(f1);
			
		path1=path+project_id+".pdf";
		f2=mr.getFile("inno_projdoc");
		f1=new File(path1);		
		f1.delete();
		f2.renameTo(f1);
				
		response.sendRedirect("DeveloperDashboard.jsp");
		

		
	}

}
