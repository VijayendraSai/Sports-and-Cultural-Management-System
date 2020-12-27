function validate() {
  console.log("Validate function");
  var username = document.getElementById("username").value;
  var password = document.getElementById("password").value;
  var passwordRGEX = /^(?=.*[a-z])(?=.*[A-Z]).{5,10}$/;
  var passwordResult = passwordRGEX.test(password);
  if (password.length < 5) {
    document.getElementById("password_mssg").innerHTML =
      "<img src='https://img.icons8.com/officexs/16/000000/delete-sign.png' style='padding-top:5px'/> Password must be at least 5 characters long.";
    return false;
  } else if (!passwordResult) {
    document.getElementById("password_mssg").innerHTML =
      "<img src='https://img.icons8.com/officexs/16/000000/delete-sign.png' style='padding-top:5px'/> Please enter a valid password.";
    return false;
  } else if (username == "17618" && password == "Vijay") {
    alert("Login successfull!");
    // window.location.href = "Event.html"; // Redirecting to other page.
    return true;
  } else {
    return false;
  }
}

