# Ejercicios de HTML, CSS y javaScript

Este directorio contiene una colección de ejercicios de HTML, CSS y javaScript.

## Lista de ejercicios

### Ejercicio 1:

A partir del siguiente código:

```
 <!DOCTYPE html>
    <html>
        <head>
        <title>El título de la página</title>
        </head>
    <body>
        <p><strong>HTML</strong> son las siglas de <em>HyperText Markup Language</em>, que puede traducirse como lenguaje de marcas o marcado de hipertexto.
        </p>
        <p>El lenguaje HTML se emplea para crear las páginas web. Es muy fácil ver el código HTML de una página web, la opción exacta cambia de un navegador a otro y también puede cambiar de una versión a otra de un mismo navegador, pero suelen tener un nombre similar.
        </p>
        <p>HTML se compone de etiquetas que se escriben entre los símbolos menor que y mayor que.</p>
        <p>Los inicios del lenguaje HTML se remontan al año 1990, cuando Tim Berners-Lee creó la primera página web.</p>
    </body>
    </html>
```

Realiza las siguientes modificaciones:

* Las siglas HTML deben aparecer como texto destacado en toda la página.
* Tim Berners-Lee debe aparecer como texto enfatizado en toda la página.
* Debes añadir el siguiente contenido:
    * Un encabezado de nivel 1 con el texto "HTML" antes de "HTML son las siglas de..."
    * Un encabezado de nivel 2 con el texto "Historia de HTML" antes de "Los inicios del lenguaje HTML..."
    * Un encabezado de nivel 2 con el texto "Versiones de HTML" antes de dos nuevos párrafos que contienen el texto "Tim Berners-Lee definió la primera versión de HTML en el año 1991" y "En la actualidad, la última versión de HTML es HTML5".

Aspecto del resultado final:

![Ejercicio1_HTML](images/Ejercicio1_HTML.png)

**Archivo:** [ejercicio1.html](./ejercicio1.html)

---

### Ejercicio 2:

A partir del siguiente código:

Usando listas, crea una página, cuyo resultado final sea el siguiente:

![Ejercicio2_HTML](images/Ejercicio2_HTML.png)

**Archivo:** [ejercicio2.html](./ejercicio2.html)

---

### Ejercicio 2:

A partir del siguiente código e información:

```
<!DOCTYPE html>
    <html>
    <head>
        <title>Desempleo</title>
        <style>
        table, tr, th, td {
        border: 1px solid black;
        }
        </style>
    </head>
        <body>

            El desempleo en España


            La siguiente tabla muestra la evolución del desempleo en España, comparado con la media de los 27 países de la Unión Europea, Grecia, que compite con España en ser el primero en esta vergonzosa competición y Estados Unidos y Japón, dos de las primeras economías mundiales.


            País
            2000
            2001
            2002
            2003
            2004
            2005
            2006
            2007
            2008
            2009
            2010
            2011
            2012
            2013


            UE (27 países)
            8.9
            8.7
            9
            9.1
            9.3
            9
            8.2
            7.2
            7
            9
            9.6
            9.6
            10.4
            10.8


            España
            11.9
            10.6
            11.5
            11.5
            11
            9.2
            8.5
            8.2
            11.3
            17.9
            19.9
            21.4
            24.8
            26.1


            Grecia
            11.2
            10.7
            10.3
            9.7
            10.6
            10
            9
            8.4
            7.8
            9.6
            12.7
            17.9
            24.5
            27.5


            Estados Unidos
            4
            4.8
            5.8
            6
            5.5
            5.1
            4.6
            4.6
            5.8
            9.3
            9.6
            8.9
            8.1
            7.4


            Japón
            4.7
            5
            5.4
            5.3
            4.7
            4.4
            4.1
            3.9
            4
            5.1
            5.1
            4.6
            4.3
            4


            Fuente: Índice de desempleo anual, Eurostat

        </body>
    </html>
```

Nota: en el código base que se te proporciona vas a encontrar una etiqueta nueva, la etiqueta style. Esta etiqueta permite introducir instrucciones de CSS (Cascading Style Sheets) en una página web. CSS se emplea para definir la presentación visual de una página web y se explica en la segunda parte de este curso. Las instrucciones que se han incluido tienen como objetivo que la tabla y las celdas de la tabla se muestren con un borde. Esto también se podría haber logrado con el atributo border de HTML, pero es mejor utilizar siempre CSS para todo lo relacionado con la presentación de una página web

El resultado final debe ser:

![Ejercicio3_HTML](images/Ejercicio3_HTML.png)

**Archivo:** [ejercicio3.html](./ejercicio3.html)

