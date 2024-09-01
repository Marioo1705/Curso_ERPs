/* A partir de la siguiente información, diseña y elabora un JSON que la contenga 
y permita acceder de manera lo más sencilla posible, a precio y calorías de cada desayuno. */
let a = {
    "desayunos" : [ {
            "Nombre" : "Gofres Belgas",
            "Precio" : 5.95,
            "Descripción" : "Dos de nuestros famosos Gofres belgas con abundante sirope",
            "Calorías" : 650
        },
        {
            "Nombre" : "Gofres Belgas con fresas",
            "Precio" : 7.95,
            "Descripción" : "Ligeros gofres belgas cubiertos de fresas y nata montada",
            "Calorías" : 900
        },
        {
            "Nombre" : "Gofres Belgas con frutas del bosque",
            "Precio" : 8.95,
            "Descripción" : "Ligeros gofres belgas cubiertos con frutas del bosque y nata montada",
            "Calorías" : 900
        },
        {
            "Nombre" : "Tostada Francesa",
            "Precio" : 4.50,
            "Descripción" : "Dos gruesas rebanadas de nuestro pan francés casero",
            "Calorías" : 600
        },
        {
            "Nombre" : "Desayuno de la casa",
            "Precio" : 6.95,
            "Descripción" : "Dos huevos, bacon o salchicha, tostada y patatas fritas",
            "Calorías" : 950
        }
    ]
}
console.log(a.desayunos[0].Precio);
console.log(a.desayunos[0].Calorías);