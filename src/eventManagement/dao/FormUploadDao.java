package eventManagement.dao;

import java.io.*;
import java.sql.*;
import java.util.*;
public class FormUploadDao {
	private Scanner scan = new Scanner(System.in);
	private String url = "jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC";
	private String un = "root";
	private String pwd = "";
	private static final String sql = "INSERT INTO organize (etitle,edescription,eposter,elogo,estart,eend,eregend,org1id,org1contact,org1email,org2id,org2contact,org2email,eventtype,rules) values ( ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?)";
	
	public int postForm(String etitle,String edescription,InputStream eposter,InputStream elogo,String estart,String eend,String eregend,String org1id,String org1contact,String org1email,String org2id, String org2contact,String org2email,String eventtype,String rules){
		
		int row = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
		
		try {
			Connection conn = DriverManager.getConnection(url,un,pwd);
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setString(1, etitle);
			statement.setString(2, edescription);
			if (eposter!=null) {
				statement.setBlob(3, eposter);
			}
			if (elogo!=null) {
				statement.setBlob(4, elogo);
			}
			statement.setString(5,estart);
			statement.setString(6, eend);
			statement.setString(7, eregend);
			statement.setString(8,org1id);
			statement.setString(9,org1contact);
			statement.setString(10,org1email );
			statement.setString(11,org2id);
			statement.setString(12,org2contact);
			statement.setString(13,org2email );
			statement.setString(14, eventtype);
			statement.setString(15, rules);
			
			row = statement.executeUpdate();
		}catch (SQLException ex) {
            // process sql exception
            printSQLException(ex);
        }
		return row;
		
	}

	private void printSQLException(SQLException ex) {
		// TODO Auto-generated method stub
		 for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
		 }
	

	}
}
