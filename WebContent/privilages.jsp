<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<body>
    <jsp:include page="Navbar.jsp" />
    <div class="container">
      <%
  String db = request.getParameter("db");
  String user = db; // assumes database name is the same as username
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
    
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select * from User");
    for(int i =0 ;rs.next();i++){
    	String path="/eventManagement/assets/images/man.png";
    	if(("F").equals(rs.getString(4))){
    		 path="/eventManagement/assets/images/female.png";
    	}
    	out.println(
             "<h5>"+rs.getString(2) +"</h5>"
            
            + "<table cellpadding=10px>"
                
            +    "<tr>"
            +        "<td>"
            +            "<img src=" + path + "  width='100px' height='100px'>"
             +       "</td>"
                +    "<td>"
                 +   "<p> Email ID:: " + rs.getString(8) +"</p>"
					+   "<p> DOB:: " + rs.getString(6) +"</p>"
						+   "<p> Phone number:: " + rs.getString(7) +"</p>"
						 +   "<p> Designation:: " + rs.getString(9) +"</p>"   
								 + "<form method='post' >"
								+"<input hidden type='text' name='username' value="+rs.getString(3)+">"
										 +	"<label for='designation'>Designation:</label>"
					+ "<select id='designation' name='designation'>"
							+ "<option value='admin'>Admin</option>"
					+ "<option value='student'>student</option>"
  					+ "<option value='organiser'>Organiser</option>"
  					
					+ "</select>"
					+"</br>"
					+"<input type='submit' value='okay' >"
					+"</form>"
                  +"</td>"
                
                +"</tr>"
                
            +"</table>");	
		String designation = request.getParameter("designation");
		String sql="Update User set designation=? where username= '"+ request.getParameter("username")  +"'";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println(designation);
		ps.setString(1,designation);
		System.out.println(ps);
		ps.executeUpdate();	
    }
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%> 
        
    </div>   
</body>
</html>