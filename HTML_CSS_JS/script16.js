function burbuja() {
    let lista = ['en', 'un', 'lugar', 'de', 'la', 'mancha', 'cuyo'];
    let aux;
    alert('La lista desordenada es: '+lista); // Mostramos la lista desordenada
    // Algoritmo de burbuja
    for (let i = 0; i < lista.length-1; i++) {
        for (let j = 0; j < lista.length-1; j++) {
            if (lista[j] > lista[j + 1]) {
                aux = lista[j];
                lista[j] = lista[j + 1];
                lista[j + 1] = aux;
            }
        }
    }
    alert('La lista ordenada es: '+lista); // Mostramos la lista ordenada
}