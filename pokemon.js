'use strict'

window.addEventListener('load', () => {



    var formulario = document.querySelector("#formulario");
    formulario.addEventListener('submit', () => {
        var rivera = document.querySelector("#rivera");
        var numero = document.querySelector("#busqueda1").value;
        const url = `https://pokeapi.co/api/v2/pokemon/${numero}`
        fetch(url)
            .then(junior => junior.json())
            .then(datos => {
                console.log(datos);
                /* rivera.innerHTML = `<p>${datos.name}</p>
                 <img src='${datos.sprites.front_default}'>`*/
                var elemento = document.createElement("p");


                elemento.innerHTML = `<h1>${datos.name}</h1><br>` + `<img src='${datos.sprites.front_default}'>`

                var medrano = JSON.stringify(datos.name)
                localStorage.setItem(medrano, medrano);
                rivera.append(medrano);

                rivera.append(elemento);



            })

    })



})