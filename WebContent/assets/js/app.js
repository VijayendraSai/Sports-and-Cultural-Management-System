/**
 * 
 */
//functions to validate each element
const validateTitle = (element) => {

    return element.length >= 10 && element.length <= 50;
};
const validateDescriptions = (element) => {
    return element.length >= 125;
};
const validateOrganizerName = (element) => {
    return element.length > 0;
};
const validateOrganizerRollNO = (element) => {
    //campus.en.u4(branch should be 3)(Number should be of 5)
    //first two letters should be cb/am/bl
    var req = /[A-Za-z]{2}.[A-Za-z]{2}.[A-Za-z]\d[A-Za-z]{3}\d{5}/;
    return element.value.match(req) && element.value.length > 0;
};

const validStartEndDate = (start, end) => {
    std = new Date(start.value);
    edd = new Date(end.value);
    return std < edd;
};
const validateRegDate = (element, start) => {
    let regdate = new Date(element.value);
    let startdate = new Date(start.value);
    let today = new Date();
    return (regdate.getDate() >= today.getDate()) && (regdate.getDate() <= startdate.getDate());
};


const validateEmail = (myemail) => {
    var req = /\S+@\S+\.\S+/
    return (myemail.value.match(req) != null) && (myemail.value.length > 0);
};

const validatePhone = (element) => {
    var req = /[0-9]+$/;
    return (element.value.match(req) !== null && element.value.length > 0);
};



function displayAnotherUser(element, element2) {
    element.style.display = 'inline';
    element2.style.display = 'none';
    // element2.style.display = 'none';
};

const displaySubmit = (element, status) => {
    element.disabled = !status;
};
//single function to validate all



//extracting elements using dom
var Submitflag = 0; //Checks wether the button is clickable or not! 
const eventtitle = document.querySelector(".eventtitle");
const titlespan = document.querySelector(".titlespan");
const eventdesc = document.querySelector(".eventdesc");
const eventdescspan = document.querySelector(".eventdescspan");
const poster = document.querySelector(".poster");
const posterspan = document.querySelector(".posterspan");
const orgname = document.querySelector(".orgname");
const orgnamespan = document.querySelector(".orgnamespan");
const orgroll = document.querySelector(".orgroll");
const orgrollspan = document.querySelector(".orgrollspan");
const orgphn = document.querySelector(".orgphn");
const orgphnspan = document.querySelector(".orgphnspan");
const orgemail = document.querySelector(".orgemail");
const orgemailspan = document.querySelector(".orgemailspan");
const wsstartd = document.querySelector(".wsstartd");
const wsstartdspan = document.querySelector(".wsstartdspan");
const wsendd = document.querySelector(".wsendd");
const wsenddspan = document.querySelector(".wsenddspan");
const regendd = document.querySelector(".regendd");
const regenddspan = document.querySelector(".regenddspan");
const adduser = document.querySelector(".add-user");
const dontshow = document.querySelector(".dontshow");
const submitbut = document.querySelector(".submitbut");
//Run the validation system every 2 sec
// adduser.onclick = displayAnotherUser(dontshow);
adduser.addEventListener(
    'click', () => { displayAnotherUser(dontshow, adduser); }
);

const validateRegisterEventForm = () => {
    return (validateTitle(eventtitle.value) && (validateDescriptions(eventdesc.value)) &&
            (validateOrganizerName(orgname.value))) && (validateRegDate(regendd, wsstartd)) &&
        (validStartEndDate(wsstartd, wsendd)) && (validateEmail(orgemail)) && (validatePhone(orgphn)) &&
         (validateOrganizerRollNO(orgroll));
};
setInterval(() => {
    // console.log(validateRegisterEventForm());
    if (!validateTitle(eventtitle.value)) {

        titlespan.textContent = "Minimum 10 chars and max of 50";
    } else {

        titlespan.textContent = " ";
    }
    if (!validateDescriptions(eventdesc.value)) {

        eventdescspan.textContent = "Minimum of 125 chars required";
    } else {

        eventdescspan.textContent = " ";
    }
    if (!validateOrganizerName(orgname.value)) {

        orgnamespan.textContent = "One organizer is mandatory";
    } else {

        orgnamespan.textContent = " ";
    }
    if (!validateRegDate(regendd, wsstartd)) {

        regenddspan.textContent = "End date can't be less than today!";
    } else {

        regenddspan.textContent = "";
    }
    if (!validStartEndDate(wsstartd, wsendd)) {

        wsenddspan.textContent = "End can't be before start date";
    } else {

        wsenddspan.textContent = "";
    }
    if (!validateEmail(orgemail)) {

        orgemailspan.textContent = "Please correct your email!";
    } else {

        orgemailspan.textContent = "";
    }
    if (!validatePhone(orgphn)) {

        orgphnspan.textContent = "Please check the phone number!";
    } else {

        orgphnspan.textContent = "";
    }
    
    if (!validateOrganizerRollNO(orgroll)) {
        orgrollspan.textContent = "Please Enter correct roll number";
    } else {
        orgrollspan.textContent = "";
    }
    
    displaySubmit(submitbut, validateRegisterEventForm());
}, 2000);


//testing each
// console.log(validateTitle("I love you 3000"));
// console.log(validateTitle("I love py"));
// console.log(validateTitle("My full name is duddu venkata sai ayyappa hemanth"));