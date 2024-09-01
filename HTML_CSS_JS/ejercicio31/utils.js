// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.2/firebase-app.js";
import { getFirestore, collection, getDocs, doc, setDoc, deleteDoc, updateDoc } from 'https://www.gstatic.com/firebasejs/10.7.2/firebase-firestore.js';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyALTGK785_gslz1qrR5J1vElvi-9SweQ5M",
    authDomain: "ejercicio-19f77.firebaseapp.com",
    projectId: "ejercicio-19f77",
    storageBucket: "ejercicio-19f77.appspot.com",
    messagingSenderId: "846536088854",
    appId: "1:846536088854:web:1b679c77b7351eb20e4437"
};

// Initialize Firebase
export const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const querySnapshot = await getDocs(collection(db, "Libros"));

// Mostrar fecha y hora
let mostrarFecha = document.getElementById('fecha');
let mostrarReloj = document.getElementById('reloj');

let fecha = new Date();

let diaSemana = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
let mesAño = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 
    'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];

mostrarFecha.innerHTML = `${diaSemana[fecha.getDay()]}, ${fecha.getDate()} de ${mesAño[fecha.getMonth()]} de ${fecha.getFullYear()}`;

setInterval(()=>{
    let hora = new Date();
    mostrarReloj.innerHTML = hora.toLocaleTimeString();
}, 1000)

// <div class="container-div">
const containerDiv = document.createElement('div');
containerDiv.setAttribute("class", "container-div");
document.body.appendChild(containerDiv);

function createCard(id, book) { // id=doc.id - book=doc.data()
    //<div class="card bg-light mb-3" name=id style="max-width: 20rem;">
    const principalDiv = document.createElement('div');
    principalDiv.setAttribute("class", "card bg-light mb-3");
    principalDiv.style = "max-width: 20rem;";
    principalDiv.setAttribute("name", id);
    //<div class="card-header">Listado actualizado Biblioteca - header: id</div>
    const headerDiv = document.createElement('div');
    const contentDiv = document.createTextNode("📚 " + book.titulo);
    headerDiv.setAttribute("class", "card-header");

    headerDiv.appendChild(contentDiv);
    principalDiv.appendChild(headerDiv);
    // <div class="card-body"> Listado actualizado Biblioteca - Título, Autor, Editorial, Número páginas, Precio, Género
    const bodyDiv = document.createElement('div');
   
    const pAuthor = document.createElement("p");
    const pAuthorText = document.createTextNode("Autor: " + book.autor);
    const pEditorial = document.createElement("p");
    const pEditorialText = document.createTextNode("Editorial: " + book.editorial); 
    const pIsbn = document.createElement("p");
    const pIsbnText = document.createTextNode("ISBN: " + id);
    const pPages = document.createElement("p");
    const pPagesText = document.createTextNode("Número de páginas: " + book.numero_paginas);
    const pCost = document.createElement("p");
    const pCostText = document.createTextNode("Precio: " + book.precio);
    const pGenre = document.createElement("p");
    const pGenreText = document.createTextNode("Género literario: " + book.genero_literario);
    const hr = document.createElement('hr'); 

    pAuthor.appendChild(pAuthorText);
    bodyDiv.appendChild(pAuthor);
    bodyDiv.appendChild(hr);
    pEditorial.appendChild(pEditorialText);
    bodyDiv.appendChild(pEditorial);
    bodyDiv.appendChild(hr);
    pIsbn.appendChild(pIsbnText);
    bodyDiv.appendChild(pIsbn);
    bodyDiv.appendChild(hr);
    pPages.appendChild(pPagesText);
    bodyDiv.appendChild(pPages);
    bodyDiv.appendChild(hr);
    pCost.appendChild(pCostText);
    bodyDiv.appendChild(pCost);
    bodyDiv.appendChild(hr);
    pGenre.appendChild(pGenreText);
    bodyDiv.appendChild(pGenre);
    bodyDiv.appendChild(hr);

    // div class="input-container" - Botón "Borrar libro" y "Actualizar libro"
    const inputContainer = document.createElement("div");
    inputContainer.setAttribute("class", "input-container");
    bodyDiv.appendChild(inputContainer);

    let input = document.createElement("input");
    input.type = "button";
    input.value = "Borrar Libro";
    input.setAttribute("name", "delete");
    input.setAttribute("id", id);
    inputContainer.appendChild(input);
        
    principalDiv.appendChild(bodyDiv);
    bodyDiv.setAttribute("class", "card-body");

    containerDiv.appendChild(principalDiv);
    const br = document.createElement("br");
    containerDiv.appendChild(br);
}

export function getBooks() {
    querySnapshot.forEach((doc) => {
        createCard(doc.id, doc.data());
        //console.log(doc.data()); Vemos Json con clave=campo valor=valor de Firestore
    });
}
/*function generateRandomIdBook(num) { // Generador de ids
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const charactersLength = characters.length;
    for (let i = 0; i < num; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }

    return result;
}*/

export async function insertBook(isbn, book) {
    await setDoc(doc(db, "Libros", isbn), book);
    alert("Insertado el libro: " + book.titulo);
    location.reload();
}

export async function deleteBook(isbn) {
    await deleteDoc(doc(db, "Libros", isbn));
    alert("Borrado el libro isbn: " + isbn);
    location.reload();
}

export async function updateBook(isbn, updateNewBook) {
    await updateDoc(doc(db, "Libros", isbn), updateNewBook);
    alert("Actualizado el libro isbn: " + isbn);
    location.reload();
}