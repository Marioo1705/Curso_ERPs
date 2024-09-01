document.getElementById("boton").addEventListener("click", function(event) {
    event.preventDefault(); // Previene cualquier comportamiento predeterminado, como recargar la página

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
