const submitbutton = document.getElementById("submit");

submitbutton.addEventListener("click", function() {
    const fnameFromUser = document.getElementById("fname");
    const fname = fnameFromUser.value;
    const lnameFromUser = document.getElementById("lname");
    const lname = lnameFromUser.value;
    const emailFromUser = document.getElementById("email");
    const email = emailFromUser.value;

    if (email.includes('@')) {
        let myObj = {
            fname: fname,
            lname: lname,
            email: email
        };
    
    let storage = localStorage.length;
    let finalResult="myObject"+ storage;
   
    
    let myObj_serialized = JSON.stringify(myObj);
    localStorage.setItem(finalResult, myObj_serialized);

    console.log(myObj);
    }
    else {
     
        alert("Introdu o adresa de e-mail valida.");
    }


});

window.onload = function() {
    let myObj_deserialized = JSON.parse(localStorage.getItem("myObj"));
    console.log(myObj_deserialized);
  
};


function displayCounter() {
    var counterElement = document.getElementById("counter");
    var counterLength = localStorage.length;
    counterElement.innerText = '' + counterLength;
}

displayCounter();


document.getElementById("submit").addEventListener("click", function(event) {
    event.preventDefault();
    displayCounter();
});