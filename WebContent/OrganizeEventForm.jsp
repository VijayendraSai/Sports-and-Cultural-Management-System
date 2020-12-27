<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegisterEvent</title>
    <script src="https://kit.fontawesome.com/cf0996add5.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .green-border-focus .form-control:focus {
            border: 1px solid #8bc34a;
            box-shadow: 0 0 0 0.2rem rgba(139, 195, 74, .25);
        }
        
        .extra-margin {
            margin-top: 55px;
        }
        
        .helper-block {
            color: red;
        }
    </style>
</head>

<body>
   <jsp:include page="Navbar.jsp"></jsp:include>

    <div class="card" style="width: 50%; margin-left:25%; margin-top:5%;">
        <div class="card-body bg-light  mainForm">
            <p class="h4 mb-4  text-center"><strong>Let's Create An Event</strong></p>

            <form method="POST" action="<%= request.getContextPath() %>/Success" enctype="multipart/form-data">
                <div class="form-group  green-border-focus">
                    <label for="title">Event Title</label>
                    <input type="text" class="form-control eventtitle" id="title" placeholder="Event Title" name="title">
                    <span class="helper-block titlespan"></span>
                </div>
                <div class="form-group green-border-focus">
                    <label for="description">Description of event</label>
                    <textarea class="form-control eventdesc" id="description" rows="3" name="description"></textarea>
                    <span class="helper-block eventdescspan"></span>
                </div>
                <div class="form-group green-border-focus">
                    <div class="input-group">
                        <div class="event-poster">
                            <span class="input-group-text" id="event-poster">Event Poster</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="uploadeventposter" aria-describedby="event-poster" accept='image/jpeg' name="poster">
                            <label class="custom-file-label" for="uploadeventposter">Choose file</label>

                        </div>

                    </div>
                    <span class="helper-block text-muted">*Only jpeg allowed</span>
                </div>
                <div class="form-group green-border-focus">
                    <div class="input-group">
                        <div class="event-logo">
                            <span class="input-group-text" id="event-logo">Event logo</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="uploadeventlogo" aria-describedby="event-logo" accept='image/jpeg' name="logo">
                            <label class="custom-file-label" for="uploadeventlogo">Choose file</label>
                        </div>
                    </div>
                    
                    
                    	<span class="helper-block text-muted">*Only jpeg allowed</span>
                   
                </div>
                <div class="form-group green-border-focus">
                    <label for="start-date">WorkShop Start Date</label>
                    <input type="date" class="form-control wsstartd" id="start-date" name="startdate">
                    <span class="helper-block text-muted wsstartdspan"></span>
                </div>
                <div class="form-group green-border-focus">
                    <label for="end-date">WorkShop End Date</label>
                    <input type="date" class="form-control wsendd" id="end-date" name="enddate">
                    <span class="helper-block wsenddspan"></span>
                </div>
                <div class="form-group green-border-focus">
                    <label for="reg-end-date">Registration End Date</label>
                    <input type="date" class="form-control regendd" id="reg-end-date" name="regend">
                    <span class="helper-block regenddspan"></span>
                </div>
                <div class="form-group green-border-focus">
                	<label for="etypes">Choose an event type:</label>
					<select name="etypes" id="etypes">
					  <option value="other">other</option>
					  <option value='Cultural'>Cultural</option>
					  <option value="clubs">clubs</option>
					  <option value="sports">sports</option>
					</select>
                </div>

                <div class="form-group  green-border-focus extra-margin">
                    <label for="orgname">Name of the organizer1</label>
                    <input type="text" class="form-control orgname" id="orgname" placeholder="Name of the organizer" >
                    <span class="helper-block orgnamespan"></span>
                </div>
                <div class="form-group  green-border-focus">
                    <label for="orgRoll">Organizer RollNumber1</label>
                    <input type="text" class="form-control orgroll" id="orgRoll" placeholder="Organizer RollNumber" name="idone">
                    <span class="helper-block orgrollspan"></span>
                </div>
                <div class="form-group  green-border-focus">
                    <label for="phn">Phone Number</label>
                    <input type="text" class="form-control orgphn" id="phn" placeholder="Phone Number" name="contactone">
                    <span class="helper-block orgphnspan"></span>
                </div>
                <div class="form-group  green-border-focus">
                    <label for="em">Email Address</label>
                    <input type="text" class="form-control orgemail" id="em" placeholder="Email Address" name="emailone">
                    <span class="orgemailspan helper-block"></span>
                </div>
                <div class="add-user">
                    <button class="btn btn-primary" type="button"><i class="fas fa-user-plus"></i></button>
                </div>
                <div class="dontshow" style="display: none;">
                    <div class="form-group  green-border-focus extra-margin">
                        <label for="orgname">Name of the organizer2</label>
                        <input type="text" class="form-control" id="orgname" placeholder="Name of the organizer">

                    </div>
                    <div class="form-group  green-border-focus">
                        <label for="orgRoll">Organizer RollNumber2</label>
                        <input type="text" class="form-control" id="orgRoll" placeholder="Organizer RollNumber" name="idtwo">

                    </div>
                    <div class="form-group  green-border-focus">
                        <label for="phn">Phone Number</label>
                        <input type="tel" class="form-control" id="phn" placeholder="Phone Number" name="contacttwo">
                    </div>
                    <div class="form-group  green-border-focus">
                        <label for="em">Email Address</label>
                        <input type="email" class="form-control" id="em" placeholder="Email Address" name="emailtwo">
                    </div>
                </div>
                <div class="form-group green-border-focus extra-margin">
                    <label for="description">Perks for participants</label>
                    <textarea class="form-control" id="description" rows="3" name="rules"></textarea>
                </div>

                <div class="form-group">
                    <button type="Submit" class="form-control col-md-3  btn btn-primary submitbut">Submit</button>
                </div>

            </form>
        </div>
    </div>
  <!--  
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
-->
</body>

</html>