---

### Ejercicio 4:

A partir del código HTML y CSS que se muestra, añadir los selectores CSS que faltan para aplicar los estilos deseados. Cada regla CSS incluye un comentario en el que se explica los elementos a los que debe aplicarse:

```
    <!DOCTYPE html> 
    <html lang="es"> 
        <head> 
            <meta charset="UTF-8" />
            <title>Ejercicio de selectores</title>
            <style type="text/css">
                /* Todos los elementos de la pagina */
                { font: 1em/1.3 Arial, Helvetica, sans-serif; }
                /* Todos los parrafos de la pagina */
                { color: #555; }
                /* Todos los párrafos contenidos en #primero */
                { color: #336699; }
                /* Todos los enlaces la pagina */
                { color: #CC3300; }
                /* Los elementos "em" contenidos en #primero */
                { background: #FFFFCC; padding: .1em; }
                /* Todos los elementos "em" de clase "especial" en toda la pagina */
                { background: #FFCC99; border: 1px solid #FF9900; padding: .1em; }
                /* Elementos "span" contenidos en .normal */
                { font-weight: bold; }
            </style>
        </head>
        <body>
            <div id="primero">
                <p>Lorem ipsum dolor sit amet, <a href="#">consectetuer adipiscing elit</a>. 
                Praesent blandit nibh at felis. Sed nec diam in dolor vestibulum aliquet. Duis 
                ullamcorper, nisi non facilisis molestie, <em>lorem sem aliquam nulla</em>, id 
                lacinia velit mi vestibulum enim.</p>
            </div>
            <div class="normal">
                <p>Phasellus eu velit sed lorem sodales egestas. Ut feugiat. <span><a 
                href="#">Donec porttitor</a>, magna eu varius luctus,</span> metus massa 
                tristique massa, in imperdiet est velit vel magna. Phasellus erat. Duis risus. <a
                href="#">Maecenas dictum</a>, nibh vitae pellentesque auctor, tellus velit 
                consectetuer tellus, tempor pretium felis tellus at metus.</p>
                <p>Cum sociis natoque <em class="especial">penatibus et magnis</em> dis 
                parturient montes, nascetur ridiculus mus. Proin aliquam convallis ante. 
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac 
                turpis egestas. Nunc aliquet. Sed eu metus. Duis justo.</p>
                <p>Donec facilisis blandit velit. Vestibulum nisi. Proin volutpat, <em 
                class="especial">enim id iaculis congue</em>, orci justo ultrices tortor, <a 
                href="#">quis lacinia eros libero in eros</a>. Sed malesuada dui vel quam. 
                Integer at eros.</p>
            </div>
        </body>
    </html>
```

**Archivos:** [ejercicio4.html](./ejercicio4.html) / [style4.css](./style4.css)

---

### Ejercicio 5:

A partir del código siguiente:

```
    <!DOCTYPE html> 
    <html lang="es"> 
        <head> 
            <meta charset="UTF-8" /> 
            <title>Ejemplo de estilos ejercicio</title> 
            <style type="text/css"> 
                /* Los estilos ...*/
            </style> 
        </head> 
        <body>
            <h1 id="titulo">Lorem ipsum dolor sit amet</h1>
            <p>Nulla pretium. Sed tempus nunc vitae neque. <strong>Suspendisse 
            gravida</strong>, metus a scelerisque sollicitudin, lacus velit 
            ultricies nisl, nonummy tempus neque diam quis felis. <span 
            class="destacado">Etiam sagittis tortor</span> sed arcu sagittis tristique.</p>
            <h2 id="subtitulo">Aliquam tincidunt, sem eget volutpat porta</h2>
            <p>Vivamus velit dui, placerat vel, feugiat in, ornare et, urna. <a 
            href="#">Aenean turpis metus, <em>aliquam non</em>, tristique in</a>, pretium 
            varius, sapien. Proin vitae nisi. Suspendisse <span class="especial">porttitor 
            purus ac elit</span>. Suspendisse eleifend odio at dui. In in elit sed metus 
            pretium elementum.</p>
            <table summary="Descripción de la tabla y su contenido">
                <caption>Título de la tabla</caption>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col" class="especial">Título columna 1</th>
                        <th scope="col" class="especial">Título columna 2</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Título columna 1</th>
                        <th scope="col">Título columna 2</th>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <th scope="row" class="especial">Título fila 1</th>
                        <td>Donec purus ipsum</td>
                        <td>Curabitur <em>blandit</em></td>
                    </tr>
                    <tr>
                        <th scope="row">Título fila 2</th>
                        <td>Donec <strong>purus ipsum</strong></td>
                        <td>Curabitur blandit</td>
                    </tr>
                </tbody>
            </table>
            <div id="adicional">
                <p>Donec purus ipsum, posuere id, venenatis at, <span>placerat ac, lorem</span>. 
                Curabitur blandit, eros sed gravida aliquet, risus justo 
                porta lorem, ut mollis lectus tortor in orci. Pellentesque nec augue.</p>
                <p>Fusce nec felis eu diam pretium adipiscing. <span id="especial">Nunc elit 
                elit, vehicula vulputate</span>, venenatis in, 
                posuere id, lorem. Etiam sagittis, tellus in ultrices accumsan, diam nisi feugiat
                ante, eu congue magna mi non nisl.</p>
                <p>Vivamus ultrices aliquet augue. <a href="#">Donec arcu pede, pretium 
                vitae</a>, rutrum aliquet, tincidunt blandit, pede. 
                Aliquam in nisi. Suspendisse volutpat. Nulla facilisi. Ut ullamcorper nisi quis 
                mi.</p>
            </div>
        </body>
    </html>
```

