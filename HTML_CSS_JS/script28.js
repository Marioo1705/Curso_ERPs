
var matriz = [[1,"Hola", 3], 
[4,4,4],
[5,"Adios",5]];

function tieneString(elemento){
let r = false;
elemento.forEach(element => {
r = r || typeof(element) == "string";
});
return r;
}

var matrizParesString = matriz.filter((element, index) => index % 2 == 0 && tieneString(element)); 

var array = [];
if(matrizParesString.length > 0){
matrizParesString.forEach(element => element.forEach(e => array.push(e))) ;
}
var resultado = array.filter((element, index) => typeof(element) == "string" && (index % matriz[0].length) % 2 == 1);
console.log(resultado); 

