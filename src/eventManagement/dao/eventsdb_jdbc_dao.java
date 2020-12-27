package eventManagement.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Base64;


import eventManagement.model.eventsdb;
import eventManagement.model.users_registered_events;

public class eventsdb_jdbc_dao {
	private String jdbcURL = "jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC";
	private String jdbcUname =	"root";
	private String jdbcpass = "";
	
	private static final String select_event_by_type = "select id,etitle,eventtype,estart,eend,eposter from organize where eventtype = ?";
	private static final String insert_event_reg_students = "insert into users_registered_events" + "  (Reg_date_time, id, Username) VALUES "
			+ " (?, ?, ?);";
	public eventsdb_jdbc_dao() {
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL,jdbcUname,jdbcpass);
			System.out.println("Database Connected...");
		}catch (SQLException e){
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public boolean insert_Registered_Users(users_registered_events user) throws SQLException {
		System.out.println(insert_event_reg_students);
			    
		// try-with-resource statement will auto close the connection.
		try(Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(insert_event_reg_students);) {
			preparedStatement.setTimestamp(1, user.getReg_Date_time());
			preparedStatement.setInt(2, user.getEvent_id());
			preparedStatement.setString(3, user.getUsername());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			printSQLException(e);
			return false;
		}
		
	}
	
	
	public List<eventsdb> selectEvents(String eventtype) throws SQLException, IOException {
		List<eventsdb> event = new ArrayList<>();
		try(Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(select_event_by_type);){
			preparedStatement.setString(1, eventtype);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				int id  = rs.getInt("id");
				String etitle  = rs.getString("etitle");
				Date estart  = rs.getDate("estart");
				Date eend  = rs.getDate("eend");
				Blob eposter = rs.getBlob("eposter");
			    InputStream logoinputStream = eposter.getBinaryStream();
			    ByteArrayOutputStream logooutputStream = new ByteArrayOutputStream();
			    byte[] logobuffer = new byte[4096];
			    int logobytesRead = -1;
			    
			    while ((logobytesRead = logoinputStream.read(logobuffer)) != -1) {
			      logooutputStream.write(logobuffer, 0, logobytesRead);
			    }
			    
			    byte[] logoimageBytes = logooutputStream.toByteArray();
			    
			    String base64logoImage = Base64.getEncoder().encodeToString(logoimageBytes);
			    logoinputStream.close();
			    logooutputStream.close();
			    System.out.println("hello yaaaaaaar"+ etitle);
			    event.add(new eventsdb(id,etitle,estart,eend,base64logoImage));
				}
		}
		catch (SQLException e) {
			printSQLException(e);
		}
		return event;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
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
