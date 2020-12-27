<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Winners</title>

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
    <link rel="stylesheet" type="text/css" href="./assets/css/main_winners.css" />

    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="./assets/css/mdb.min.css" />
  </head>
  <body>
    <div class="page">
        <div class="start-body">
            <jsp:include page="Navbar.jsp" />
          <br />
        </div>
      
      <div class="limiter">
        <div class="container-table100">
          <div class="wrap-table100">
            <div class="table100 ver1 m-b-110">
              <div class="table100-head">
                <table>
                  <thead>
                    <tr class="row100 head">
                      <th class="cell100 column1">Event name</th>
                      <th class="cell100 column2">Event Type</th>
                      <th class="cell100 column3">Date</th>
                      <th class="cell100 column4">Winner Name</th>
                      <th class="cell100 column5">Winner Position</th>
                    </tr>
                  </thead>
                </table>
              </div>

              <div class="table100-body js-pscroll">
                <%
                String db = request.getParameter("Xtras");
                try {
                  java.sql.Connection con;
                  Class.forName("com.mysql.jdbc.Driver");
                  con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncp_proj?useTimezone=true&serverTimezone=UTC", "root", "");
                  
                  Statement st= con.createStatement();
                  ResultSet rs=st.executeQuery("select * from achievements a,organize o where a.eventid =o.id ;");
                  for(int i =0 ;rs.next();i++){
                      
                    out.println("<table>"
                  + "<tbody>"
                    + "<tr class='row100 body'>"
                        + "<td class='cell100 column1'>"+ rs.getString(6) +"</td>"
                        + "<td class='cell100 column2'>"+ rs.getString(19) +"</td>"
                        + "<td class='cell100 column3'>"+ rs.getString(11) +"</td>"
                        + "<td class='cell100 column4'>"+ rs.getString(1) +"</td>"
                        + "<td class='cell100 column5'>"+ rs.getString(2) +"</td>"
                        + "</tr>"
                    + "</tbody>"
                + "</table>");
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