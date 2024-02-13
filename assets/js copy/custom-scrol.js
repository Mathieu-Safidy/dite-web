let lastScrollTop = 0;

window.addEventListener("scroll", function() {
    let currentScroll = window.pageYOffset || document.documentElement.scrollTop;
    if (currentScroll > lastScrollTop) {
        // Scroll vers le bas
        document.getElementById("header").classList.add("header-hidden");
        document.getElementById("sidebar").classList.add("sidebar-moov");
    } else {
        // Scroll vers le haut
        document.getElementById("header").classList.remove("header-hidden");
        document.getElementById("sidebar").classList.remove("sidebar-moov");
    }
    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // Pour gérer le comportement lors du retour en haut de la page
}, false);
