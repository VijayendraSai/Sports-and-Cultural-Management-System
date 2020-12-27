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
}
