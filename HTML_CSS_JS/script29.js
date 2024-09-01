// Solicitar al usuario el tamaño del array
let size = parseInt(prompt("Ingresa el tamaño del array:"));

// Crear un array vacío
let array = [];

// Generar los elementos del array
for (let i = 0; i < size; i++) {
    if (i === 0 || i === 1) {
        // Los primeros dos elementos son 1
        array.push(1);
    } else {
        // Cada elemento es la suma de los dos anteriores
        array.push(array[i - 1] + array[i - 2]);
    }
}

// Mostrar el array generado
console.log("Array generado:", array);
