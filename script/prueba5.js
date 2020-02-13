var color = document.querySelector("#color");
var seleccion = color.selectedIndex;
var texto1 = document.querySelector("#texto1");
var texto2 = document.querySelector("#texto2");
var texto3 = document.querySelector("#texto3");


color.addEventListener('click', () => {
    texto1 = seleccion
    texto2 = seleccion.options[seleccion].text;
    texto3 = seleccion.options[seleccion].value;
})