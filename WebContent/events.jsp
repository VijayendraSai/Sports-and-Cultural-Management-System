<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Events</title>
	
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />

    <!-- Styles -->
    <link rel="stylesheet" href="./assets/css/style.css" />

    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="./assets/css/mdb.min.css" />
 

  </head>
  <body>
    <div class="start-body">
      
      <jsp:include page="Navbar.jsp" />
    <br />
    </div>

      <div class="upcoming-events-outer">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="upcoming-events">
                <div class="upcoming-events-header">
                  <h4>Upcoming Events</h4>
                </div>

                <div class="upcoming-events-list">
                 <%
  				String db1 = request.getParameter("Xtras");
  				try {
		    java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
		    
		    Statement st= con.createStatement();
		    ResultSet rs=st.executeQuery("SELECT * FROM organize WHERE DATE(estart) >= DATE(NOW());");
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
		    	
    	out.println(
                  "<div class='upcoming-event-wrap flex flex-wrap justify-content-between align-items-center'> "
                    + "<figure class='events-thumbnail'>"
                        + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+"<img  style='width:100px;height:100px;' src=data:image/jpg;base64,"+ base64PosterImage   + "></a> "
                        + "</figure>"

                    + "<div class='entry-meta'>"
                        + "<div class='event-date' style='font-size:30px'>"+  rs.getString(2) + "</div>"
                    + "</div>"

                    + "<header class='entry-header'>"
                        + "<h3 class='entry-title'>"
                            + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+ "</a>"
                        + "</h3>"

                        + "<div class='event-date-time'>"
                        + "<p style='display:inline'>"+  rs.getString(2) + "</p>"
                        + "<p style='display:inline'> - </p>"
                        + "<p style='display:inline'>"+  rs.getString(3) + "</p>"
                        + "</div>"

                        + "<div class='event-speaker'>"
                            + "<p style='display:inline'>Incharge:</p>"
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
        </div>

        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="upcoming-events">
                <div class="upcoming-events-header">
                  <h4>Ongoing Events</h4>
                </div>

                <div class="upcoming-events-list">
                    <%
                    String db2 = request.getParameter("Xtras");
                    try {
                      java.sql.Connection con;
                      Class.forName("com.mysql.jdbc.Driver");
                      con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
                      
                      Statement st= con.createStatement();
                      ResultSet rs=st.executeQuery("SELECT * FROM organize WHERE DATE(estart) = DATE(NOW());");
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
          		    	
              	out.println(
                            "<div class='upcoming-event-wrap flex flex-wrap justify-content-between align-items-center'> "
                              + "<figure class='events-thumbnail'>"
                                  + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+"<img  style='width:100px;height:100px;' src=data:image/jpg;base64,"+ base64PosterImage   + "></a> "
                                  + "</figure>"

                              + "<div class='entry-meta'>"
                                  + "<div class='event-date' style='font-size:30px'>"+  rs.getString(2) + "</div>"
                              + "</div>"

                              + "<header class='entry-header'>"
                                  + "<h3 class='entry-title'>"
                                      + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+ "</a>"
                                  + "</h3>"

                                  + "<div class='event-date-time'>"
                                  + "<p style='display:inline'>"+  rs.getString(2) + "</p>"
                                  + "<p style='display:inline'> - </p>"
                                  + "<p style='display:inline'>"+  rs.getString(3) + "</p>"
                                  + "</div>"

                                  + "<div class='event-speaker'>"
                                      + "<p style='display:inline'>Incharge:</p>"
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
        </div>
  
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="upcoming-events">
                <div class="upcoming-events-header">
                  <h4>Past Events</h4>
                </div>

                <div class="upcoming-events-list">
                    <%
                    String db3 = request.getParameter("Xtras");
                    try {
                      java.sql.Connection con;
                      Class.forName("com.mysql.jdbc.Driver");
                      con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
                      
                      Statement st= con.createStatement();
                      ResultSet rs=st.executeQuery("SELECT * FROM organize WHERE DATE(estart) < DATE(NOW());");
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
          		    	
              	out.println(
                            "<div class='upcoming-event-wrap flex flex-wrap justify-content-between align-items-center'> "
                              + "<figure class='events-thumbnail'>"
                                  + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+"<img  style='width:100px;height:100px;' src=data:image/jpg;base64,"+ base64PosterImage   + "></a> "
                                  + "</figure>"

                              + "<div class='entry-meta'>"
                                  + "<div class='event-date' style='font-size:30px'>"+  rs.getString(2) + "</div>"
                              + "</div>"

                              + "<header class='entry-header'>"
                                  + "<h3 class='entry-title'>"
                                      + "<a href='./InvokeEventTemplate?id="+ rs.getString(1)+"'>"+ "</a>"
                                  + "</h3>"

                                  + "<div class='event-date-time'>"
                                  + "<p style='display:inline'>"+  rs.getString(2) + "</p>"
                                  + "<p style='display:inline'> - </p>"
                                  + "<p style='display:inline'>"+  rs.getString(3) + "</p>"
                                  + "</div>"

                                  + "<div class='event-speaker'>"
                                      + "<p style='display:inline'>Incharge:</p>"
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
        </div>
      </div>

  </body>
</html>
