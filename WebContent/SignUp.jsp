<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Register</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href='../css/register.css' rel="stylesheet" media="all">
    <script src="../js/register.js"></script>
<style>
    /* ==========================================================================
   #FONT
   ========================================================================== */
   .font-robo {
    font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  }
  
  .font-poppins {
    font-family: "Poppins", "Arial", "Helvetica Neue", sans-serif;
  }
  
  /* ==========================================================================
     #GRID
     ========================================================================== */
  .row {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }
  
  .row-space {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -moz-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }
  
  .col-2 {
    width: -webkit-calc((100% - 30px) / 2);
    width: -moz-calc((100% - 30px) / 2);
    width: calc((100% - 30px) / 2);
  }
  
  @media (max-width: 767px) {
    .col-2 {
      width: 100%;
    }
  }
  
  /* ==========================================================================
     #BOX-SIZING
     ========================================================================== */
  /**
   * More sensible default box-sizing:
   * css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice
   */
  html {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }
  
  * {
    padding: 0;
    margin: 0;
  }
  
  *, *:before, *:after {
    -webkit-box-sizing: inherit;
    -moz-box-sizing: inherit;
    box-sizing: inherit;
  }
  
  /* ==========================================================================
     #RESET
     ========================================================================== */
  /**
   * A very simple reset that sits on top of Normalize.css.
   */
  body,
  h1, h2, h3, h4, h5, h6,
  blockquote, p, pre,
  dl, dd, ol, ul,
  figure,
  hr,
  fieldset, legend {
    margin: 0;
    padding: 0;
  }
  
  /**
   * Remove trailing margins from nested lists.
   */
  li > ol,
  li > ul {
    margin-bottom: 0;
  }
  
  /**
   * Remove default table spacing.
   */
  table {
    border-collapse: collapse;
    border-spacing: 0;
  }
  
  /**
   * 1. Reset Chrome and Firefox behaviour which sets a `min-width: min-content;`
   *    on fieldsets.
   */
  fieldset {
    min-width: 0;
    /* [1] */
    border: 0;
  }
  
  button {
    outline: none;
    background: none;
    border: none;
  }
  
  /* ==========================================================================
     #PAGE WRAPPER
     ========================================================================== */
  .page-wrapper {
    min-height: 100vh ;
  }
  
  .heading{
    top: 20px;
    margin-left: 10px;
    margin-right: 20px;
    height: 60px;
    width: 99%;
    position: relative;
    color: white;
    border-radius: 3px;
    box-sizing: border-box;
    background-color:rgba(171, 0, 229, 1);
  }
  
  .comp{
    float: left;
    padding-left: 10px;
    padding-top: 5px;
    font-weight: 500;
  }
  
  .link{
    float: right;
    padding-top: 20px;
    margin-right: 15px;
    font-size: 17px;
    font-weight: 450;
    cursor: pointer;
    box-sizing: border-box;
    color: #fff;
    text-decoration: none; 
  }
  
  
  body {
    margin: 0;
    padding: 0;
    font-family: "Poppins", "Arial", "Helvetica Neue", sans-serif;
    font-weight: 400;
    font-size: 14px;
    background: none;
    
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-weight: 400;
  }
  
  h1 {
    font-size: 36px;
  }
  
  h2 {
    font-size: 30px;
  }
  
  h3 {
    font-size: 24px;
  }
  
  h4 {
    font-size: 18px;
  }
  
  h5 {
    font-size: 15px;
  }
  
  h6 {
    font-size: 13px;
  }
  
  /* ==========================================================================
     #SPACING
     ========================================================================== */
  .p-t-100 {
    padding-top: 100px;
  }
  
  .p-t-130 {
    padding-top: 40px;
  }
  
  .p-t-180 {
    padding-top: 180px;
  }
  
  .p-t-20 {
    padding-top: 20px;
  }
  
  .p-t-15 {
    padding-top: 15px;
  }
  
  .p-t-10 {
    padding-top: 10px;
  }
  
  .p-t-30 {
    padding-top: 30px;
  }
  
  .p-b-100 {
    padding-bottom: 70px;
  }
  
  .m-r-45 {
    margin-right: 45px;
  }
  
  /* ==========================================================================
     #WRAPPER
     ========================================================================== */
  .wrapper {
    margin: 0 auto;
  }
  
  .wrapper--w960 {
    max-width: 960px;
  }
  
  .wrapper--w780 {
    max-width: 780px;
  }
  
  .wrapper--w680 {
    max-width: 680px;
  }
  
  /* ==========================================================================
     #BUTTON
     ========================================================================== */
  .btn {
    display: inline-block;
    line-height: 50px;
    padding: 0 50px;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    cursor: pointer;
    font-size: 18px;
    color: #fff;
    font-family: "Poppins", "Arial", "Helvetica Neue", sans-serif;
  }
  
  .btn--radius {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
  }
  
  .btn--radius-2 {
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
  }
  
  .btn--pill {
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    border-radius: 20px;
  }
  
  .btn--green {
    background: #57b846;
  }
  
  .btn--green:hover {
    background: #4dae3c;
  }
  
  .btn--blue {
    background: #4272d7;
  }
  
  .btn--blue:hover {
    background: #3868cd;
  }
  
  /* ==========================================================================
     #DATE PICKER
     ========================================================================== */
  td.active {
    background-color: #2c6ed5;
  }
  
  input[type="date" i] {
    padding: 13px;
  }
  
  .table-condensed td, .table-condensed th {
    font-size: 14px;
    font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
    font-weight: 400;
  }
  
  .daterangepicker td {
    width: 40px;
    height: 30px;
  }
  
  .daterangepicker {
    border: none;
    -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    display: none;
    border: 1px solid #e0e0e0;
    margin-top: 5px;
  }
  
  .daterangepicker::after, .daterangepicker::before {
    display: none;
  }
  
  .daterangepicker thead tr th {
    padding: 5px 0;
  }
  
  .daterangepicker .table-condensed th select {
    border: 1px solid #ccc;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    font-size: 14px;
    padding: 5px;
    outline: none;
  }
  
  /* ==========================================================================
     #FORM
     ========================================================================== */
  input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
  }
  
  .input--style-4 {
    line-height: 40px;
    background: #fafafa;
    -webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
    -moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
    box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    padding: 0 20px;
    font-size: 16px;
    color: #666;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
  }
  
  .input--style-4::-webkit-input-placeholder {
    /* WebKit, Blink, Edge */
    color: #666;
  }
  
  .input--style-4:-moz-placeholder {
    /* Mozilla Firefox 4 to 18 */
    color: #666;
    opacity: 1;
  }
  
  .input--style-4::-moz-placeholder {
    /* Mozilla Firefox 19+ */
    color: #666;
    opacity: 1;
  }
  
  .input--style-4:-ms-input-placeholder {
    /* Internet Explorer 10-11 */
    color: #666;
  }
  
  .input--style-4:-ms-input-placeholder {
    /* Microsoft Edge */
    color: #666;
  }
  
  .label {
    font-size: 16px;
    color: rgb(70, 67, 67);
    text-transform: capitalize;
    display: block;
    margin-bottom: 5px;
  }
  
  .radio-container {
    display: inline-block;
    position: relative;
    padding-left: 30px;
    cursor: pointer;
    font-size: 16px;
    color: rgb(87, 84, 84);
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  
  .radio-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
  }
  
  .radio-container input:checked ~ .checkmark {
    background-color: #ffffff;
  }
  
  .radio-container input:checked ~ .checkmark:after {
    display: block;
  }
  
  .radio-container .checkmark:after {
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    width: 12px;
    height: 12px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    background: #57b846;
  }
  
  .checkmark {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    left: 0;
    height: 20px;
    width: 20px;
    background-color: #ffffff;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    -webkit-box-shadow: inset 0px 1px 3px 0px rgba(255, 255, 255, 0.08);
    -moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
    box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  }
  
  .checkmark:after {
    content: "";
    position: absolute;
    display: none;
  }
  
  .input-group {
    position: relative;
    margin-bottom: 22px;
  }
  
  .input-group-icon {
    position: relative;
  }
  
  .input-icon {
    position: absolute;
    font-size: 18px;
    color: #999;
    right: 18px;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    cursor: pointer;
  }
  
  
  
  /* ==========================================================================
     #TITLE
     ========================================================================== */
  .title {
    font-size: 24px;
    color: #525252;
    font-weight: 400;
    margin-bottom: 40px;
  }
  
  /* ==========================================================================
     #CARD
     ========================================================================== */
  .card {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    background: rgb(233, 217, 217);
    margin-top: 30px;
  }
  
  .card-4 {
    background: rgb(233, 217, 217);
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    box-shadow: 10px 8px 20px 0px rgba(0, 0, 0, 0.15);
  }
  
  .card-4 .card-body {
    padding: 57px 65px;
    padding-bottom: 65px;
  }
  
  @media (max-width: 767px) {
    .card-4 .card-body {
      padding: 50px 40px;
    }
  }
