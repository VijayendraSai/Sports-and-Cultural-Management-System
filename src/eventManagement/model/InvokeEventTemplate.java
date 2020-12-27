package eventManagement.model;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Base64;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InvokeEventTemplate
 */
@WebServlet("/InvokeEventTemplate")
public class InvokeEventTemplate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Scanner scan = new Scanner(System.in);
	private String url = "jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC";
	private String un = "root";
	private String pwd = "";
	private static final String sql = "select * from organize where id=?";
	private static final int BUFFER_SIZE = 4096;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvokeEventTemplate() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String posterPath = "/views/poster.jpg";
		String logoPath = "/views/logo.jpg";
		RequestDispatcher rd = request.getRequestDispatcher("/eventTemplate.jsp");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("id",id);
		try {
			Connection conn = DriverManager.getConnection(url,un,pwd);
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1,id);
			
			ResultSet rs = statement.executeQuery();
			//InputStream eposter,InputStream elogo,String org1id,String org1contact,String org1email,String org2id, String org2contact,String org2email,String eventtype,String rules
			while(rs.next()){
				String eid = rs.getString("id");
				String etitle = rs.getString("etitle");
				String edescription = rs.getString("edescription");
				request.setAttribute("title",etitle);
				request.setAttribute("edesc",edescription);
				//Need to add poster and logo too!
				//Need to create temporary file and pass that path of the file via request
				//poster
				Blob poster = rs.getBlob("eposter");
				InputStream inputStream = poster.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				
				byte[] imageBytes = outputStream.toByteArray();
				
				String base64PosterImage = Base64.getEncoder().encodeToString(imageBytes);
				request.setAttribute("eposter", base64PosterImage);
				inputStream.close();
				outputStream.close();
				//Busted!!!
				
				//elogo 
				Blob logo = rs.getBlob("elogo");
		        InputStream logoinputStream = logo.getBinaryStream();
		        ByteArrayOutputStream logooutputStream = new ByteArrayOutputStream();
		        byte[] logobuffer = new byte[4096];
		        int logobytesRead = -1;
		        while ((logobytesRead = logoinputStream.read(logobuffer)) != -1) {
		          logooutputStream.write(logobuffer, 0, logobytesRead);
		        }
		        
		        byte[] logoimageBytes = logooutputStream.toByteArray();
		        
		        String base64logoImage = Base64.getEncoder().encodeToString(logoimageBytes);
		        request.setAttribute("elogo", base64logoImage);
		        inputStream.close();
		        outputStream.close();
				//busted!!!
				
				
				String estart = rs.getString("estart");
				request.setAttribute("estart",estart);
				String eend = rs.getString("eend");
				request.setAttribute("eend", eend);
				String eregend = rs.getString("eregend");
				request.setAttribute("eregend", eregend);
				String org1id = rs.getString("org1id");
				request.setAttribute("org1id",org1id);
				String org1contact = rs.getString("org1contact");
				request.setAttribute("org1contact",org1contact);
				String org1email = rs.getString("org1email");
				request.setAttribute("org1email", org1email);
				
				String org2id = rs.getString("org2id");
				request.setAttribute("org2id",org2id);
				String org2contact = rs.getString("org2contact");
				request.setAttribute("org2contact",org2contact);
				String org2email = rs.getString("org2email");
				request.setAttribute("org2email", org2email);
				String eventtype = rs.getString("eventtype");
				request.setAttribute("eventtype", eventtype);
				String rules = rs.getString("rules");
				request.setAttribute("rules", rules);
				request.setAttribute("eid", eid);
			}
			
		}catch (SQLException ex) {
			System.out.println(ex);
		}
		rd.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