* AYUDA:

```
    propiedad: color
    valores: teal, red, blue, orange, purple, olive, fuchsia y green.
```

Debemos obtener un aspecto como el de la siguiente imagen:

![Ejercicio5_HTML](images/Ejercicio5_HTML.png)

**Archivos:** [ejercicio5.html](./ejercicio5.html) / [style5.css](./style5.css)

---

### Ejercicio 6:

Hacer el mismo formato que aparece en la siguiente pantalla:

![Ejercicio6_HTML](images/Ejercicio6_HTML.png)

**Archivos:** [ejercicio6.html](./ejercicio6.html) / [style6.css](./style6.css)

---

### Ejercicio 7:

1. Recrear la imagen de Piet Mendrean utilizando grid.

2. Los huecos en blanco están vacios, es decir, no son divs de color blanco. 

3. Las aristas que se ven en negro, no hay que pintarlas.

![Ejercicio7_HTML](images/Ejercicio7_HTML.jpg)

**Archivos:** [ejercicio7.html](./ejercicio7.html) / [style7.css](./style7.css)

---

### Ejercicio 8:

Página web con temática de la ciudad de Praga que contiene los siguientes archivos accesibles desde el navegador creado:

* index_praga.html
* historia.html
* Qué visitar:
    * staremesto.html
    * malastrana.html
    * hradcany.html
    * novemesto.html
    * josefov.html
    * otraszonas.html
* dondecomer.html
* contacto.html

Además, también dispone de:

* estilos_praga.css
* Directorio de Imágenes

**Directorio:** [ejercicio8](./ejercicio8/)

---

### Ejercicio 9:

Realiza una página en HTML, que disponga de dos botones, uno de ellos tendrá el texto "Saludar" y al pulsarlo nos indicará "Hola!!"; el segundo tendrá el texto "Despedir", al pulsarlo nos dirá "Adiós!!". Para dar funcionalidad a los botones debes usar JavaScript.

**Archivos:** [ejercicio9.html](./ejercicio9.html) / [script9.js](./script9.js)

---

### Ejercicio 10:

Realiza una página en HTML, que disponga de dos botones, uno de ellos tendrá el texto "Añadir" y al pulsarlo insertará una fruta nueva en el array de frutas ["Manzana", "Banana"] y le mostratá el array al usuario; el otro tendrá el texto "Borrar" y eliminará la última fruta del array y volverá a mostrarlo.

**Archivos:** [ejercicio10.html](./ejercicio10.html) / [script10.js](./script10.js)

---

### Ejercicio 11:

Solicita al usuario tres números enteros e indícale cuál es el menor.

**Archivos:** [ejercicio11.html](./ejercicio11.html) / [script11.js](./script11.js)

---

### Ejercicio 12:

Solicita al usuario una frase y una letra y muestra la cantidad de veces que aparece la letra en la frase.

**Archivos:** [ejercicio12.html](./ejercicio12.html) / [script12.js](./script12.js)

---

### Ejercicio 13:

Suma o resta (según elija el usuario) dos números reales

**Archivos:** [ejercicio13.html](./ejercicio13.html) / [script13.js](./script13.js)

---

### Ejercicio 14:

Almacena en dos variables datos de validación (usuario y contraseña) correctos y permite que el usuario valide (dispone de 3 intentos)

**Archivos:** [ejercicio14.html](./ejercicio14.html) / [script14.js](./script14.js)

---

### Ejercicio 15:

Solicita al usuario una letra, si inserta una a muestra el número 7, si es una b, el 9, si es una c el 101 y si no es ninguno de los tres, indícale que se ha equivocado de letra

