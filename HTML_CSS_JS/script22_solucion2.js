
function muestraOculta(num) {
    var parrafo = document.getElementById("contenidos_" + num);
    var enlace = document.getElementById("enlace_" + num);
    if (parrafo.style.visibility == "visible" ||
        parrafo.style.visibility == "") {
        parrafo.style.visibility = "hidden";
        enlace.innerText = "Mostrar Contenido";
    }
    else {
        parrafo.style.visibility = "visible";
        enlace.innerText = "Ocultar Contenido";
    }
}
window.onload = () => {
    var numEnlaces = document.getElementsByTagName("a").length;
    for(let i=1;i<=numEnlaces;i++){
        document.getElementById("enlace_"+i).setAttribute("onclick", "muestraOculta('"+i+"')");
    }
}
