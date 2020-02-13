var junior = {
    nombre: "Junior",
    edad: 25,
    ingeniero: true,
    abogado: false,
    cocinero: true,
    futbolista: true
}

function imprimirDatos(persona) {
    console.log(`${persona.nombre} es:`);

    if (persona.ingeniero === true) {
        console.log("Ingeniero")
    }
}