**Archivos:** [ejercicio15.html](./ejercicio15.html) / [script15.js](./script15.js)

---

### Ejercicio 16:

Ordena alfabéticamente un array con 7 palabras, puedes usar el algoritmo de la burbuja.

**Archivos:** [ejercicio16.html](./ejercicio16.html) / [script16.js](./script16.js)

---

### Ejercicio 17:

Realiza todos los ejercicios del 11 al 16 haciendo uso de un único fichero HTML, un único fichero Javascript y funciones (debes usar al menos una de cada tipo).

**Archivos:** [ejercicio17.html](./ejercicio17.html) / [script17.js](./script17.js)

---

### Ejercicio 18:

Dentro del mismo archivo de Javascript y con un único HTML crea:
* Una función que devuelva el número de cifras de un entero solicitado al usuario
* Una función que muestre al usuario una secuencia de * (se debe construir la cadena de uno en uno), la cantidad de * será solicitada al usuario
* Una función que permita mostrar la secuencia (se debe construir la cadena de uno en uno):

```
*+_*+_*+_*+_
```

* Una función que permita mostrar un triángulo como el siguiente:

```
*
**
***
****
*****
```

* Una función que devuelva la diferencia en días entre dos fechas del mismo año (sólo tenemos en cuenta dia y mes)

**Archivos:** [ejercicio18.html](./ejercicio18.html) / [script18.js](./script18.js)

---

### Ejercicio 19:

A partir del siguiente HTML:

```
    <!DOCTYPE html> 
    <html lang="es"> 
    <head> 
        <meta charset="UTF-8" /> 
        <title>Ejercicio DOM básico</title>
    </head>
    <body>
        <p>Lorem ipsum dolor sit amet, <a href="http://prueba">consectetuer adipiscing elit</a>. Sed 
        mattis enim vitae orci. Phasellus libero. Maecenas nisl arcu, consequat congue, commodo nec,
        commodo ultricies, turpis. Quisque sapien nunc, posuere vitae, rutrum et, luctus at, pede.
        Pellentesque massa ante, ornare id, aliquam vitae, ultrices porttitor, pede. Nullam sit amet
        nisl elementum elit convallis malesuada. Phasellus magna sem, semper quis, faucibus ut,
        rhoncus non, mi. <a href="http://prueba2">Fusce porta</a>. Duis pellentesque, felis eu
        adipiscing ullamcorper, odio urna consequat arcu, at posuere ante quam non dolor. Lorem ipsum
        dolor sit amet, consectetuer adipiscing elit. Duis scelerisque. Donec lacus neque, vehicula
        in, eleifend vitae, venenatis ac, felis. Donec arcu. Nam sed tortor nec ipsum aliquam
        ullamcorper. Duis accumsan metus eu urna. Aenean vitae enim. Integer lacus. Vestibulum
        venenatis erat eu odio. Praesent id metus.</p>
        <p>Aenean at nisl. Maecenas egestas dapibus odio. Vestibulum ante ipsum primis in faucibus
        orci luctus et ultrices posuere cubilia Curae; Proin consequat auctor diam. <a
        href="http://prueba">Ut bibendum blandit est</a>. Curabitur vestibulum. Nunc malesuada
        porttitor sapien. Aenean a lacus et metus venenatis porta. Suspendisse cursus, sem non dapibus
        tincidunt, lorem magna porttitor felis, id sodales dolor dolor sed urna. Sed rutrum nulla
        vitae tellus. Sed quis eros nec lectus tempor lacinia. Aliquam nec lectus nec neque aliquet
        dictum. Etiam <a href="http://prueba3">consequat sem quis massa</a>. Donec aliquam euismod
        diam. In magna massa, mattis id, pellentesque sit amet, porta sit amet, lectus. Curabitur
        posuere. Aliquam in elit. Fusce condimentum, arcu in scelerisque lobortis, ante arcu
        scelerisque mi, at cursus mi risus sed tellus.</p>
        <p>Donec sagittis, nibh nec ullamcorper tristique, pede velit feugiat massa, at sollicitudin
        justo tellus vitae justo. Vestibulum aliquet, nulla sit amet imperdiet suscipit, nunc erat
        laoreet est, a <a href="http://prueba">aliquam leo odio sed sem</a>. Quisque eget eros
        vehicula diam euismod tristique. Ut dui. Donec in metus sed risus laoreet sollicitudin. Proin
        et nisi non arcu sodales hendrerit. In sem. Cras id augue eu lorem dictum interdum. Donec
        pretium. Proin <a href="http://prueba4">egestas</a> adipiscing ligula. Duis iaculis laoreet
        turpis. Mauris mollis est sit amet diam. Curabitur hendrerit, eros quis malesuada tristique,
        ipsum odio euismod tortor, a vestibulum nisl mi at odio. <a href="http://prueba5">Sed non
        lectus non est pellentesque</a> auctor.</p>
    </body>
    </html> 
```

