// Función para mostrar la lista de contactos
function displayContacts() {
    let contacts = JSON.parse(localStorage.getItem("contacts")) || [];
    let contactsList = document.getElementById("contactsList");
    contactsList.innerHTML = ""; // Limpiar la lista antes de actualizar

    contacts.forEach(contact => {
        let contactItem = document.createElement("li");
        contactItem.textContent = `Nombre: ${contact.name}, Email: ${contact.email}, Mensaje: ${contact.message}`;
        contactsList.appendChild(contactItem);
    });
}

// Manejo del evento click para el botón de enviar
document.getElementById("boton").addEventListener("click", function(event) {
    event.preventDefault(); // Previene el envío tradicional del formulario

    // Recoger los valores de los campos del formulario
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    let message = document.getElementById("message").value;

    // Crear un objeto para almacenar los datos
    let contact = {
        name: name,
        email: email,
        message: message
    };

    // Obtener los contactos previos guardados en Local Storage
    let contacts = JSON.parse(localStorage.getItem("contacts")) || [];

    // Añadir el nuevo contacto a la lista
    contacts.push(contact);

    // Guardar la lista actualizada en Local Storage
    localStorage.setItem("contacts", JSON.stringify(contacts));

    // Limpiar el formulario después de enviar
    document.getElementById("contactForm").reset();

    // Mostrar la lista de contactos actualizada
    displayContacts();
});

// Manejo del evento click para el botón de borrar un contacto específico
document.getElementById("deleteContact").addEventListener("click", function() {
    // Obtener el email que el usuario quiere borrar
    let emailToDelete = document.getElementById("emailToDelete").value;

    // Obtener la lista de contactos desde Local Storage
    let contacts = JSON.parse(localStorage.getItem("contacts")) || [];

    // Filtrar la lista para excluir el contacto con el email proporcionado
    let updatedContacts = contacts.filter(contact => contact.email !== emailToDelete);

    // Guardar la lista actualizada en Local Storage
    localStorage.setItem("contacts", JSON.stringify(updatedContacts));

    // Limpiar el campo de entrada de email
    document.getElementById("emailToDelete").value = "";

    // Actualizar la visualización de los contactos
    displayContacts();
});

// Manejo del evento click para el botón de borrar todos los contactos
document.getElementById("clearContacts").addEventListener("click", function() {
    // Borrar todos los contactos del Local Storage
    localStorage.removeItem("contacts");

    // Actualizar la visualización para reflejar que no hay contactos
    displayContacts();
});

// Mostrar los contactos cuando se carga la página
window.onload = displayContacts;
