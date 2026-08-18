// Espero que la pagina termine de cargar
document.addEventListener("DOMContentLoaded", function () {

    // Busco el boton para volver arriba
    const botonArriba = document.getElementById("botonArriba");

    // Reviso si el boton esta en la pagina
    if (botonArriba) {

        // Cuando hago clic vuelvo al inicio
        botonArriba.addEventListener("click", function () {

            window.scrollTo(0, 0);

        });

    }

});