Se solicita:

* Número de enlaces de la página
* Dirección a la que enlaza el penúltimo enlace
* Numero de enlaces que enlazan a http://prueba
* Número de enlaces del tercer párrafo

AYUDA: Si queremos acceder al contenido de un atributo de un nodo elemento es suficiente con usar nodo.atributo (ej: p.id accede al contenido del id del nodo almacenado en p)

**Archivo:** [script19.js](./script19.js)

---

### Ejercicio 20:

A partir del siguiente código HTML (debes extraer el CSS y el JavaScript del mismo):

```
    <!DOCTYPE html> 
    <html lang="es"> 
        <head> 
            <meta charset="UTF-8" /> 
            <title>Ejercicio DOML</title>
            <style type="text/css">
                .oculto { display: none; }
                .visible { display: inline; }
            </style>
            <script type="text/javascript">
                function muestra() { }
            </script>
        </head>
        <body>
            <p id="texto">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed mattis enim vitae
            orci. Phasellus libero. Maecenas nisl arcu, consequat congue, commodo nec, commodo ultricies,
            turpis. Quisque sapien nunc, posuere vitae, rutrum et, luctus at, pede. Pellentesque massa
            ante, ornare id, aliquam vitae, ultrices porttitor, pede. <span id="adicional"
            class="oculto">Nullam sit amet nisl elementum elit convallis malesuada. Phasellus magna sem,
            semper quis, faucibus ut, rhoncus non, mi. Duis pellentesque, felis eu adipiscing ullamcorper,
            odio urna consequat arcu, at posuere ante quam non dolor. Lorem ipsum dolor sit amet,
            consectetuer adipiscing elit. Duis scelerisque. Donec lacus neque, vehicula in, eleifend
            vitae, venenatis ac, felis. Donec arcu. Nam sed tortor nec ipsum aliquam ullamcorper. Duis
            accumsan metus eu urna. Aenean vitae enim. Integer lacus. Vestibulum venenatis erat eu odio.
            Praesent id metus.</span>
            </p>
            <a id="enlace1" href="#" onclick="muestra();">Seguir leyendo</a> <br /> 
            <a id="enlace2" href="#" class="oculto">Atrás</a> <br />
        </body>
    </html>
```

Completar la función muestra de JavaScript para que realice lo siguiente:

* Ocultar el enlace Seguir leyendo.
* Mostrar el texto incluido dentro del span

Una vez acabada esta parte, realizar lo siguiente:

* Crear un nuevo evento en el enlace2 que llamará a la función oculta().
* Dicha función ocultará el enlace2, el texto el span y volverá a mostrar el enlace Seguir leyendo.

**Archivo:** [ejercicio20.html](./ejercicio20.html)

---

### Ejercicio 21:

## Ejercicio del cambio:

Disponemos en la caja del siguiente dinero distribuido de la siguiente manera: 234,27 € (información que se debe cargar en un array)

```
    - Billetes de 500€: 0
    - Billetes de 200€: 0
    - Billetes de 100€: 0
    - Billetes de 50€: 1 
    - Billetes de 20€: 4
    - Billetes de 10€: 8
    - Billetes de 5€: 2
    - Monedas de 2€: 5
    - Monedas de 1€: 4
    - Monedas de 0.50€: 0
    - Monedas de 0.20€: 0
    - Monedas de 0.10€: 1
    - Monedas de 0.05€: 2
    - Monedas de 0.02€: 3
    - Monedas de 0.01€: 1
```

El programa obtiene un precio de artículo y un importe pagado desglosado (se deben conocer las cantidades entregadas de todos los billetes y monedas) y responderá si no hay cambio, si está justo o si se devuelve cambio, de nuevo con el desglose que debe ser lo más óptimo (es decir, si puedo devolver un billete de 20, no devuelvo 2 de 10, por ejemplo).

Debemos mostrar al final el desglose del cambio y el nuevo estado de la caja.

**Archivos:** [script21_solucion1.js](./script21_solucion1.js) / [script21_solucion2.js](./script21_solucion2.js) / [script21_solucion3.js](./script21_solucion3.js)

---

### Ejercicio 22:

A partir del siguiente HTML:

