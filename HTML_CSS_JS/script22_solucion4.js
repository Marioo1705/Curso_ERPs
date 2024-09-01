
function oculta(enlace, parrafo){
    parrafo.style.visibility = "hidden";
    enlace.innerText = "Mostrar Contenido";
    enlace.setAttribute("onclick", "muestra(this,document.getElementById('"+parrafo.id+"'))");
}
function muestra(enlace, parrafo){
    parrafo.style.visibility = "visible";
    enlace.innerText = "Ocultar Contenido";
    enlace.setAttribute("onclick", "oculta(this,document.getElementById('"+parrafo.id+"'))");
}
window.onload = () => {
    var numEnlaces = document.getElementsByTagName("a").length;
    for(let i=1;i<=numEnlaces;i++){
        document.getElementById("enlace_"+i).setAttribute("onclick", "oculta(this, document.getElementById('contenidos_"+i+"'))");
    }
}
