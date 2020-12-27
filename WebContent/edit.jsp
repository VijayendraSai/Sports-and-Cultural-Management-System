<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <table cellpadding=30px>
                <tr>
                    <td width=300px>
                        <br>
                        <%
  String db = request.getParameter("db");
  String user = db; // assumes database name is the same as username
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
    
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select * from User where username = '" + (String)session.getAttribute("username") +"'");
    rs.next();
    String mail = rs.getString(8);
    %>
    
                    
                        <h2>Edit My Details</h2>
                        
                        <form method="post" action="editdetails.jsp" >
                        <div >
                          <div class="form-group" >
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" value= <%=rs.getString(8)%>  name="email">
                          </div>
                          <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" disabled value="******" name="pwd">
                          </div>
                          <div class="form-group">
                            <label for="phn">Phone Number:</label>
                            <input type="number" class="form-control" id="phn" value=<%=rs.getString(7)%>  name="phn">
                          </div>
                          <div class="form-group">
                            <label for="DOB">DOB:</label>
                            <input type="text" class="form-control" id="DOB" value=<%=rs.getString(6)%>   name="DOB">
                          </div>
                          <input type="submit" value="submit">
                          </form>
                    </td>
                    <td>
                         <jsp:include page="upcoming_events.jsp" />
                        

                    </td>
                </tr>
            </table>
</div>
<% 

  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>


</body>
</html>