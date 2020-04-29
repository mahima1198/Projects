package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Model;

public class Dao {
static Connection con=null;

	static {
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			 con=DriverManager.getConnection("jdbc:db2://localhost:50000/WADPROJ","Admin","Mahima@98");
		}
		catch(Exception e)
		{}
	}
	
	public static ResultSet login(Model m, String loginquery) {
		ResultSet rs; 
		try{
			 
			PreparedStatement ps=con.prepareStatement(loginquery);
			 rs = ps.executeQuery();
			return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
	}
	public static boolean Register(Model m, String registerquery) {
		
		try{
			PreparedStatement ps=con.prepareStatement(registerquery);
			boolean i=ps.execute();
			return i;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
			
	}
	
	public static int update(Model m, String sql) throws SQLException {
		PreparedStatement ps=con.prepareStatement(sql);
		int i=ps.executeUpdate();
		return i;	
	}



}