```
    <!DOCTYPE html> <html lang="es"> 
    <head> 
        <meta charset="UTF-8" />
        <title>Ejercicio Eventos</title>
    </head>
    <body>
        <p id="contenidos_1">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed mattis enim
        vitae orci. Phasellus libero. Maecenas nisl arcu, consequat congue, commodo nec, commodo
        ultricies, turpis. Quisque sapien nunc, posuere vitae, rutrum et, luctus at, pede.
        Pellentesque massa ante, ornare id, aliquam vitae, ultrices porttitor, pede. Nullam sit amet
        nisl elementum elit convallis malesuada. Phasellus magna sem, semper quis, faucibus ut,
        rhoncus non, mi. Duis pellentesque, felis eu adipiscing ullamcorper, odio urna consequat arcu,
        at posuere ante quam non dolor. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis
        scelerisque.</p>
        <a id="enlace_1" href="#">Ocultar contenidos</a>
        <br/>
        <p id="contenidos_2">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed mattis enim
        vitae orci. Phasellus libero. Maecenas nisl arcu, consequat congue, commodo nec, commodo
        ultricies, turpis. Quisque sapien nunc, posuere vitae, rutrum et, luctus at, pede.
        Pellentesque massa ante, ornare id, aliquam vitae, ultrices porttitor, pede. Nullam sit amet
        nisl elementum elit convallis malesuada. Phasellus magna sem, semper quis, faucibus ut,
        rhoncus non, mi. Duis pellentesque, felis eu adipiscing ullamcorper, odio urna consequat arcu,
        at posuere ante quam non dolor. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis
        scelerisque.</p>
        <a id="enlace_2" href="#">Ocultar contenidos</a>
        <br/>
        <p id="contenidos_3">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed mattis enim
        vitae orci. Phasellus libero. Maecenas nisl arcu, consequat congue, commodo nec, commodo
        ultricies, turpis. Quisque sapien nunc, posuere vitae, rutrum et, luctus at, pede.
        Pellentesque massa ante, ornare id, aliquam vitae, ultrices porttitor, pede. Nullam sit amet
        nisl elementum elit convallis malesuada. Phasellus magna sem, semper quis, faucibus ut,
        rhoncus non, mi. Duis pellentesque, felis eu adipiscing ullamcorper, odio urna consequat arcu,
        at posuere ante quam non dolor. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis
        scelerisque.</p>
        <a id="enlace_3" href="#">Ocultar contenidos</a>
    </body>
    </html>
```

1. Cuando se pinche sobre el primer enlace, se oculte su sección relacionada

2. Cuando se vuelva a pinchar sobre el mismo enlace, se muestre otra vez esa sección de contenidos

3. Completar el resto de enlaces de la página para que su comportamiento sea idéntico al del primer enlace

4. Cuando una sección se oculte, debe cambiar el mensaje del enlace asociado (pista:propiedad innerHTML)

Soluciones:

* Display y una función

**Archivo:** [script22_solucion1.js](./script22_solucion1.js)

* Visibility y una función

**Archivo:** [script22_solucion2.js](./script22_solucion2.js)

* Dos funciones

**Archivo:** [script22_solucion3.js](./script22_solucion3.js)

* Usando this

**Archivo:** [script22_solucion4.js](./script22_solucion4.js)

---

### Ejercicio 23:

Partiendo del siguiente JSON

```
    {
        "localidade 1": {
        "Continente": "África",
        "País": "Angola",
        "Capital": "Luanda"
        },
        "localidade 2": {
        "Continente": "América do Norte",
        "País": "Estados Unidos",
        "Capital": "Washington DC"
        },
        "localidade 3": {
        "Continente": "América Central",
        "País": "México",
        "Capital": "Cidade do México"
        },
        "localidade 4": {
        "Continente": "América do Sul",
        "País": "Brasil",
        "Capital": "Brasília"
        },
        "localidade 5": {
        "Continente": "Europa",
        "País": "Espanha",
        "Capital": "Madri"
        },
        "localidade 6": {
        "Continente": "Europa",
        "País": "Alemanha",
        "Capital": "Berlim"
        },
        "localidade 7": {
        "Continente": "Oceania",
        "País": "Austrália",
        "Capital": "Camberra"
        },
        "localidade 8": {
        "Continente": "Ásia",
        "País": "Japão",
        "Capital": "Tóquio"
        }
    }
```

Siendo a la variable que almacena el JSON

* Código para obtener el país de la localidade 8
* Código que permite añadir una localidad a tu elección
* Modifica la localidade 4, añadiendo el número de habitantes
* Cambia la estructura del JSON de forma que sea más directo acceder a las capitales de las localidades, dado que va a ser el dato que más vamos a consultar

