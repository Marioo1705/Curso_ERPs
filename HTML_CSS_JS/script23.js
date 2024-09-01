let mundo = {
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
// Código para obtener el país de la localidade 8
console.log(mundo["localidade 8"].País);
// Código que permite añadir una localidad a tu elección
mundo["localidade 9"] = {
    "Continente" : "Europa",
    "País" : "España con ñ",
    "Capital" : "Torrelodones"
}
console.log(mundo["localidade 9"]);
// Modifica la localidade 4, añadiendo el número de habitantes
mundo["localidade 4"]["Número de habitantes"] = 20000000;
console.log(mundo["localidade 4"]);
/* Cambia la estructura del JSON de forma que sea más directo acceder a las capitales de las localidades, 
dado que va a ser el dato que más vamos a consultar */
let mundo2 = {
    "localidades" : [ {
        "Continente" : "África",
        "País" : "Angola",
        "Capital" : "Luanda"
        },
        {
        "Continente" : "América del Norte",
        "País" : "Estados Unidos",
        "Capital" : "Washington DC"
        },
        {
        "Continente" : "América Central",
        "País" : "México",
        "Capital" : "México DC"
        },
        {
        "Continente" : "América del Sur",
        "País" : "Brasil",
        "Capital" : "Brasilia",
        "Número de habitantes" : 20000000
        },
        {
        "Continente" : "Europa",
        "País" : "España",
        "Capital" : "Madrid"
        },
        {
        "Continente" : "Europa",
        "País" : "Alemania",
        "Capital" : "Berlín"
        },
        {
        "Continente" : "Oceanía",
        "País" : "Australia",
        "Capital" : "Camberra"
        },
        {
        "Continente" : "Asia",
        "País" : "Japón",
        "Capital" : "Tokio"
        },
        {
        "Continente" : "Europa",
        "País" : "España con ñ",
        "Capital" : "Torrelodones"
        }
    ]
}
console.log(mundo2);
console.log(mundo2.localidades[0].Capital);