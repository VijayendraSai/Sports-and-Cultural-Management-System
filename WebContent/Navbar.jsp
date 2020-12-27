<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/eventManagement/assets/css/bootstrap.min.css" />

    <!-- Styles -->
    <link rel="stylesheet" href="/eventManagement/assets/css/style.css" />

    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="/eventManagement/assets/css/mdb.min.css" />
    <style type="text/css">
    	.img-award{
    	width = 50px;
    	height = 50px;
    	}
    </style>
  </head>
  <body>
    <!--Navbar -->
    <% session.getAttribute("user"); %>
    <nav
      class="mb-1 navbar navbar-expand-lg navbar-dark secondary-color lighten-1"
    >

    
      <!-- <a class="navbar-brand" href="home1.html">Xtras</a> -->
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent-555"
        aria-controls="navbarSupportedContent-555"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarSupportedContent-555">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
            <a class="nav-link" href="/eventManagement/employeeregister.jsp">Home </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/eventManagement/club.jsp">Club </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/eventManagement/cultural">Cultural </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/eventManagement/sports">Sports </a>
          </li>
          <li>
          
          <% 
          
          boolean status = false;
			Class.forName("com.mysql.jdbc.Driver");

          try (Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
				Statement st= connection.createStatement();
            	PreparedStatement preparedStatement = connection.prepareStatement("select designation from User where Username = ? ")) {
				preparedStatement.setString(1,(String)session.getAttribute("username") );

				ResultSet rs = preparedStatement.executeQuery();
				status = rs.next();
				session.setAttribute("designation",rs.getString(1));
            }
            catch(SQLException e) {
          }
          
          if("null".equals(session.getAttribute("username"))){
        	  
          }
          else if("admin".equals(session.getAttribute("designation")) || "organizer".equals(session.getAttribute("designation")) )
                  out.println ("<a class='nav-link' href= '/eventManagement/OrganizeForm'>"+ "Organize" + "</a>");
                  
           %>
           </li>
          <li class="nav-item">
            <a class="nav-link" href="/eventManagement/events.jsp">Participate</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/eventManagement/winners.jsp"
              >Champions <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item">
                  <a class="nav-link" href="/eventManagement/SignUp.jsp">Signup</a>
           </li>
          
        </ul>
        
        
        
        <%
        String url="";
        String username = (String)session.getAttribute("username");
        	if(username==null){
        		%>
        		<ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                <a class="nav-link" href="/eventManagement/login">login</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/eventManagement/logout.jsp">Logout</a>
                </li>
              </ul>
        		<% 
        		
        	}else{ %>
        		<ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                

                
                <% if("admin".equals(session.getAttribute("designation")))
                  out.println ("<a class='nav-link' href= '/eventManagement/admin_dashboard.jsp'>"+ session.getAttribute("username")+ "</a>");
                  else 
                	  out.println ("<a class='nav-link' href= '/eventManagement/user_dashboard.jsp'>"+ session.getAttribute("username")+ "</a>");
                  %>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/eventManagement/logout">Logout</a>
                </li>
                
              </ul>
              <% 
        	}
        
        %>
        
      </div>
    </nav>
  </body>

</html>