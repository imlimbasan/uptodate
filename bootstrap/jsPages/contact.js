document.querySelectorAll(".form-control").forEach(function(input) {
    input.addEventListener("input", function() {
        validateInput(this);
    });
    input.addEventListener("change", function() {
        validateInput(this);
    });
});

function validateInput(input) {
    if (input.checkValidity()) {
        input.classList.remove("is-invalid");
    } else {
        input.classList.add("is-invalid");
    }
}

document.getElementById("myForm").addEventListener("submit", function(event) {
    event.preventDefault(); 
    var form = document.getElementById("myForm");
    if (form.checkValidity()) {
        document.getElementById("successAlert").classList.remove("d-none");
        form.reset(); 
        window.scrollTo({
            top: 0,
            left: document.body.scrollWidth, 
            behavior: 'smooth'
        });
    } else {
        form.classList.add("was-validated"); 
    }
});
