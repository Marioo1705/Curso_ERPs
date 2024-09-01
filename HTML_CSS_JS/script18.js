// Función que devuelve el número de cifras de un entero solicitado al usuario
function numCifras() {
    let numero = prompt("Introduce un número entero:");
    let cifras = numero.length;
    alert("El número de cifras es: " + cifras);
}

// Función que muestra una secuencia de * de longitud solicitada al usuario
function secuenciaEstrellas() {
    let cantidad = prompt("¿Cuántas estrellas (*) quieres ver?");
    let estrellas = '';
    for (let i = 0; i < cantidad; i++) {
        estrellas += '*';
    }
    alert("Secuencia de estrellas: " + estrellas);
}

// Función que muestra la secuencia *+_*+_ de longitud solicitada al usuario
function secuenciaEspecial() {
    let tamSecuencia = prompt("¿Cuántos caracteres debe tener la secuencia *+_?");
    var mostrar = "";
    for (let i = 0; i < tamSecuencia; i++) {
        switch (i % 3) {
            case 0:
                mostrar += '*';
                break;
            case 1:
                mostrar += '+';
                break;
            case 2:
                mostrar += '_';
                break;
        }
    }
    alert(mostrar);
}

// Función que muestra un triángulo de asteriscos con la cantidad de filas solicitada al usuario

function triangulo() {
    let lineas = prompt("¿Cuántas líneas debe tener el triángulo?");
    var mostrar = "";
    for (let i = 0; i < lineas; i++) {
        for (let j = 0; j <= i; j++) {
            mostrar += '*';
        }
        mostrar += '\n'; // \n es el salto de línea
    }
    alert(mostrar);
}

// Función que devuelve la diferencia en días entre dos fechas del mismo año

// ***** Solución 1 *****

function diferenciaFechas1() {
    let fechaDia1 = parseInt(prompt('Día 1')); // Ejemplo: 3
    let fechaMes1 = parseInt(prompt('Mes 1')); // Ejemplo: 1
    let fechaDia2 = parseInt(prompt('Día 2')); // Ejemplo: 5
    let fechaMes2 = parseInt(prompt('Mes 2')); // Ejemplo: 6

    let meses = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    let totalDias = 0;

    // Sumar los días de los meses completos entre fechaMes1 y fechaMes2
    for (let i = fechaMes1; i < fechaMes2; i++) {
        totalDias += meses[i - 1]; // Restar 1 para obtener el índice correcto
    }

    // Ajustar con los días iniciales y finales
    totalDias = totalDias - fechaDia1 + fechaDia2;

    if (totalDias === 1) {
        alert('Falta 1 día');
    } else {
        alert('Faltan ' + totalDias + ' días');
    }
}

// ***** Solución 2 *****

function diferenciaFechas2() {
    let fecha1 = [prompt("Dime el primer día"), prompt("Dime el primer mes")];
    let fecha2 = [prompt("Dime el segundo día"), prompt("Dime el segundo mes")];
    let sumames = 0;
    const meses30 = [4, 6, 9, 11];

    function intercambiaFecha(f1, f2) {
        return [[f2[0], f2[1]], [f1[0], f1[1]]];
    }

    function ordenaFechas(f1, f2) {
        if (f2[1] == f1[1]) {
            if (f2[0] < f1[0]) {
                let fechas = intercambiaFecha(f1, f2);
                f1[0] = fechas[0][0];
                f1[1] = fechas[0][1];
                f2[0] = fechas[1][0];
                f2[1] = fechas[1][1];
            }
        } else {
            if (f2[1] < f1[1]) {
                let fechas = intercambiaFecha(f1, f2);
                f1[0] = fechas[0][0];
                f1[1] = fechas[0][1];
                f2[0] = fechas[1][0];
                f2[1] = fechas[1][1];
            }
        }
    }

    ordenaFechas(fecha1, fecha2);

    if (fecha1[1] != fecha2[1]) {
        for (let i = fecha1[1] - 1; i < (fecha2[1] - 1); i++) {
            if (i == 2) {
                sumames += 28;
            } else {
                if (i == meses30[0] || i == meses30[1] || i == meses30[2] || i == meses30[3]) {
                    sumames += 30;
                } else {
                    sumames += 31;
                }
            }
        }
        if (fecha1[1] == 2) {
            sumames += (28 - fecha1[0]);
        } else {
            if (fecha1[1] == meses30[0] || fecha1[1] == meses30[1] || fecha1[1] == meses30[2] || fecha1[1] == meses30[3]) {
                sumames += (30 - fecha1[0]);
            } else {
                sumames += (31 - fecha1[0]);
            }
        }
    } else {
        sumames += fecha2[0] - fecha1[0];
    }

    alert(sumames);
}

// ***** Solución 2 *****

function esDe30(mes) {
    var encontrado = false;
    var meses30 = [4, 6, 9, 11];
    var i = 0;
    while (i < meses30.length && !encontrado) {
        encontrado = encontrado || meses30[i] == mes;
        i++;
    }
    return encontrado;
}

function sumarDias(mes, resultado) {
    if (mes == 2) {
        resultado = resultado + 28;
    } else {
        if (esDe30(mes)) {
            resultado = resultado + 30;
        } else {
            resultado = resultado + 31;
        }
    }
    return resultado;
}

function diferenciaFechas3() {
    var dia1 = parseInt(prompt("Inserta el primer día"));
    var mes1 = parseInt(prompt("Inserta el primer mes"));
    var dia2 = parseInt(prompt("Inserta el segundo día"));
    var mes2 = parseInt(prompt("Inserta el segundo mes"));

    var resultado = 0;
    if (mes1 == mes2) {
        if (dia1 < dia2) {
            resultado = dia2 - dia1;
        } else {
            resultado = dia1 - dia2;
        }
    } else {
        if (mes1 < mes2) {
            for (let i = (mes1 + 1); i < mes2; i++) {
                resultado = sumarDias(i, resultado);
            }
            resultado = sumarDias(mes1, resultado) + dia2 - dia1;
        } else {
            for (let i = (mes2 + 1); i < mes1; i++) {
                resultado = sumarDias(i, resultado);
            }
            resultado = sumarDias(mes2, resultado) + dia1 - dia2;
        }
    }

    alert(resultado);
}

