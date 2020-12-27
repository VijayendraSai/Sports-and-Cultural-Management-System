<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>Login</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="./assets/css/login.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

  </head>
  <body>
    <div class="start-body">
      <!-- <div w3-include-html="header_files.html"></div>   -->
      <jsp:include page="Navbar.jsp" />
    <br />
    </div>

    <div class="login-form">
      <form
        action="<%=request.getContextPath()%>/login" method="post"
        onsubmit="return validate()" 
      >
        <div class="avatar">
          
        </div>
        <h2 class="text-center">Member Login</h2>
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            name="username"
            id="username"
            placeholder="Username"
            required="required"
          />
          <span id="username_mssg" style="color:red"></span>
        </div>
        <div class="form-group">
          <input
            type="password"
            class="form-control"
            name="password"
            id="password"
            placeholder="Password"
            required="required"
          />
          <span id="password_mssg" style="color:red"></span>
        </div>
        <div class="form-group">
          <button
            type="submit"
            class="btn btn-primary btn-lg btn-block"
          >
            Sign in
          </button>
        </div>
        <div class="bottom-action clearfix">
          <label class="float-left form-check-label"
            ><input type="checkbox" /> Remember me</label
          >
          <a href="#" class="float-right">Forgot Password?</a>
        </div>
      </form>
      <p class="text-center small">
        Don't have an account? <a href="./register.html">Sign up here!</a>
      </p>
    </div>
    <script>
      includeHTML();
    </script>
  </body>
</html>
