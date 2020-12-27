<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/eventManagement/assets/css/css.css">
    <title>home</title>
    
</head>
<body >
  <div class="start-body">
    <jsp:include page="Navbar.jsp" />
      
      <div id="demo" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="slide-image" src="/eventManagement/assets/images/dance.png" alt="Los Angeles" >
            <div class="carousel-caption">
              
            </div>   
          </div>
          <div class="carousel-item">
            <img class="slide-image" src="/eventManagement/assets/images/codewars.png" alt="Chicago" >
            <div class="carousel-caption">
            </div>   
          </div>
          <div class="carousel-item">
            <img  class="slide-image" src="/eventManagement/assets/images/athletics.png" alt="New York" >
            <div class="carousel-caption">
              
            </div>   
          </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
      


      <div class="container" style="margin-top:30px">
        <div class="row">
          <div class="col-sm-4">
            <h2>Winners</h2>
            <div class="container">
                <%
                String db = request.getParameter("Xtras");
                try {
                  java.sql.Connection con;
                  Class.forName("com.mysql.jdbc.Driver");
                  con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
                  
                  Statement st= con.createStatement();
                  ResultSet rs=st.executeQuery("select * from achievements a,organize o where a.eventid =o.id ;");
                  for(int i =0 ;rs.next() && i<3 ;i++){
                      
                    out.println("<ul class='list-group'>"
                           + "<li class='list-group-item'>"
                           + "<a data-toggle='tooltip' title='First prize 20000/- cash award' href='#'><i class='fa fa-trophy' aria-hidden='true'> "+rs.getString(2) +"</i> </a>"
                           +"<p> Event Name:"+rs.getString(6)+"<p>"
                        	+"<p> Winner Position:"+rs.getString(2)+"</p>"
                           + "</li>"
                        +"</ul>");
                }
            }
            catch(SQLException e) {
            out.println("SQLException caught: " +e.getMessage());
            }
        %>
                <br>
                <br>
                <div class="card" style="width:300px">
                    <img class="card-img-top" src="/eventManagement/assets/images/event_organize.png" alt="Card image">
                    <div class="card-body">
                      <h4 class="card-title">Want to organise an Event?</h4>
                      <p class="card-text">organise an event in just two clicks!</p>
                      <a href="/eventManagement/OrganizeForm" class="btn btn-light">organise Event</a>
                    </div>
                  </div>
                </div>
              
            <hr class="d-sm-none">
          </div>
          <div class="col-sm-8">
			<jsp:include page="upcoming_events.jsp" />
      
      <div class="jumbotron text-center" style="margin-bottom:0" >
        <p>Copyrights @vaish 2020</p><br>
        <a href="#">About</a>
        <p>
            Event management for various groups can be organised in systematic manner , to make it a perfect event . Just under a click u can organise an event . Life gives you many options , if one does not work . Why to worry just try something else. Have a great day ahead. 
        </p>
      </div>
    </div>
      <script>
        includeHTML();
    </script>
      
      
</body>
</html>