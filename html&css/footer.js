document.addEventListener('DOMContentLoaded', function() {
    var dropbtns = document.querySelectorAll('.dropbtn');
    for (var i = 0; i < dropbtns.length; i++) {
      dropbtns[i].addEventListener('click', function() {
        var dropdownContent = this.nextElementSibling;
        dropdownContent.classList.toggle('show');
      });
    }
  });

  // Închidem meniul dacă utilizatorul face clic în afara lui
  window.addEventListener('click', function(event) {
    if (!event.target.matches('.dropbtn')) {
      var dropdowns = document.querySelectorAll('.dropdown-content');
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  });
  