
//pos 0 = 500; y ultima casilla importe total

let caja = [0, 0, 0, 1, 4, 8, 2, 5, 4, 0, 0, 1, 2, 3, 1, 0.0];

const precioArticulo = 1050;

let pago = [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0];

let devolucion = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0];

function dineroTotal(dinero) {
  for (let i = 0; i < dinero.length - 1; i++) {
    if (dinero[i] != 0) {
      switch (i) {
        case 0:
          dinero[dinero.length - 1] = 500 * dinero[i];
          break;
        case 1:
          dinero[dinero.length - 1] += 200 * dinero[i];
          break;
        case 2:
          dinero[dinero.length - 1] += 100 * dinero[i];
          break;
        case 3:
          dinero[dinero.length - 1] += 50 * dinero[i];
          break;
        case 4:
          dinero[dinero.length - 1] += 20 * dinero[i];
          break;
        case 5:
          dinero[dinero.length - 1] += 10 * dinero[i];
          break;
        case 6:
          dinero[dinero.length - 1] += 5 * dinero[i];
          break;
        case 7:
          dinero[dinero.length - 1] += 2 * dinero[i];
          break;
        case 8:
          dinero[dinero.length - 1] += 1 * dinero[i];
          break;
        case 9:
          dinero[dinero.length - 1] += 0.5 * dinero[i];
          break;
        case 10:
          dinero[dinero.length - 1] += 0.2 * dinero[i];
          break;
        case 11:
          dinero[dinero.length - 1] += 0.1 * dinero[i];
          break;
        case 12:
          dinero[dinero.length - 1] += 0.05 * dinero[i];
          break;
        case 13:
          dinero[dinero.length - 1] += 0.02 * dinero[i];
          break;
        case 14:
          dinero[dinero.length - 1] += 0.01 * dinero[i];
          break;
      }
    }
  }
  dinero[dinero.length - 1] = dinero[dinero.length - 1].toFixed(2);
}
dineroTotal(pago);
dineroTotal(caja);
// console.log(pago);
// console.log(caja);
function mostrarDinero(dinero) {
  let mostrar = "";
  for (let i = 0; i < dinero.length - 1; i++) {
    if (dinero[i] != 0) {
      switch (i) {
        case 0:
          mostrar += "Hay " + dinero[i] + " billetes de 500 \n";
          break;
        case 1:
          mostrar += "Hay " + dinero[i] + " billetes de 200 \n";
          break;
        case 2:
          mostrar += "Hay " + dinero[i] + " billetes de 100 \n";
          break;
        case 3:
          mostrar += "Hay " + dinero[i] + " billetes de 50 \n";
          break;
        case 4:
          mostrar += "Hay " + dinero[i] + " billetes de 20 \n";
          break;
        case 5:
          mostrar += "Hay " + dinero[i] + " billetes de 10 \n";
          break;
        case 6:
          mostrar += "Hay " + dinero[i] + " billetes de 5 \n";
          break;
        case 7:
          mostrar += "Hay " + dinero[i] + " monedas de 2 \n";
          break;
        case 8:
          mostrar += "Hay " + dinero[i] + " monedas de 1 \n";
          break;
        case 9:
          mostrar += "Hay " + dinero[i] + " monedas de 0.5 \n";
          break;
        case 10:
          mostrar += "Hay " + dinero[i] + " monedas de 0.2 \n";
          break;
        case 11:
          mostrar += "Hay " + dinero[i] + " monedas de 0.1 \n";
          break;
        case 12:
          mostrar += "Hay " + dinero[i] + " monedas de 0.05 \n";
          break;
        case 13:
          mostrar += "Hay " + dinero[i] + " monedas de 0.02 \n";
          break;
        case 14:
          mostrar += "Hay " + dinero[i] + " monedas de 0.01 \n";
          break;
      }
    }
  }
  if (mostrar == "") {
    mostrar = "Su cambio es 0";
  }
  alert(mostrar);
}
function rangoDevolucion(importeDevolucion) {
  if (importeDevolucion >= 500) {
    return 0;
  } else if (importeDevolucion >= 200) {
    return 1;
  } else if (importeDevolucion >= 100) {
    return 2;
  } else if (importeDevolucion >= 50) {
    return 3;
  } else if (importeDevolucion >= 20) {
    return 4;
  } else if (importeDevolucion >= 10) {
    return 5;
  } else if (importeDevolucion >= 5) {
    return 6;
  } else if (importeDevolucion >= 2) {
    return 7;
  } else if (importeDevolucion >= 1) {
    return 8;
  } else if (importeDevolucion >= 0.5) {
    return 9;
  } else if (importeDevolucion >= 0.2) {
    return 10;
  } else if (importeDevolucion >= 0.1) {
    return 11;
  } else if (importeDevolucion >= 0.05) {
    return 12;
  } else if (importeDevolucion >= 0.02) {
    return 13;
  } else if (importeDevolucion >= 0.01) {
    return 14;
  }
}
function valorPosicion(posicion) {
  switch (posicion) {
    case 0:
      return 500;
      break;
    case 1:
      return 200;
      break;
    case 2:
      return 100;
      break;
    case 3:
      return 50;
      break;
    case 4:
      return 20;
      break;
    case 5:
      return 10;
      break;
    case 6:
      return 5;
      break;
    case 7:
      return 2;
      break;
    case 8:
      return 1;
      break;
    case 9:
      return 0.5;
      break;
    case 10:
      return 0.2;
      break;
    case 11:
      return 0.1;
      break;
    case 12:
      return 0.05;
      break;
    case 13:
      return 0.02;
      break;
    case 14:
      return 0.01;
      break;
  }
}
devolucion[devolucion.length - 1] = pago[pago.length - 1] - precioArticulo;
devolucion[devolucion.length - 1] = devolucion[devolucion.length - 1].toFixed(2);
console.log(devolucion[devolucion.length - 1])
console.log(caja[caja.length - 1])
if (devolucion[devolucion.length - 1] == 0) {
  console.log("Gracias, vuelva pronto ");
  mostrarDinero(devolucion);
} else {
  if (devolucion[devolucion.length - 1] > caja[caja.length - 1]) {
    console.log("Me faltan pelas");
  } else {
    if (pago[pago.length - 1] < precioArticulo) {
      console.log("Importe insuficiente");
    } else {
      for (
        let i = rangoDevolucion(devolucion[devolucion.length - 1]);
        i < caja.length - 1;
        i++
      ) {
        if (caja[i] != 0) {
          let valorPosicion1 = valorPosicion(i);
          if (caja[i] * valorPosicion1 >= devolucion[devolucion.length - 1]) {
            let cantidad = Math.floor(
              devolucion[devolucion.length - 1] / valorPosicion1
            );
            devolucion[devolucion.length - 1] -= valorPosicion1 * cantidad;
            devolucion[devolucion.length - 1] =
              devolucion[devolucion.length - 1].toFixed(2);
            caja[i] -= cantidad;
            devolucion[i] = cantidad;
            console.log("cantidad " + cantidad);
            console.log("devolucion " + devolucion);
            console.log("caja " + caja);
            console.log("valorPosicion1 " + valorPosicion1);
          }
        }
      }
      mostrarDinero(devolucion);
    }
  }
}
