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