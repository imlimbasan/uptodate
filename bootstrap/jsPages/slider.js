const slides = document.querySelectorAll(".slides img");
let slideIndex = 0;
let interval = setInterval(nextSlide, 5000);

document.addEventListener("DOMContentLoaded", initializeSlider);

function initializeSlider() {
    if (slides.length > 0) {
        slides[slideIndex].classList.add("displaySlide");
    }
}

function prevSlide() {
    clearInterval(interval);
    slideIndex = (slideIndex - 1 + slides.length) % slides.length;
    displaySlide();
}

function nextSlide() {
    slideIndex = (slideIndex + 1) % slides.length;
    displaySlide();
}

function displaySlide() {
    slides.forEach(slide => {
        slide.classList.remove("displaySlide");
    });
    slides[slideIndex].classList.add("displaySlide");
}

