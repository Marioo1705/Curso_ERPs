// Crear el título principal (h1)
const titulo = document.createElement("h1");
const textoTitulo = document.createTextNode("API REST Empresa");
titulo.appendChild(textoTitulo);
document.body.appendChild(titulo);

// Crear los contenedores de todos los ejercicios
const containerEjercicio1 = document.createElement("div");
containerEjercicio1.id = "container";
document.body.appendChild(containerEjercicio1);

const containerEjercicios2345 = document.createElement("div");
containerEjercicios2345.id = "container-father";
document.body.appendChild(containerEjercicios2345);

const containerEjercicio2 = document.createElement("div");
containerEjercicio2.id = "form1-container";
containerEjercicios2345.appendChild(containerEjercicio2);

const containerEjercicio3 = document.createElement("div");
containerEjercicio3.id = "form2-container";
containerEjercicios2345.appendChild(containerEjercicio3);

const containerEjercicio4 = document.createElement("div");
containerEjercicio4.id = "form3-container";
containerEjercicios2345.appendChild(containerEjercicio4);

const containerEjercicio5 = document.createElement("div");
containerEjercicio5.id = "form4-container";
containerEjercicios2345.appendChild(containerEjercicio5);

/* *********************************************************************************
* 1. En el home muestre en una tabla o lista la información de todos los empleados.*
************************************************************************************/

// Imagen 1
const imagen1Container = document.createElement("div");
imagen1Container.setAttribute("class", "imagen-container");
containerEjercicio1.appendChild(imagen1Container);

const imagen1 = document.createElement("img");
imagen1.setAttribute("src", "empresa.png");
imagen1Container.appendChild(imagen1);

// Crear un contenedor para la tabla de empleados (div id="tabla-container")
const tablaContainer = document.createElement("div");
tablaContainer.id = "tabla-container";
containerEjercicio1.appendChild(tablaContainer);

// Crear un título para la tabla (h2)
const tituloTabla = document.createElement("h2");
const textoTituloTabla = document.createTextNode("Tabla Empleados");
tituloTabla.appendChild(textoTituloTabla);
tablaContainer.appendChild(tituloTabla);

// Imagen 2
const imagen2Container = document.createElement("div");
imagen2Container.setAttribute("class", "imagen-container");
containerEjercicio1.appendChild(imagen2Container);

const imagen2 = document.createElement("img");
imagen2.setAttribute("src", "empleados.png");
imagen2Container.appendChild(imagen2);

// Cargar empleados en la tabla
cargarEmpleados();

function cargarEmpleados() {
    fetch('http://127.0.0.1:5000/all')
        .then(res => res.json())
        .then(data => {
            const tablaContainer = document.getElementById('tabla-container');

            // Crear la tabla y el encabezado (table class="tabla-empleados" y thead)
            const tabla = document.createElement('table');
            tabla.setAttribute("class", "tabla-empleados");

            const thead = document.createElement('thead');
            const encabezadoTabla = document.createElement('tr');
            const camposEncabezado = ['ID', 'Nombre', 'Apellidos', 'Antigüedad (años)'];
            for (let i = 0; i < camposEncabezado.length; i++) {
                const th = document.createElement('th');
                th.innerText = camposEncabezado[i];
                encabezadoTabla.appendChild(th);
            }
            thead.appendChild(encabezadoTabla);
            tabla.appendChild(thead);

            // Crear el cuerpo de la tabla (tbody)
            const tbody = document.createElement('tbody');
            tabla.appendChild(tbody);

            data.forEach(empleado => {
                const fila = document.createElement('tr');
                const datos = ['id', 'nombre', 'apellidos', 'trabaja_desde'];
                for (let i = 0; i < datos.length; i++) {
                    const dato = datos[i];
                    const celda = document.createElement('td');
                    celda.innerText = empleado[dato];
                    fila.appendChild(celda);
                }
                tbody.appendChild(fila);
            });

            // Agregar la tabla al contenedor
            tablaContainer.appendChild(tabla);
        })
}

