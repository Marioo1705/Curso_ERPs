//Me traigo mi db firestore
import { getBooks, insertBook, deleteBook, updateBook } from "./utils.js"; 
//console.log(db);
//Extraigo todos los documentos de books y creo tarjetas con ellos
getBooks();


//Obtenemos el form y capturamos el submit
const form = document.getElementById("book-form");
form.addEventListener("submit", e => {
    e.preventDefault();
    const isbn = form["book-isbn"].value;
    const book = {
        titulo: form["book-title"].value,
        autor: form["book-author"].value,
        editorial: form["book-editorial"].value,
        numero_paginas: form["book-pages"].value,
        precio: form["book-cost"].value,
        genero_literario: form["book-genre"].value
    }
    
    insertBook(isbn, book);
})

//Extraigo el elemento a borrar a través del click, el id del input coincide con el del libro
const buttonsCardD = document.getElementsByName("delete");
buttonsCardD.forEach(element => {
    element.addEventListener("click", () => {
        console.log(element);
        let divDelete = element.parentNode.parentNode.parentNode.parentNode;
        document.body.removeChild(divDelete);
        //console.log("Estoy borrando el libro: "+element.id);
        deleteBook(element.id);
    })
});

const updateForm = document.getElementById("update-form");
updateForm.addEventListener("submit", e => {
    e.preventDefault();
    const isbn2 = updateForm["update-book-isbn"].value;

    const updateNewBook = {};
    if (updateForm["update-book-title"].value) {
        updateNewBook.titulo = updateForm["update-book-title"].value;
    }
    if (updateForm["update-book-author"].value) {
        updateNewBook.autor = updateForm["update-book-author"].value;
    }
    if (updateForm["update-book-editorial"].value) {
        updateNewBook.editorial = updateForm["update-book-editorial"].value;
    }
    if (updateForm["update-book-pages"].value) {
        updateNewBook.numero_paginas = updateForm["update-book-pages"].value;
    }
    if (updateForm["update-book-cost"].value) {
        updateNewBook.precio = updateForm["update-book-cost"].value;
    }
    if (updateForm["update-book-genre"].value) {
        updateNewBook.genero_literario = updateForm["update-book-genre"].value;
    }
    
    updateBook(isbn2, updateNewBook);
});