**Archivo:** [script23.js](./script23.js)

---

### Ejercicio 24:

A partir de la siguiente información, diseña y elabora un JSON que la contenga y permita acceder de manera lo más sencilla posible, a precio y calorías de cada desayuno.

![Ejercicio24_JS](images/Ejercicio24_JS.png)

**Archivo:** [ejercicio24.js](./ejercicio24.js)

---

### Ejercicio 25:

Formulario de contacto - Local Storage

* Crear un formulario de contacto con los siguientes campos:
    * Nombre
    * Email
    * Mensaje
* Guardar en Local Storage los datos de contacto enviados de cada usuario
* Mostrar los datos de los contactos guardados usando herramientas de DOM
* Usa JSON.parse() y JSON.stringify() para guardar muchos datos usando la misma clave

**Archivos:** [ejercicio25.html](./ejercicio25.html) / [script25.js](./script25.js)

---

### Ejercicio 26:

Avanzado - Local Storage

* Crea botón para borrar todos los contactos guardados en Local Storage
* Crea botón para borrar un contacto en concreto de Local Storage, buscando por email

**Archivos:** [ejercicio26.html](./ejercicio26.html) / [script26.js](./script26.js)

---

### Ejercicio 27:

Utilizando objetos Boolean realiza un programa que indique si un array de 6 elementos solicitado al usuario se encuentra ordenado de la siguiente forma (e1 > e3, e2 < e4 y e5 = e6)

**Archivos:** [ejercicio27.html](./ejercicio27.html) / [script27.js](./script27.js)

---

### Ejercicio 28:

Crea un array de dos dimensiones (matriz) que contenga números y cadenas solicitados al usuario, muestra por pantalla los elementos cadena que se encuentren en posiciones fila par y columna impar.

Ej:

```
1       Hola      3
Adiós   3         2   -> Muestra Hola y Manzana
4       Manzana   5
```

**Archivo:** [script28.js](./script28.js)

---

### Ejercicio 29:

Crea un array a partir de las siguientes instrucciones:

* El tamaño es solicitado al usuario
* Elemento1: 1
* Elemento2: 1
* ElementoN: ElementoN-1 + ElementoN-2

**Archivo:** [script29.js](./script29.js)

---

### Ejercicio 30:

Utilizando la siguiente API: https://dog.ceo/dog-api/

Que devuelve imágenes aleatorias, habrá que ir coleccionando diferentes razas de perros pulsando un botón e ir rellenando una matriz (4x5) como la que se ve en las imágenes.

Se va añadiendo cada imágen a una casilla, además de almacenar los perros que van apareciendo para poder sacar estadísticas al final.

En caso de que alguna raza esté repetida, no se pondrá en la colección.

Cuando se haya completado todo el álbum aparecerá una gráfica de todas las razas que han salido y la de veces que se han ido contando.

Las imágenes ilustran el funcionamiento, pero la apariencia de la aplicación depende del grupo y se debe cuidar tanto como el funcionamiento; además se deben usar conocimientos de Flexbox y Grid en la medida de las posibilidades del diseño.

![Ejercicio30_1](images/Ejercicio30_1.png)

![Ejercicio30_2](images/Ejercicio30_2.png)

![Ejercicio30_3](images/Ejercicio30_3.png)

**Archivos:** [ejercicio30.html](./ejercicio30.html) / [script27.js](./script27.js) / [style30.css](./style30.css)

---

### Ejercicio 31:

## Ejercicio FIREBASE

Partiendo de los siguientes archivos:

* readme.txt

```
    HTML
    JS
    Firebase 
    CSS - Bootstrap (Bootswatch - Pulse)
```

* index.html:

```
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CRUD Firebase</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/pulse/bootstrap.min.css"
                integrity="sha384-L7+YG8QLqGvxQGffJ6utDKFwmGwtLcCjtwvonVZR/Ba2VzhpMwBz51GaXnUsuYbj" crossorigin="anonymous">
        </head>

        <body>
            <div class="card text-white bg-info mb-6  offset-md-4" style="max-width: 20rem;">
                <div class="card-header">Formulario Tareas</div>
                <div class="card-body">
                    <form id="task-form">
                        <input type="text" id="task-title" class="form-control" placeholder="Título de la tarea"
                            autofocus>
                        <textarea id="task-description" class="form-control" placeholder="Descripción de la tarea" cols="10"
                            rows="5"></textarea>
                        <br>

                        <input type="submit" value="Enviar Tarea" class="btn btn-lg btn-primary" id="task-button">

                    </form>

                </div>
            </div>
            <br>
            <h3>Listado de tareas existente</h3>

            <script src="utils.js" type="module" defer></script>
            <script src="index.js" type="module" defer></script>
        </body>

    </html>
```