/****************************************************************************************
 * 2. Por medio de un formulario, permita escribir un id y buscar a un empleado por id. *
*****************************************************************************************/

// Crear div class="card-header"
const headerForm1 = document.createElement("div");
headerForm1.setAttribute("class", "card-header");
containerEjercicio2.appendChild(headerForm1);
const tituloCardHeader1 = document.createElement("h5");
const textoTituloCardHeader1 = document.createTextNode("Buscar empleado");
tituloCardHeader1.appendChild(textoTituloCardHeader1);
headerForm1.appendChild(tituloCardHeader1);

// Crear div class="card-body"
const bodyForm1 = document.createElement("div");
bodyForm1.setAttribute("class", "card-body");
containerEjercicio2.appendChild(bodyForm1);

// Crear formulario form id="form1"
const form1 = document.createElement("form");
form1.id = "form1";
bodyForm1.appendChild(form1);

// Crear input type number class="form-control"
const idSelectEmpleado = document.createElement("input");
idSelectEmpleado.setAttribute("type", "number");
idSelectEmpleado.id = "select-id";
idSelectEmpleado.setAttribute("class", "form-control");
idSelectEmpleado.setAttribute("placeholder", "Id del empleado");
idSelectEmpleado.required = true;
idSelectEmpleado.autofocus = true;

const br1 = document.createElement("br");

// Crear input type button class="btn btn-lg btn-primary" id="select-button" onclick="getAll_id()"
const buscar = document.createElement("input");
buscar.setAttribute("value", "Buscar");
buscar.setAttribute("type", "button");
buscar.setAttribute("class", "btn btn-lg btn-primary");
buscar.setAttribute("onclick", "getAll_id()");
buscar.id = "select-button";

// Colocar todos los input dentro del div form4
form1.appendChild(idSelectEmpleado);
form1.appendChild(br1);
form1.appendChild(buscar);

// Crear un contenedor para el resultado de la consulta (div id="datos-empleado-container")
const datosEmpleadoContainer = document.createElement('div');
datosEmpleadoContainer.id = 'datos-empleado-container';
document.body.appendChild(datosEmpleadoContainer);

function getAll_id() {
    // Tomamos el valor del input type number a través de su id
    const inputId = document.getElementById('empleado-id');
    const empleadoId = idSelectEmpleado.value;

    fetch(`http://127.0.0.1:5000/all/${empleadoId}`)
        .then(res => res.json())
        .then(data => {
            // Creamos div class="card bg-light mb-3" para crear la card conde van a ir los datos
            const datosEmpleado = document.createElement('div');
            datosEmpleado.setAttribute("class", "card text-bg-light mb-3");
            datosEmpleado.style = "max-width: 18rem;";
            // Creamos array con claves y valores de los datos de empleados y los vamos recogiendo en un p con un bucle
            const keys = ['ID', 'Nombre', 'Apellidos', 'Antigüedad (años)'];
            const values = [data.id, data.nombre, data.apellidos, data.trabaja_desde];
            // Creamos div class="card-header"
            const headerDiv = document.createElement('div');
            const contentDiv = document.createTextNode("id: " + data.id);
            headerDiv.setAttribute("class", "card-header");

            headerDiv.appendChild(contentDiv);
            datosEmpleado.appendChild(headerDiv);
            // Creamos div class="card-body"
            const bodyDiv = document.createElement('div');
            bodyDiv.setAttribute("class", "card-body");
            datosEmpleado.appendChild(bodyDiv);

            for (let i = 1; i < keys.length; i++) {
                const p = document.createElement('p');
                
                p.innerText = `${keys[i]}: ${values[i]}`;
                p.setAttribute("class", "card-text");
                bodyDiv.appendChild(p);
               
            }
            datosEmpleadoContainer.appendChild(datosEmpleado);
        })
}

/*******************************************************************************************************
 * 3. Por medio de un formulario, permita solicitar todos los datos de un empleado nuevo e insertarlo. *
********************************************************************************************************/

