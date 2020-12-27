package eventManagement.controller;

import java.io.IOException;
import java.util.Scanner;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/awards")
public class awards extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Scanner scan = new Scanner(System.in);
	private String url = "jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC";
	private String un = "root";
	private String pwd = "";
	private static final int BUFFER_SIZE = 4096;
    
    public awards() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username= request.getParameter("username");
		String position= request.getParameter("position");
		String description= request.getParameter("description");
		String eventid= request.getParameter("id");
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");

		String sql="insert into achievements values (?,?,?,?);";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println(sql);
		ps.setString(1,username);
		ps.setString(2, position);
		ps.setString(3, description);
		ps.setString(4, eventid);
		System.out.println(ps);
		ps.executeUpdate();

		}

		catch(SQLException | ClassNotFoundException sql)
		{
		request.setAttribute("error", sql);
		System.out.println(sql);
		}
		response.sendRedirect("/eventManagement/Award.jsp");
	}

}
