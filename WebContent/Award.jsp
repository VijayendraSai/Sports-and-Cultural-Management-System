<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.PrintWriter"%>
     <%@ page import="java.io.OutputStream"%>
     <%@ page import="java.io.InputStream"%>
     <%@ page import="java.io.FileOutputStream"%>
     <%@ page import="java.io.ByteArrayOutputStream"%>
     <%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    int prev=0 ;
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select * from users_registered_events u left join organize o on u.id=o.id");
    for(int i =0 ;rs.next();i++){
    	Blob poster = rs.getBlob("elogo");
		InputStream inputStream = poster.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, bytesRead);
		}
		
		byte[] imageBytes = outputStream.toByteArray();
		
		String base64PosterImage = Base64.getEncoder().encodeToString(imageBytes);
    	
    	if(prev!= rs.getInt(2)){
    		out.println("<h4 style='color:purple;'>"+ rs.getString(5) +"</h4>"+"<img style='width:100px;height:100px;' src=data:image/jpg;base64,"+ base64PosterImage   + ">" );
    	}
    	prev= rs.getInt(2);
    	out.println(
             
             "<table cellpadding=10px border=1px>"
            
                
            +    "<tr>"
            +        "<td>"
            		+ "<h6><b>Participant: </b>"+rs.getString(3) +"</h6>"
            +            "<p><b>Registeration Time: </b>"+ rs.getString(1) +"</p>"
            +"<form method='post' action='/eventManagement/awards'>"
            	
            +"Position : <input  type=text name='position'  >"
            +"<input hidden type=text name='description'  "+ "value="+ rs.getString(6)+">"
            		+"<input hidden type=text name='username'  "+ "value="+ rs.getString(3)+">"
            				+"<input hidden type=text name='id'  "+ "value="+ rs.getString(2)+">"
            +"</br><input type=submit  value='update'>"
            +"</form>"
            
             +       "</td>"
                
                +"</tr>"
                
            +"</table>");	
			
    }
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%> 
        
    </div>

</body>
</html>