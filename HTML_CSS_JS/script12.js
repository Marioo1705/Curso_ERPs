let frase = prompt("Introduce una frase");
let letra = prompt("Introduce una letra");
let contadorLetras = 0;
alert('La frase introducidad tiene '+frase.length+' caracteres');
for (let i = 0; i < frase.length; i++) {
    if (frase[i] == letra) {
    contadorLetras++;
    }
}
alert('La letra '+letra+' aparece '+contadorLetras+' veces en la frase.');