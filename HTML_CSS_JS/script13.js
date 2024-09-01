let n1 = prompt("Elige un número real");
let n2 = prompt("Elige otro número real");
let resultado;
n1 = parseFloat(n1);
n2 = parseFloat(n2);
let operacion = prompt("Suma(1) o resta(2) dos números");
if (operacion == 1) {
    resultado = n1 + n2;
    alert('La suma de los dos números es '+resultado);
} else if (operacion == 2) {
    resultado = n1 - n2;
    alert('la resta de los dos números es '+resultado);
} else {
    alert('Las opciones válidas solo eran 1 o 2');
}