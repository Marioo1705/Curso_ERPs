const usuarioCorrecto = "mario";
const passCorrecto = '123';
const maximoIntentos = 3;
let numeroIntentos = 0;
let intentosRestantes;
function datosUsuario () {    
    while (numeroIntentos < maximoIntentos) {
        let usuario = prompt("Introduce tu usuario");
        let pass = prompt("Introduce tu password");
        if (usuario === usuarioCorrecto && pass === passCorrecto) {
            alert('Acceso concedido');
            return;
        }
        else {
            numeroIntentos++;
            intentosRestantes = maximoIntentos - numeroIntentos;
                if (intentosRestantes == 0) {
                    alert('Acceso denegado');
                    return;
                }
            alert('Datos incorrectos, te quedan '+intentosRestantes+' intentos');
        }
    }    
}