// Crear div class="card-header"
const headerForm2 = document.createElement("div");
headerForm2.setAttribute("class", "card-header");
containerEjercicio3.appendChild(headerForm2);
const tituloCardHeader2 = document.createElement("h5");
const textoTituloCardHeader2 = document.createTextNode("Insertar nuevo empleado");
tituloCardHeader2.appendChild(textoTituloCardHeader2);
headerForm2.appendChild(tituloCardHeader2);

// Crear div class="card-body"
const bodyForm2 = document.createElement("div");
bodyForm2.setAttribute("class", "card-body");
containerEjercicio3.appendChild(bodyForm2);

// Crear formulario form id="form2"
const form2 = document.createElement("form");
form2.id = "form2";
bodyForm2.appendChild(form2);

// Crear inputs type text class="form-control"
const nombreEmpleado = document.createElement("input");
nombreEmpleado.setAttribute("type", "text");
nombreEmpleado.id = "insert-nombre";
nombreEmpleado.setAttribute("class", "form-control");
nombreEmpleado.setAttribute("placeholder", "Nombre del empleado");
nombreEmpleado.required = true;
nombreEmpleado.autofocus = true;

const apellidosEmpleado = document.createElement("input");
apellidosEmpleado.setAttribute("type", "text");
apellidosEmpleado.id = "insert-apellidos";
apellidosEmpleado.setAttribute("class", "form-control");
apellidosEmpleado.setAttribute("placeholder", "Apellidos del empleado");
apellidosEmpleado.required = true;
apellidosEmpleado.autofocus = true;

const antiguedadEmpleado = document.createElement("input");
antiguedadEmpleado.setAttribute("type", "number");
antiguedadEmpleado.id = "insert-antiguedad";
antiguedadEmpleado.setAttribute("class", "form-control");
antiguedadEmpleado.setAttribute("placeholder", "Antiguedad del empleado");
antiguedadEmpleado.autofocus = true;

// Crear input type button class="btn btn-lg btn-primary" id="insert-button" onclick="insertarEmpleado()"
const insertar = document.createElement("input");
insertar.setAttribute("type", "button");
insertar.setAttribute("value", "Insertar datos");
insertar.setAttribute("class", "btn btn-lg btn-primary");
insertar.setAttribute("onclick", "insertarEmpleado()");
insertar.id = "insert-button";

const br2 = document.createElement("br");

// Colocar todos los input dentro del div form2
form2.appendChild(nombreEmpleado);
form2.appendChild(apellidosEmpleado);
form2.appendChild(antiguedadEmpleado);
form2.appendChild(br2);
form2.appendChild(insertar);

function insertarEmpleado() {
    // Cogemos los datos de los input mediante un json
    const datosNuevoEmpleado = {
        nombre: nombreEmpleado.value,
        apellidos: apellidosEmpleado.value,
        trabaja_desde: antiguedadEmpleado.value
    };
     
    fetch('http://127.0.0.1:5000/insert', {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
          },
        body: JSON.stringify(datosNuevoEmpleado)
    })
        .then(res => res.json())
        .then(data => {
            alert("Empleado insertado correctamente");
            location.reload();
        })
}

/********************************************************************************************
 * 4. Por medio de un formulario, permita escribir un id y borrar al empleado con dicho id. *
*********************************************************************************************/

// Crear div class="card-header"
const headerForm3 = document.createElement("div");
headerForm3.setAttribute("class", "card-header");
containerEjercicio4.appendChild(headerForm3);
const tituloCardHeader3 = document.createElement("h5");
const textoTituloCardHeader3 = document.createTextNode("Borrar empleado");
tituloCardHeader3.appendChild(textoTituloCardHeader3);
headerForm3.appendChild(tituloCardHeader3);

// Crear div class="card-body"
const bodyForm3 = document.createElement("div");
bodyForm3.setAttribute("class", "card-body");
containerEjercicio4.appendChild(bodyForm3);

// Crear formulario form id="form4"
const form3 = document.createElement("form");
form3.id = "form3";
bodyForm3.appendChild(form3);

