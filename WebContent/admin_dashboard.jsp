 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN-DASHBOARD</title>
    </head>
<body>

 <div class="start-body">
           
     <jsp:include page="Navbar.jsp" />
    <br><br><br><br>
    
    <h2> <a href="privilages.jsp" class="btn btn-outline-info" >Provide privilages</a>  </h2>&nbsp;
    <h2> <a href="Award.jsp" class="btn btn-outline-info" >Award Prizes</a>  </h2>&nbsp;
    <jsp:include page="edit.jsp"></jsp:include>
</div>
</body>
</html>