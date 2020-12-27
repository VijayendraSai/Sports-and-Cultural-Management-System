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
    <meta
    	charset="utf-8"
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/eventManagement/assets/css/style.css">
  </head>
  <body>
    <div class="start-body">
    <jsp:include page="./Navbar.jsp" />
        <br>
    	<div class="page-heading"> 
        <h1>Sports</h1>
    </div>    
        <%
     String Username=(String)session.getAttribute("username");
        String db = request.getParameter("db");
        String user = db; // assumes database name is the same as username
        try {
          java.sql.Connection con;
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
          
          Statement st= con.createStatement();
          ResultSet rs=st.executeQuery("select * from organize where eventtype='sports' ");
          for(int i =0 ;rs.next();i++){
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
          	
          	out.println("<li class='list-group-item'>"+
          	"<a href='./InvokeEventTemplate?id="+ rs.getString(1) + "' data-toggle='tooltip' title='More Info!' >"
                  
                  + "<table cellpadding=10px>"
                      
                  +    "<tr>"
                  		+ "<h5>"+ rs.getString(2) +"</h5>"
                  +        "<td>"
                  +            "<img src=data:image/jpg;base64," + base64PosterImage + "  width='100px' height='100px'>"
                   +       "</td>"
                      +    "<td>"
                       +   "<p>" + rs.getString(3) +"</p>"
                      		 +   "<p>" + rs.getString(6) +"</p>"
                      				 +   "<p>" + rs.getString(7) +"</p>"
                      						 + "<footer class='entry-footer'>"
                      	                        + "<a href='/eventManagement/success?event_id=" +rs.getString(1)+"&Username="+session.getAttribute("username") +"'>Register</a>"
                      	                        + "</footer>"
                        +" </td>"
                      
                      +"</tr>"
                  +"</table>"
                  +"</a>"
                  +"</li>");		
          }
        }
        catch(SQLException e) {
          out.println("SQLException caught: " +e.getMessage());
        }
     %>
     
    
    <br>
</div>
<script>
  includeHTML();
</script>
</body>
</html>