// Crear input type number class="form-control"
const idDeleteEmpleado = document.createElement("input");
idDeleteEmpleado.setAttribute("type", "number");
idDeleteEmpleado.id = "delete-id";
idDeleteEmpleado.setAttribute("class", "form-control");
idDeleteEmpleado.setAttribute("placeholder", "Id del empleado");
idDeleteEmpleado.required = true;
idDeleteEmpleado.autofocus = true;

// Crear input type button class="btn btn-lg btn-primary" id="delete-button" onclick="delete_id()"
const borrar = document.createElement("input");
borrar.setAttribute("value", "Borrar");
borrar.setAttribute("type", "button");
borrar.setAttribute("class", "btn btn-lg btn-primary");
borrar.setAttribute("onclick", "delete_id()");
borrar.id = "delete-button";

const br3 = document.createElement("br");

// Colocar todos los input dentro del div form4
form3.appendChild(idDeleteEmpleado);
form3.appendChild(br3);
form3.appendChild(borrar);

function delete_id() {
    // Tomamos el valor del input type number a través de su id
    const input3Id = document.getElementById("delete-id");
    const empleadoDeleteId = input3Id.value;
    
    fetch(`http://127.0.0.1:5000/delete/${empleadoDeleteId}`, {method: 'DELETE'})
        .then(res => res.json())
        .then(data => {
            alert("Empleado borrado correctamente");
            location.reload();
        })
}

/**********************************************************************************************************************
 * 5. Por medio de un formulario, permita escribir un id y un nombre y actualice el nombre del empleado con dicho id. *
***********************************************************************************************************************/

// Crear div class="card-header"
const headerForm4 = document.createElement("div");
headerForm4.setAttribute("class", "card-header");
containerEjercicio5.appendChild(headerForm4);
const tituloCardHeader4 = document.createElement("h5");
const textoTituloCardHeader4 = document.createTextNode("Actualizar empleado");
tituloCardHeader4.appendChild(textoTituloCardHeader4);
headerForm4.appendChild(tituloCardHeader4);

// Crear div class="card-body"
const bodyForm4 = document.createElement("div");
bodyForm4.setAttribute("class", "card-body");
containerEjercicio5.appendChild(bodyForm4);

// Crear formulario form id="form4"
const form4 = document.createElement("form");
form4.id = "form4";
bodyForm4.appendChild(form4);

// Crear inputs type text class="form-control"
const idEmpleado = document.createElement("input");
idEmpleado.setAttribute("type", "number");
idEmpleado.id = "insert-id";
idEmpleado.setAttribute("class", "form-control");
idEmpleado.setAttribute("placeholder", "Id del empleado");
idEmpleado.required = true;
idEmpleado.autofocus = true;

const nuevoNombreEmpleado = document.createElement("input");
nuevoNombreEmpleado.setAttribute("type", "text");
nuevoNombreEmpleado.id = "update-nombre";
nuevoNombreEmpleado.setAttribute("class", "form-control");
nuevoNombreEmpleado.setAttribute("placeholder", "Nuevo nombre del empleado");
nuevoNombreEmpleado.required = true;
nuevoNombreEmpleado.autofocus = true;

// Crear input type button class="btn btn-lg btn-primary" id="insert-button" onclick="insertarEmpleado()"
const actualizar = document.createElement("input");
actualizar.setAttribute("value", "Actualizar nombre");
actualizar.setAttribute("type", "button");
actualizar.setAttribute("class", "btn btn-lg btn-primary");
actualizar.setAttribute("onclick", "actualizarNombre()");
actualizar.id = "update-button";

const br4 = document.createElement("br");

// Colocar todos los input dentro del div form4
form4.appendChild(idEmpleado);
form4.appendChild(nuevoNombreEmpleado);
form4.appendChild(br4);
form4.appendChild(actualizar);

function actualizarNombre() {
    // Cogemos los datos de los input mediante un json
    const idUpdate = idEmpleado.value;
    const nombreUpdate = nuevoNombreEmpleado.value
     
    fetch(`http://127.0.0.1:5000/update/${idUpdate}/${nombreUpdate}`, {method: 'PUT'})
        .then(res => res.json())
        .then(data => {
            alert("Nombre de empleado actualizado correctamente");
            location.reload();
        })
}