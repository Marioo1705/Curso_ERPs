
function oculta(num){
    var parrafo = document.getElementById("contenidos_" + num);
    var enlace = document.getElementById("enlace_" + num);
    parrafo.style.visibility = "hidden";
    enlace.innerText = "Mostrar Contenido";
    enlace.setAttribute("onclick", "muestra('"+num+"')");
}
function muestra(num){
    var parrafo = document.getElementById("contenidos_" + num);
    var enlace = document.getElementById("enlace_" + num);
    parrafo.style.visibility = "visible";
    enlace.innerText = "Ocultar Contenido";
    enlace.setAttribute("onclick", "oculta('"+num+"')");
}
window.onload = () => {
    var numEnlaces = document.getElementsByTagName("a").length;
    for(let i=1;i<=numEnlaces;i++){
        document.getElementById("enlace_"+i).setAttribute("onclick", "oculta('"+i+"')");
    }
}