* utils.js

```
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
    import { getFirestore, collection, getDocs, doc, setDoc, deleteDoc  } from 'https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js';
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries

    // Your web app's Firebase configuration
    const firebaseConfig = {
        apiKey: "AIzaSyBLJ35A6HuDHkuprTuVYQc4QWa2L0ZMzEM",
        authDomain: "primer-proyecto-c744f.firebaseapp.com",
        projectId: "primer-proyecto-c744f",
        storageBucket: "primer-proyecto-c744f.appspot.com",
        messagingSenderId: "160376708376",
        appId: "1:160376708376:web:499217c74f6dc9304dd26d"
    };

    // Initialize Firebase
    export const app = initializeApp(firebaseConfig);
    export const db = getFirestore(app);
    export const querySnapshot = await getDocs(collection(db, "tasks"));

    function createCard(id, task) {
        //<div class="card text-white bg-info mb-6  offset-md-4" style="max-width: 20rem;">
        const principalDiv = document.createElement('div');
        principalDiv.setAttribute("class", "card bg-light mb-3");
        principalDiv.style = "max-width: 20rem;";
        principalDiv.setAttribute("name",id);
        //<div class="card-header">Formulario Tareas</div>
        const headerDiv = document.createElement('div');
        const contentDiv = document.createTextNode("Id: " + id);
        headerDiv.setAttribute("class", "card-header");
        
        headerDiv.appendChild(contentDiv);
        principalDiv.appendChild(headerDiv);
        // <div class="card-body">
        const bodyDiv = document.createElement('div');
        const pTitle = document.createElement("p");
        const pTitleText = document.createTextNode("Title: " + task.title);
        const hr = document.createElement('hr');
        const pDesc = document.createElement("p");
        const pDescText = document.createTextNode("Description: " + task.description);
        
        pTitle.appendChild(pTitleText);
        bodyDiv.appendChild(pTitle);
        bodyDiv.appendChild(hr);
        pDesc.appendChild(pDescText);
        bodyDiv.appendChild(pDesc);
        bodyDiv.appendChild(hr);
        
        
        var input = document.createElement("input");
        input.type = "button";
        input.value = "Borrar Tarea";
        input.setAttribute("name", "delete");
        input.setAttribute("id",id);
        bodyDiv.appendChild(input);
    
        principalDiv.appendChild(bodyDiv);

        document.body.appendChild(principalDiv);
        const br = document.createElement("br");
        document.body.appendChild(br);
        
    }

    export function getTasks() {
        querySnapshot.forEach((doc) => {
            createCard(doc.id, doc.data());
        });
    }
    function generateRandomIdTask(num) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        const charactersLength = characters.length;
        for (let i = 0; i < num; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }

        return result;
    }
    export async function insertTask(task) {
        await setDoc(doc(db, "tasks", generateRandomIdTask(20)), task);
        alert("Insertada la tarea: "+task.title);
    }

    export async function deleteTask(id){
        await deleteDoc(doc(db, "tasks", id));   
        alert("Borrada la tarea: "+id);
    }
```

* index.js

```
    //Me traigo mi db firestore
    import { getTasks, insertTask, deleteTask} from "./utils.js";
    //console.log(db);
    //Extraigo todos los documentos de tasks y creo tarjetas con ellos
    getTasks();


    //Obtenemos el form y capturamos el submit
    const form = document.getElementById("task-form");
    form.addEventListener("submit", e => {
        e.preventDefault();
        const task = {
            title: form["task-title"].value,
            description: form["task-description"].value
        }

        insertTask(task);
    })


    const buttonsCardD = document.getElementsByName("delete");
    buttonsCardD.forEach(element => {
        element.addEventListener("click",  () => {
            var divDelete = element.parentNode.parentNode;
            document.body.removeChild(divDelete);
            //console.log("Estoy borrando la tarea: "+element.id);
            deleteTask(element.id);
        })
    });
```

1. Crea tu proyecto, BD y colección tasks en Firestore dentro de Firebase
2. Cambia los datos de acceso usando los de tu aplicación
3. Añade la actualización de datos a la aplicación y mejora en la medida de lo posible la UI.

Se ha realizado una BD sobre los datos de libros de una biblioteca.

```
ejercicio31/
├── index.html
├── utils.js
├── index.js
├── style.css
├── biblioteca.png
├── bibliotecario.png
```

**Directorio:** [ejercicio31](./ejercicio31/)

