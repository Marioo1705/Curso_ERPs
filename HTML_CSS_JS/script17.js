// Ejercicio 11 - Función Declarada
function ejercicio11() {
    let n1 = prompt("Inserta un número");
    let n2 = prompt("Inserta otro número");
    let n3 = prompt("Inserta un tercer número");
    if (n1 <= n2 && n1 <= n3) {
        alert('El número menor es ' + n1); 
    } else if (n2 <= n1 && n2 <= n3) {
        alert('El número menor es ' + n2); 
    } else {
        alert('El número menor es ' + n3);
    }
}

// Ejercicio 12 - Función expresión
const ejercicio12 = function() {
    let frase = prompt("Introduce una frase");
    let letra = prompt("Introduce una letra");
    let contadorLetras = 0;
    for (let i = 0; i < frase.length; i++) {
        if (frase[i] == letra) {
        contadorLetras++;
        }
    }
    alert('La letra '+letra+' aparece '+contadorLetras+' veces en la frase.');
};

// Ejercicio 13 - Función Declarada
function ejercicio13() {
    let num1 = parseFloat(prompt("Elige un número real"));
    let num2 = parseFloat(prompt("Elige otro número real"));
    let operacion = prompt("Suma(1) o resta(2) dos números");
    let resultado;
    
    if (operacion == 1) {
        resultado = num1 + num2;
        alert('La suma de los dos números es ' + resultado);
    } else if (operacion == 2) {
        resultado = num1 - num2;
        alert('La resta de los dos números es ' + resultado);
    } else {
        alert('Las opciones válidas solo eran 1 o 2');
    }
}

// Ejercicio 14 - Función Flecha
const ejercicio14 = () => {   
    const usuarioCorrecto = "mario";
    const passCorrecto = '123';
    const maximoIntentos = 3;
    let numeroIntentos = 0; 
    while (numeroIntentos < maximoIntentos) {
        let usuario = prompt("Introduce tu usuario");
        let pass = prompt("Introduce tu password");
        if (usuario === usuarioCorrecto && pass === passCorrecto) {
            alert('Acceso concedido');
            return;
        }
        else {
            numeroIntentos++;
            let intentosRestantes = maximoIntentos - numeroIntentos;
            if (intentosRestantes == 0) {
                alert('Acceso denegado');
                return;
            }
            alert('Datos incorrectos, te quedan '+intentosRestantes+' intentos');
        }
    }    
};

// Ejercicio 15 - Función Declarada
function ejercicio15() {
    let letraEjer15 = prompt("Introduce una letra");
    switch (letraEjer15) {
        case 'a':
            alert('7');
            break;
        case 'b':
            alert('9');
            break;
        case 'c':
            alert('101');
            break;
        default:
            alert('Se ha equivocado de letra');
    }
}

// Ejercicio 16 - Función Flecha
const ejercicio6 = () => {
    let lista = ['en', 'un', 'lugar', 'de', 'la', 'mancha', 'cuyo'];
    let n = lista.length;
    console.log(lista); // Mostramos, por consola, la lista desordenada
    // Algoritmo de burbuja
    for (let k = 1; k < n; k++) {
        for (let i = 0; i < (n - k); i++) {
            if (lista[i] > lista[i + 1]) {
                let aux = lista[i];
                lista[i] = lista[i + 1];
                lista[i + 1] = aux;
            }
        }
    }
    console.log(lista); // Mostramos, por consola, la lista ya ordenada
};
