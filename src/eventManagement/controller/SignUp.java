package eventManagement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res)  
	  {
	         try
	      {  
	           PrintWriter out = res.getWriter();           
	             
	           String Firstname= req.getParameter("first_name");
	           String Lastname = req.getParameter("last_name");
	           String Username = req.getParameter("uname");
	           String Gender=req.getParameter("gender");
	           String Password = req.getParameter("pass");
	           String Dateofbirth= req.getParameter("birthday");
	           String PhoneNumber = req.getParameter("phone");
	           String Email = req.getParameter("email");
	           String Designation=req.getParameter("designation");
	           
	         
	           //out.print("insert into register values ('"+fn+"','"+ln+"','"+reg+"','"+usern+"','"+passw+"','"+passw+"','"+dob+"','"+phno+"','"+lia+"')");
	           Class.forName("com.mysql.jdbc.Driver");

	             Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC","root","");

	             Statement stmt=con.createStatement();
	             String sql = "insert into User values ('"+Firstname+"','"+Lastname+"','"+Username+"','"+Gender+"','"+Password+"','"+Dateofbirth+"','"+PhoneNumber+"','"+Email+"','"+Designation+"')";
	             stmt.executeUpdate(sql);
	             System.out.println("inserted");
	             HttpSession session = req.getSession();
	              session.setAttribute("username", Username);
	        res.sendRedirect("/eventManagement/home");
	             con.close();
	         
	         }
	      catch(Exception e)
	      {
	        System.out.println(e);
	      }  
	  }  
       
  

}
