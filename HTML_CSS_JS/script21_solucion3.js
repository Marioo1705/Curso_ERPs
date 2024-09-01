
const contarDinero = (...valores) => {
    let dinero = [["500", "200", "100", "50", "20", "10", "5", "2", "1",
        "0.50", "0.20", "0.10", "0.05", "0.02", "0.01"], valores];
    return dinero;
}
const calcularTotal = function (caja) {
    const keys = caja[0];
    const values = caja[1];
    let total = 0;
    for (let i = 0; i < keys.length; i++) {
        total += (Number(keys[i]) * values[i]);
        // console.log(total);
    }
    caja[0].push("total")
    caja[1].push(Math.round(total * 100) / 100);
    return caja;
}
function vaciarCaja(caja) {
    const values = caja[1];
    for (let i = 0; i < values.length; i++) {
        values[i] = 0;
        // console.log(caja[keys[i]]);
    }
    return caja;
}
function mostrarCambio(dinero) {
    let cadenaCambio = "Devolución: \n";
    const keys = dinero[0];
    const values = dinero[1];
    for (let i = 0; i < keys.length; i++) {
        cadenaCambio += `${keys[i]}: ${values[i]} \n`;
    }
    alert(cadenaCambio);
}
function primerElemento(parteEntera, dinero) {
    // const values = dinero[1];
    const keys = dinero[0];
    // console.log(parteEntera);
    let i = 0;
    let encontrado = false;
    while (i < keys.length && !encontrado) {
        if (keys[i] <= parteEntera) {
            encontrado = true;
        }
        i++;
    }
    return i - 1;
}
function inicializarCambio(cambio, posicion) {
    for (let i = 0; i < posicion; i++) {
        cambio[1][i] = 0;
    }
    return cambio;
}
function recopilarCambio(devolver, caja, cambio, posicion) {
    if (devolver >= caja[0][posicion]) {
        // console.log("Entro aquí");
        // console.log("caja[0][posicion]: ", caja[0][posicion]);
        var parte1 = Math.floor(devolver / Number(caja[0][posicion]));
        // console.log("parte1: ", parte1);
        // console.log("caja[1][posicion]: ", caja[1][posicion]);
        if (parte1 <= caja[1][posicion]) {
            caja[1][posicion] = caja[1][posicion] - parte1;
            cambio[1][posicion] = (parte1);
            devolver = devolver - Number(parte1 * caja[0][posicion]);
            console.log(caja[0][posicion]);
        } else {
            if (caja[1][posicion] > 0) {
                cambio[1][posicion] = (caja[1][posicion]);
                devolver = devolver - Number(caja[0][posicion]) * caja[1][posicion];
                caja[1][posicion] = 0;
            }
            // console.log(caja[0][posicion]);
        }
    }
    devolver = Math.round(devolver * 100) / 100
    // console.log("devolver: ", devolver);
    return [devolver, caja, cambio];
}
let caja = contarDinero(0, 0, 0, 1, 4, 8, 2, 5, 4, 0, 0, 1, 2, 3, 1);
// console.log(caja);
let pago = contarDinero(0, 0, 0, 0, 2, 1, 0, 0, 1, 2, 6, 0, 0, 1, 0);
caja = calcularTotal(caja);
pago = calcularTotal(pago);
let precio = 32.95;
let cambio = [[], []];
let devolver = pago[1][pago[1].length - 1] - precio;
devolver = Math.round(devolver * 100) / 100
if (devolver > caja[1][caja[1].length - 1]) {
    alert("No disponemos de cambio para tu compra, gracias y hasta luego");
} else {
    if (devolver == caja[1][caja[1].length - 1]) {
        cambio[0] = caja[0].slice();
        cambio[1] = caja[1].slice();
        caja = vaciarCaja(caja);
        mostrarCambio(cambio);
    } else {
        let posicion = (primerElemento(devolver, caja));
        cambio = [["500", "200", "100", "50", "20", "10", "5", "2", "1",
            "0.50", "0.20", "0.10", "0.05", "0.02", "0.01"], []];
        inicializarCambio(cambio, cambio[0].length);
        // function recopilarCambio(devolver, caja, cambio, posicion) {
        for (let i = posicion; i < caja[1].length - 1; i++) {
            [devolver, caja, cambio] = recopilarCambio(devolver, caja, cambio, i);
        }
        mostrarCambio(cambio);
        // console.log(devolver);
        // console.log(caja);
        // console.log(cambio);
    }
}
// TE FALTA DINERO
// NO HAY CAMBIO
