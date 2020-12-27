<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%
String email = request.getParameter("email");
String pwd =request.getParameter("pwd");
String phn =request.getParameter("phn");
String dob =request.getParameter("DOB");
Connection con = null;

PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
String sql="Update User set Email=?,PhoneNumber=?,DOB=? where username= '"+ (String )session.getAttribute("username")+"'";
ps = con.prepareStatement(sql);
System.out.println(sql);
ps.setString(1,email);
ps.setString(2, phn);
ps.setString(3, dob);
System.out.println(ps);
ps.executeUpdate();

}

catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

%>
<jsp:forward page = "employeeregister.jsp" />
