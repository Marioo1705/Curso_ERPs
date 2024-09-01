// Número de enlaces de la página
function contarEnlaces() {
    var enlaces = document.getElementsByTagName('a');
    console.log('Número total de enlaces:', enlaces.length);
}

// Dirección del penúltimo enlace
function direccionPenultimoEnlace() {
    var enlaces = document.getElementsByTagName('a');
    var penultimoEnlace = enlaces[enlaces.length - 2];
    var hrefPenultimo = penultimoEnlace.href;
    console.log('Dirección del penúltimo enlace:', hrefPenultimo);
}

// Número de enlaces que enlazan a http://prueba
function contarEnlacesPrueba() {
    var enlaces = document.getElementsByTagName('a');
    var contador = 0;
    for (var i = 0; i < enlaces.length; i++) {
        if (enlaces[i].href === 'http://prueba/') {
            contador++;
        }
    }
    console.log('Número de enlaces que enlazan a http://prueba:', contador);
}

// Número de enlaces en el tercer párrafo
function contarEnlacesTercerParrafo() {
    var parrafos = document.getElementsByTagName('p');
    if (parrafos.length >= 3) {
        var tercerParrafo = parrafos[2]; // El tercer párrafo tiene índice 2
        var enlacesTercerParrafo = tercerParrafo.getElementsByTagName('a');
        console.log('Número de enlaces en el tercer párrafo:', enlacesTercerParrafo.length);
    } else {
        console.log('No hay suficientes párrafos en el documento.');
    }
}

contarEnlaces();
direccionPenultimoEnlace();
contarEnlacesPrueba();
contarEnlacesTercerParrafo();
