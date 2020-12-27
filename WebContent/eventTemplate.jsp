
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    

<% String eid = request.getParameter("eid"); %>
<% String title = request.getParameter("title"); %>
<% String edesc = request.getParameter("edesc"); %>
<% String estart = request.getParameter("estart"); %>
<% String eend = request.getParameter("eend"); %>
<% String eregend = request.getParameter("eregend"); %>
<% String poster = request.getParameter("poster"); %>
<% String org1id = request.getParameter("org1id"); %>
<% String org1contact = request.getParameter("org1contact"); %>
<% String org1email = request.getParameter("org1email"); %>
<% String org2id = request.getParameter("org2id"); %>
<% String org2contact = request.getParameter("org2contact"); %>
<% String org2email = request.getParameter("org2email"); %>
<% String eventtype = request.getParameter("eventtype"); %>
<% String rules = request.getParameter("rules"); %>
<% String eposter = request.getParameter("eposter"); %>
<% String elogo = request.getParameter("elogo"); %>
<% String username = (String)session.getAttribute("username"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amrita Dance Show</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .poster {
            width: 100%;
            height: 400px;
        }
        
        .logo {
            top: 300px;
        }
        
        li {
            list-style: none;
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="post">
            <img src="data:image/jpg;base64,${eposter}" class="img-fluid poster" alt="Responsive image">
        </div>
        <div class="row">
            <div class="col-md-2">
                <img height="150px" column="200px" src="data:image/jpg;base64,${elogo}">
            </div>
            <div class="col-md-8">
                <h1 class="text-primary" style="margin-left:25px;margin-top:5%;font-size:50px;">${title }</h1>
            </div>
        </div>
    </div>
    <div class="content">
        <div>
            <p style="margin-left:15%;">${edesc }</p>
        </div>
    </div>
    <div class="footer">
        <div class="card-group text-white">
            <div class="card bg-info" style="width: 25%; margin-left:10px">
                <div class="card-body">
                    <h3 class="card-title text-center">Contact Info</h3>
                    <ul>
                        <li class="card-text"> <strong>${org1id}</strong>:${org1contact }</li>
                        <li class="card-text"><strong>${org2id }</strong>  ${org2contact }</li>
                    </ul>
                </div>
            </div>
            <div class="card bg-info" style="width: 30%; margin-left:10px">
                <div class="card-body text-center">
                    <p class="card-text">Registration ends at <strong>${eregend }</strong></p>
                    <% System.out.println(session.getAttribute("username")); %>
                    <button class="form-control bg-primary" onclick="location.href='/eventManagement/success?event_id=${eid}&Username=${username}'" style="margin-bottom: 20px;">Register Now</button>
                    <p class="card-text">Event starts at <strong>${estart}</strong></p>
                    <p class="card-text">Event ends at <strong>${eend }</strong></p>


                </div>
            </div>
            <div class="card bg-info" style="width: 30%; margin-left:10px">
                <div class="card-body">
                    <h3 class="card-title text-center">Prizes</h3>
                    <p class="text-center">${rules }</p>
                </div>
            </div>
        </div>

    </div>
</body>

</html>