</style>
</head>

<body>

    <div class="heading">
        <h1 class="comp">Xtras</h1>
        <a href="Login.html" class="link">Login</a>
    </div>

    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Sign up</h2>
                    <form action = "SignUp" name="RegForm" method="post" onsubmit="return ValidationForm()">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">first name</label>
                                    <input class="input--style-4" type="text" name="first_name" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">last name</label>
                                    <input class="input--style-4" type="text" name="last_name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Date Of Birth</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="date" name="birthday" required>
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender" value="M">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender" value="F">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label class="label">Designation</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">admin
                                            <input type="radio" checked="checked" name="designation" value="admin">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">student
                                            <input type="radio" name="designation" value="student">
                                            <span class="checkmark"></span>
                                        </label></br></br>
                                        <label class="radio-container">organizer
                                            <input type="radio" name="designation">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone" required>
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Username</label>
                                    <input class="input--style-4" type="text" name="uname" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" id="pass" name="pass" required>
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
<script>
function ValidationForm() {
    let username = document.forms["RegForm"]["uname"];
    let email = document.forms["RegForm"]["email"];
    let phoneNumber = document.forms["RegForm"]["phone"];
    var phn_format = /^[0-9]\w{10}$/;
    let pass = document.forms["RegForm"]["Pass"];
    if(username.value == "") {
      alert("Please enter your name.");
      username.focus();
      return false;
    }
    if(email.value == "") {
      alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
    }
    if(email.value.indexOf("@", 0) < 0) {
      alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
    }
    if(email.value.indexOf(".", 0) < 0) {
      alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
    }
    if(phoneNumber.value == "") {
      alert("Please enter your phone number.");
      phoneNumber.focus();
      return false;
    }
    if(phoneNumber.value == "") {
      alert("Please enter your phone number.");
      phoneNumber.focus();
      return false;
    }
    if(pass.value == "") {
      alert("Please enter your password");
      pass1.focus();
      return false;
    }
    if(CheckPassword(pass.value) != "true"){
      alert("Password is not strong")
      return false
    }
    alert("User Registration Successful");
    return true;
  }

function CheckPassword(inputtxt) { 
  var passw= /^(?=.*[a-z])(?=.*[A-Z]).{5,10}$/;
  if(passw.test(inputtxt)) 
  { 
    return true;
  }
  return false;
}</script>
</html>
<!-- end document-->