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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/eventManagement/assets/css/css.css">
    <script>
     </script>
        
</head>
<body>
    
        <div class="container">
        <h2>Upcoming Events</h2>
        
         <%
  String db1 = request.getParameter("Xtras");
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
    
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("SELECT * FROM organize WHERE DATE(estart) >= DATE(NOW());");
    for(int i =0 ;rs.next() ;i++){
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
    	System.out.println(rs.getInt(1));
    	if(! "clubs".equals(rs.getString(15)))
    	out.println(
                  "<div class='upcoming-event-wrap flex flex-wrap justify-content-between align-items-center'> "
                    + "<figure class='events-thumbnail'>"
                        + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+"<img src=data:image/jpg;base64,"+  base64PosterImage + "></a> "
                        + "</figure>"

                    + "<div class='entry-meta'>"
                        + "<div class='event-date' style='font-size:30px'>"+  rs.getString(2) + "</div>"
                    + "</div>"

                    + "<header class='entry-header'>"
                        + "<h5 class='entry-title'>"
                            + "<a href='./eventone.html'>"+  rs.getString(3) + "</a>"
                        + "</h5>"

                        + "<div class='event-date-time'>"
                        + "<p style='display:inline'>Registration Starts From:"+  rs.getString(6) + "</p>"
                        + "<p style='display:inline'> - </p>"
                        +"<br>"
                        + "<p style='display:inline'>Registration Ends on:"+  rs.getString(7) + "</p>"
                        + "</div>"

                        + "<div class='event-speaker'>"
                            + "<p style='display:inline'><b>Incharge : </b></p>"
                            + "<p style='display:inline'>"+  rs.getString(9) + "</p> "
                        + "</div>"
                    + "</header> "

                    + "<footer class='entry-footer'>"
                        + "<a href='/eventManagement/success?event_id=" +rs.getString(1)+"&Username="+session.getAttribute("username") +"'>Register</a>"
                        + "</footer>"
                    + "</div>");		
                }
              }
              catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
              }
            %>
        
    </div>
    
   </div>
</div>
</div>
</body>
</html>