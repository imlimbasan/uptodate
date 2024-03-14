  const navSlide = () => {
    const burger = document.querySelector(".burger");
    const nav = document.querySelector(".nav-ul");
    const navLinks = document.querySelectorAll(".nav-ul a");
  
    burger.addEventListener("click", () => {
      nav.classList.toggle("nav-active");
  
      navLinks.forEach((link, index) => {
        if (link.style.animation) {
          link.style.animation = "";
        } else {
            link.style.animation = `navLinkFade 0.5s ease forwards ${
                index / 7 + 0.5
              }s `;
        }
      });

      burger.classList.toggle("toggle");

      if (nav.classList.contains("nav-active")) {
        nav.style.display = "flex"; // Afiseaza meniul cand este activat
      } else {
        nav.style.display = "none"; // Ascunde meniul cand este dezactivat
      }
    });
};

navSlide();
