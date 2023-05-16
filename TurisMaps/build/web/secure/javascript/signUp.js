/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const correo = document.getElementById("correo");
const nombre = document.getElementById("nombre");
const apellidos = document.getElementById("apellidos");
const fecha_nac = document.getElementById("fecha_nac");
const pais = document.getElementById("pais");
const genero = document.getElementById("genero");
const contraseña = document.getElementById("contraseña");
const parrafo = document.getElementById("warnings");
const crear = document.getElementById("crear");

crear.addEventListener('click', e=>{
    e.preventDefault();
    var edad
    function calcularEdad(fecha_nac) {
        var hoy = new Date();
        var cumpleanos = new Date(fecha_nac);
        var edad = hoy.getFullYear() - cumpleanos.getFullYear();
        var m = hoy.getMonth() - cumpleanos.getMonth();
        if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
            edad--;
        }
        return edad;
    }
    let generoNull = "Elige tu Genero";
    let paisNull= "Elige tu Pais";
    let warnings ="";
    let entrar = false;
    let regexEmail = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,4})+$/;
    parrafo.innerHTML = "";
    if(nombre.value.length > 40 || nombre.value.length < 3){
        warnings = "Los nombres deben tener de 3-40 caracteres <br>";
        entrar = true;
    }
    if(!regexEmail.test(correo.value) || correo.value > 30){
        warnings="El email no es valido <br>";
        entrar=true;
    }
    if(contraseña.value.length > 20 || contraseña.value.length < 8){
        warnings = "La contraseña debe tener de 8-20 caracteres<br>";
        entrar = true;
    }
    if(apellidos.value.length > 80 || apellidos.value.length < 5)  {
        warnings = "Los apellidos deben tener de 5-80 caracteres<br>";
        entrar = true;
    }
    if(pais.value === paisNull)  {
        warnings = "Debes elegir un pais<br>";
        entrar = true;
    }
    if(genero.value === generoNull)  {
        warnings = "Debes elegir un genero<br>";
        entrar = true;
    }
    if(edad < 15 || edad > 100){
        warnings = "La fecha de nacimiento no es valida<br>";
        entrar = true;
    }
    if(entrar){
        parrafo.innerHTML = warnings;
    }else{
        window.location="../../index.jsp";
    }
        
})





