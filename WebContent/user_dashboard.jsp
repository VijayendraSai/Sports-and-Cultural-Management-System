 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user-dashboard</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css.css">
    </head>
<body>
    
    <div class="start-body">
     <jsp:include page="Navbar.jsp" />
           
        </div>
        <br><br>
        <!-- <a href="my-acheivements.html" class="btn btn-outline-secondary btn-light">Check the event details</a> -->
                        
        <div style="padding: 30px ;">
        <div class="row">
        <h2>My Acheivements </h2><br>
        <br>
        
    	<%
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
    
    Statement st= con.createStatement();
    String query = "select * from achievements a   join organize o  on (a.eventid=o.id and a.username = '" + (String)session.getAttribute("username") +"')";
    
    ResultSet rs=st.executeQuery(query);
    for(int i =0 ;rs.next();i++){
    
    	out.println(" <div class='col'> "
                + "<div class='card' style='width:200px'>"
          + "<img class='card-img-top' src='/eventManagement/assets/images/cup.png' alt='Card image'>"
           + "<div class='card-body'>"
           + "<h4 class='card-title'>"+rs.getString(6)+ "</h4>"
          + "<p class='card-text'> "+rs.getString(2)+ "</p>"
          + "<a href='./InvokeEventTemplate?id="+ rs.getString(4)+"'class='btn btn-outline-secondary btn-light'>Check the event details</a>"
        + "</div>"
      + "</div>"
+ "</div>");		
}
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
  <jsp:include page="edit.jsp"></jsp:include>  	
        <!-- <main> -->
          
</body>
</html>