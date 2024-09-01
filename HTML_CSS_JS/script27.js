function checkArray() {
    // Obtener los valores de los campos de entrada
    let e1 = document.getElementById("e1").value;
    let e2 = document.getElementById("e2").value;
    let e3 = document.getElementById("e3").value;
    let e4 = document.getElementById("e4").value;
    let e5 = document.getElementById("e5").value;
    let e6 = document.getElementById("e6").value;

    // Validar si todos los elementos están presentes
    if (e1 === "" || e2 === "" || e3 === "" || e4 === "" || e5 === "" || e6 === "") {
        document.getElementById("result").textContent = "Por favor, introduce valores en todos los campos.";
        return;
    }

    // Verificar las condiciones usando los valores ingresados
    let condition1 = new Boolean(e1 > e3);
    let condition2 = new Boolean(e2 < e4);
    let condition3 = new Boolean(e5 === e6);

    // Evaluar si todas las condiciones son verdaderas
    let allConditionsMet = condition1.valueOf() && condition2.valueOf() && condition3.valueOf();

    // Mostrar el resultado
    let resultText = allConditionsMet ? "El array cumple con todas las condiciones." : "El array no cumple con todas las condiciones.";
    document.getElementById("result").textContent = resultText;
}
