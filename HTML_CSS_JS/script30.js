contador = 0;
const contenedor = document.createElement("div");
const contenedorBtn = document.createElement("div");
const imgContenedor = document.createElement("div");
const textoRazas = document.createElement("div");
const imgInicial = document.createElement("div");
const boton = document.createElement("button");
const textoBoton = document.createTextNode("Random");
contenedor.id = "container";
document.body.appendChild(contenedor);
contenedorBtn.id = "containerBtn";
contenedor.appendChild(contenedorBtn);
imgContenedor.id = "imgContainer";
contenedor.appendChild(imgContenedor);
textoRazas.id = "breeds";
contenedor.appendChild(textoRazas);
imgInicial.id = "imgInitial";
contenedorBtn.appendChild(imgInicial);
boton.appendChild(textoBoton);
boton.id = "btn";
boton.setAttribute('onclick', "perrito()");
contenedorBtn.appendChild(boton);

function contarRazas(razas, raza) {//razas = array, raza = string con una raza
    let filtrados = razas.filter((r) => { return r == raza });//["whippet"]
    return filtrados.length;
}

function pintarRazas(razas, raza) {
    let div = document.getElementById('breeds');
    let p = document.createElement('p');
    let textNodeP = document.createTextNode(raza + ": "+contarRazas(razas, raza));
    p.appendChild(textNodeP);
    div.appendChild(p);
}

function agregarImg(url) {
    const contenedor1 = document.getElementById("imgInitial");
    const contenedor2 = document.getElementById("imgContainer");
    let imagen = document.createElement("img");
    imagen.src = url;
    imagen.id = "i"+contador;
    if (localStorage.razas) {
        let razas = JSON.parse(localStorage.getItem('razas'));
        if (razas.length <= 20) {
            razas.push(url.split('/')[4]);
            pintarRazas(razas, razas[razas.length-1])
            localStorage.razas = JSON.stringify(razas);
        } 
    } else {
        let r = [url.split('/')[4]];
        pintarRazas(r, url.split('/')[4])
        localStorage.razas = JSON.stringify(r);
    }
    switch (contador) {
        case 0:
            contenedor1.appendChild(imagen);
            break;
        case 1:
            let division1 = document.createElement("div");
            division1.id = "d"+contador;
            contenedor2.appendChild(division1);
            division1.appendChild(imagen);
            break;
        case 2:
            let division2 = document.createElement("div");
            division2.id = "d"+contador;
            contenedor2.appendChild(division2);
            division2.appendChild(imagen);
            break;
        case 3:
            let division3 = document.createElement("div");
            division3.id = "d"+contador;
            contenedor2.appendChild(division3);
            division3.appendChild(imagen);
            break;
        case 4:
            let division4 = document.createElement("div");
            division4.id = "d"+contador;
            contenedor2.appendChild(division4);
            division4.appendChild(imagen);
            break;
        case 5:
            let division5 = document.createElement("div");
            division5.id = "d"+contador;
            contenedor2.appendChild(division5);
            division5.appendChild(imagen);
            break;
        case 6:
            let division6 = document.createElement("div");
            division6.id = "d"+contador;
            contenedor2.appendChild(division6);
            division6.appendChild(imagen);
            break;
        case 7:
            let division7 = document.createElement("div");
            division7.id = "d"+contador;
            contenedor2.appendChild(division7);
            division7.appendChild(imagen);
            break;
        case 8:
            let division8 = document.createElement("div");
            division8.id = "d"+contador;
            contenedor2.appendChild(division8);
            division8.appendChild(imagen);
            break;
        case 9:
            let division9 = document.createElement("div");
            division9.id = "d"+contador;
            contenedor2.appendChild(division9);
            division9.appendChild(imagen);
            break;
        case 10:
            let division10 = document.createElement("div");
            division10.id = "d"+contador;
            contenedor2.appendChild(division10);
            division10.appendChild(imagen);
            break;
        case 11:
            let division11 = document.createElement("div");
            division11.id = "d"+contador;
            contenedor2.appendChild(division11);
            division11.appendChild(imagen);
            break;
        case 12:
            let division12 = document.createElement("div");
            division12.id = "d"+contador;
            contenedor2.appendChild(division12);
            division12.appendChild(imagen);
            break;
        case 13:
            let division13 = document.createElement("div");
            division13.id = "d"+contador;
            contenedor2.appendChild(division13);
            division13.appendChild(imagen);
            break;
        case 14:
            let division14 = document.createElement("div");
            division14.id = "d"+contador;
            contenedor2.appendChild(division14);
            division14.appendChild(imagen);
            break;
        case 15:
            let division15 = document.createElement("div");
            division15.id = "d"+contador;
            contenedor2.appendChild(division15);
            division15.appendChild(imagen);
            break;
        case 16:
            let division16 = document.createElement("div");
            division16.id = "d"+contador;
            contenedor2.appendChild(division16);
            division16.appendChild(imagen);
            break;
        case 17:
            let division17 = document.createElement("div");
            division17.id = "d"+contador;
            contenedor2.appendChild(division17);
            division17.appendChild(imagen);
            break;
        case 18:
            let division18 = document.createElement("div");
            division18.id = "d"+contador;
            contenedor2.appendChild(division18);
            division18.appendChild(imagen);
            break;
        case 19:
            let division19 = document.createElement("div");
            division19.id = "d"+contador;
            contenedor2.appendChild(division19);
            division19.appendChild(imagen);
            break;
        case 20:
            let division20 = document.createElement("div");
            division20.id = "d"+contador;
            contenedor2.appendChild(division20);
            division20.appendChild(imagen);
            break;
        default:
            alert("Ya no entran más fotos de perros");
            localStorage.removeItem('razas');
    }
    contador++;
}

function perrito() {
    fetch('https://dog.ceo/api/breeds/image/random')
        .then(res => res.json())
        .then(dog => agregarImg(dog.message));
}