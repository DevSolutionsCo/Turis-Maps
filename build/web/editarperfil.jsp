<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/signStyles.css">
           <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
   <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="https://unpkg.com/tippy.js@6"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>

        <title>Sign Up</title>
    </head>
    <body>
        <%
            String nombre_user = (String) session.getAttribute("nombre_user");
            String correo = (String) session.getAttribute("correo");
            String nombre = (String) session.getAttribute("nombre");
            String apellido_mat = (String) session.getAttribute("apellido_mat");
            String apellido_pat = (String) session.getAttribute("apellido_pat");
            String lugar_proc = (String) session.getAttribute("lugar_proc");
            String genero = (String) session.getAttribute("genero");
            String contrasena = (String) session.getAttribute("contrasena");
            String id_turista = (String) session.getAttribute("id_turista");
        
        %>
        
        
    <div  class="signUp-box">
                         <a href="index.jsp" >Regresar</a>

        <h2>Editar Perfil</h2>
        <form id="edit" action="actualizame.jsp">
            <div class="user-box">
                <input type="text" class="inputs" name="nombre_a" id="nombre_1" value="<%=nombre%>">
                <label class="labels">Nombre</label>

            </div>
            <div class="user-box">
                <input class="inputs" type="text" name="apellido_pat_a" id="apellido_pat" value="<%=apellido_pat%>">
                <label class="labels">Apellido Paterno</label>
            </div>
                        <div class="user-box">
                <input class="inputs" type="text" name="apellido_mat_a" id="apellido_mat"  value="<%=apellido_mat%>">
                <label class="labels">Apellido Materno</label>
            </div>
            <div class="user-box">
                <label class="labels-pais">Pais de Procedencia</label>
                <select class="selects" type="text" name="lugar_proc_a" id="pais">
                    <option class="selects" selected><%=lugar_proc%></option>
                    <option class="inputs" value="Afganistán">Afganistán</option>
                    <option class="inputs" value="Albania">Albania</option>
                    <option class="inputs" value="Alemania">Alemania</option>
                    <option class="inputs" value="Andorra">Andorra</option>
                    <option class="inputs" value="Angola">Angola</option>
                    <option class="inputs" value="Antigua y Barbuda">Antigua y Barbuda</option>
                    <option class="inputs" value="Arabia Saudita">Arabia Saudita</option>
                    <option class="inputs" value="Argelia">Argelia</option>
                    <option class="inputs" value="Argentina">Argentina</option>
                    <option class="inputs" value="Armenia">Armenia</option>
                    <option class="inputs" value="Australia">Australia</option>
                    <option class="inputs" value="Austria">Austria</option>
                    <option class="inputs" value="Azerbaiyán">Azerbaiyán</option>
                    <option class="inputs" value="Bahamas">Bahamas</option>
                    <option class="inputs" value="Bangladés">Bangladés</option>
                    <option class="inputs" value="Barbados">Barbados</option>
                    <option class="inputs" value="Baréin">Baréin</option>
                    <option class="inputs" value="Bélgica">Bélgica</option>
                    <option class="inputs" value="Belice">Belice</option>
                    <option class="inputs" value="Benín">Benín</option>
                    <option class="inputs" value="Bielorrusia">Bielorrusia</option>
                    <option class="inputs" value="Birmania/Myanmar">Birmania/Myanmar</option>
                    <option class="inputs" value="Bolivia">Bolivia</option>
                    <option class="inputs" value="Bosnia y Herzegovina">Bosnia y Herzegovina</option>
                    <option class="inputs" value="Botsuana">Botsuana</option>
                    <option class="inputs" value="Brasil">Brasil</option>
                    <option class="inputs" value="Brunéi">Brunéi</option>
                    <option class="inputs" value="Bulgaria">Bulgaria</option>
                    <option class="inputs" value="Burkina Faso">Burkina Faso</option>
                    <option class="inputs" value="Burundi">Burundi</option>
                    <option class="inputs" value="Bután">Bután</option>
                    <option class="inputs" value="Cabo Verde">Cabo Verde</option>
                    <option class="inputs" value="Camboya">Camboya</option>
                    <option class="inputs" value="Camerún">Camerún</option>
                    <option class="inputs" value="Canadá">Canadá</option>
                    <option class="inputs" value="Catar">Catar</option>
                    <option class="inputs" value="Chad">Chad</option>
                    <option class="inputs" value="Chile">Chile</option>
                    <option class="inputs" value="China">China</option>
                    <option class="inputs" value="Chipre">Chipre</option>
                    <option class="inputs" value="Ciudad del Vaticano">Ciudad del Vaticano</option>
                    <option class="inputs" value="Colombia">Colombia</option>
                    <option class="inputs" value="Comoras">Comoras</option>
                    <option class="inputs" value="Corea del Norte">Corea del Norte</option>
                    <option class="inputs" value="Corea del Sur">Corea del Sur</option>
                    <option class="inputs" value="Costa de Marfil">Costa de Marfil</option>
                    <option class="inputs" value="Costa Rica">Costa Rica</option>
                    <option class="inputs" value="Croacia">Croacia</option>
                    <option class="inputs" value="Cuba">Cuba</option>
                    <option class="inputs" value="Dinamarca">Dinamarca</option>
                    <option class="inputs" value="Dominica">Dominica</option>
                    <option class="inputs" value="Ecuador">Ecuador</option>
                    <option class="inputs" value="Egipto">Egipto</option>
                    <option class="inputs" value="El Salvador">El Salvador</option>
                    <option class="inputs" value="Emiratos Árabes Unidos">Emiratos Árabes Unidos</option>
                    <option class="inputs" value="Eritrea">Eritrea</option>
                    <option class="inputs" value="Eslovaquia">Eslovaquia</option>
                    <option class="inputs" value="Eslovenia">Eslovenia</option>
                    <option class="inputs" value="España">España</option>
                    <option class="inputs" value="Estados Unidos">Estados Unidos</option>
                    <option class="inputs" value="Estonia">Estonia</option>
                    <option class="inputs" value="Etiopía">Etiopía</option>
                    <option class="inputs" value="Filipinas">Filipinas</option>
                    <option class="inputs" value="Finlandia">Finlandia</option>
                    <option class="inputs" value="Fiyi">Fiyi</option>
                    <option class="inputs" value="Francia">Francia</option>
                    <option class="inputs" value="Gabón">Gabón</option>
                    <option class="inputs" value="Gambia">Gambia</option>
                    <option class="inputs" value="Georgia">Georgia</option>
                    <option class="inputs" value="Ghana">Ghana</option>
                    <option class="inputs" value="Granada">Granada</option>
                    <option class="inputs" value="Grecia">Grecia</option>
                    <option class="inputs" value="Guatemala">Guatemala</option>
                    <option class="inputs" value="Guyana">Guyana</option>
                    <option class="inputs" value="Guinea">Guinea</option>
                    <option class="inputs" value="Guinea ecuatorial">Guinea ecuatorial</option>
                    <option class="inputs" value="Guinea-Bisáu">Guinea-Bisáu</option>
                    <option class="inputs" value="Haití">Haití</option>
                    <option class="inputs" value="Honduras">Honduras</option>
                    <option class="inputs" value="Hungría">Hungría</option>
                    <option class="inputs" value="India">India</option>
                    <option class="inputs" value="Indonesia">Indonesia</option>
                    <option class="inputs" value="Irak">Irak</option>
                    <option class="inputs" value="Irán">Irán</option>
                    <option class="inputs" value="Irlanda">Irlanda</option>
                    <option class="inputs" value="Islandia">Islandia</option>
                    <option class="inputs" value="Islas Marshall">Islas Marshall</option>
                    <option class="inputs" value="Islas Salomón">Islas Salomón</option>
                    <option class="inputs" value="Israel">Israel</option>
                    <option class="inputs" value="Italia">Italia</option>
                    <option class="inputs" value="Jamaica">Jamaica</option>
                    <option class="inputs" value="Japón">Japón</option>
                    <option class="inputs" value="Jordania">Jordania</option>
                    <option class="inputs" value="Kazajistán">Kazajistán</option>
                    <option class="inputs" value="Kenia">Kenia</option>
                    <option class="inputs" value="Kirguistán">Kirguistán</option>
                    <option class="inputs" value="Kiribati">Kiribati</option>
                    <option class="inputs" value="Kuwait">Kuwait</option>
                    <option class="inputs" value="Laos">Laos</option>
                    <option class="inputs" value="Lesoto">Lesoto</option>
                    <option class="inputs" value="Letonia">Letonia</option>
                    <option class="inputs" value="Líbano">Líbano</option>
                    <option class="inputs" value="Liberia">Liberia</option>
                    <option class="inputs" value="Libia">Libia</option>
                    <option class="inputs" value="Liechtenstein">Liechtenstein</option>
                    <option class="inputs" value="Lituania">Lituania</option>
                    <option class="inputs" value="Luxemburgo">Luxemburgo</option>
                    <option class="inputs" value="Macedonia del Norte">Macedonia del Norte</option>
                    <option class="inputs" value="Madagascar">Madagascar</option>
                    <option class="inputs" value="Malasia">Malasia</option>
                    <option class="inputs" value="Malaui">Malaui</option>
                    <option class="inputs" value="Maldivas">Maldivas</option>
                    <option class="inputs" value="Malí">Malí</option>
                    <option class="inputs" value="Malta">Malta</option>
                    <option class="inputs" value="Marruecos">Marruecos</option>
                    <option class="inputs" value="Mauricio">Mauricio</option>
                    <option class="inputs" value="Mauritania">Mauritania</option>
                    <option class="inputs" value="México">México</option>
                    <option class="inputs" value="Micronesia">Micronesia</option>
                    <option class="inputs" value="Moldavia">Moldavia</option>
                    <option class="inputs" value="Mónaco">Mónaco</option>
                    <option class="inputs" value="Mongolia">Mongolia</option>
                    <option class="inputs" value="Montenegro">Montenegro</option>
                    <option class="inputs" value="Mozambique">Mozambique</option>
                    <option class="inputs" value="Namibia">Namibia</option>
                    <option class="inputs" value="Nauru">Nauru</option>
                    <option class="inputs" value="Nepal">Nepal</option>
                    <option class="inputs" value="Nicaragua">Nicaragua</option>
                    <option class="inputs" value="Níger">Níger</option>
                    <option class="inputs" value="Nigeria">Nigeria</option>
                    <option class="inputs" value="Noruega">Noruega</option>
                    <option class="inputs" value="Nueva Zelanda">Nueva Zelanda</option>
                    <option class="inputs" value="Omán">Omán</option>
                    <option class="inputs" value="Países Bajos">Países Bajos</option>
                    <option class="inputs" value="Pakistán">Pakistán</option>
                    <option class="inputs" value="Palaos">Palaos</option>
                    <option class="inputs" value="Panamá">Panamá</option>
                    <option class="inputs" value="Papúa Nueva Guinea">Papúa Nueva Guinea</option>
                    <option class="inputs" value="Paraguay">Paraguay</option>
                    <option class="inputs" value="Perú">Perú</option>
                    <option class="inputs" value="Polonia">Polonia</option>
                    <option class="inputs" value="Portugal">Portugal</option>
                    <option class="inputs" value="Reino Unido">Reino Unido</option>
                    <option class="inputs" value="República Centroafricana">República Centroafricana</option>
                    <option class="inputs" value="República Checa">República Checa</option>
                    <option class="inputs" value="República del Congo">República del Congo</option>
                    <option class="inputs" value="República Democrática del Congo">República Democrática del Congo</option>
                    <option class="inputs" value="República Dominicana">República Dominicana</option>
                    <option class="inputs" value="República Sudafricana">República Sudafricana</option>
                    <option class="inputs" value="Ruanda">Ruanda</option>
                    <option class="inputs" value="Rumanía">Rumanía</option>
                    <option class="inputs" value="Rusia">Rusia</option>
                    <option class="inputs" value="Samoa">Samoa</option>
                    <option class="inputs" value="San Cristóbal y Nieves">San Cristóbal y Nieves</option>
                    <option class="inputs" value="San Marino">San Marino</option>
                    <option class="inputs" value="San Vicente y las Granadinas">San Vicente y las Granadinas</option>
                    <option class="inputs" value="Santa Lucía">Santa Lucía</option>
                    <option class="inputs" value="Santo Tomé y Príncipe">Santo Tomé y Príncipe</option>
                    <option class="inputs" value="Senegal">Senegal</option>
                    <option class="inputs" value="Serbia">Serbia</option>
                    <option class="inputs" value="Seychelles">Seychelles</option>
                    <option class="inputs" value="Sierra Leona">Sierra Leona</option>
                    <option class="inputs" value="Singapur">Singapur</option>
                    <option class="inputs" value="Siria">Siria</option>
                    <option class="inputs" value="Somalia">Somalia</option>
                    <option class="inputs" value="Sri Lanka">Sri Lanka</option>
                    <option class="inputs" value="Suazilandia">Suazilandia</option>
                    <option class="inputs" value="Sudán">Sudán</option>
                    <option class="inputs" value="Sudán del Sur">Sudán del Sur</option>
                    <option class="inputs" value="Suecia">Suecia</option>
                    <option class="inputs" value="Suiza">Suiza</option>
                    <option class="inputs" value="Surinam">Surinam</option>
                    <option class="inputs" value="Tailandia">Tailandia</option>
                    <option class="inputs" value="Tanzania">Tanzania</option>
                    <option class="inputs" value="Tayikistán">Tayikistán</option>
                    <option class="inputs" value="Timor Oriental">Timor Oriental</option>
                    <option class="inputs" value="Togo">Togo</option>
                    <option class="inputs" value="Tonga">Tonga</option>
                    <option class="inputs" value="Trinidad y Tobago">Trinidad y Tobago</option>
                    <option class="inputs" value="Túnez">Túnez</option>
                    <option class="inputs" value="Turkmenistán">Turkmenistán</option>
                    <option class="inputs" value="Turquía">Turquía</option>
                    <option class="inputs" value="Tuvalu">Tuvalu</option>
                    <option class="inputs" value="Ucrania">Ucrania</option>
                    <option class="inputs" value="Uganda">Uganda</option>
                    <option class="inputs" value="Uruguay">Uruguay</option>
                    <option class="inputs" value="Uzbekistán">Uzbekistán</option>
                    <option class="inputs" value="Vanuatu">Vanuatu</option>
                    <option class="inputs" value="Venezuela">Venezuela</option>
                    <option class="inputs" value="Vietnam">Vietnam</option>
                    <option class="inputs" value="Yemen">Yemen</option>
                    <option class="inputs" value="Yibuti">Yibuti</option>
                    <option class="inputs" value="Zambia">Zambia</option>
                    <option class="inputs" value="Zimbabue">Zimbabue</option>
                </select>
            </div>
            <div class="user-box">
                <label class="labels-gen">Genero</label>
                <BR>
                <select type="text" class="selects" name="genero_a" id="genero">
                    <option class="selects" selected><%=genero%></option>
                    <option class="inputs" value="Masculino">Masculino</option>
                    <option class="inputs" value="Femenino">Femenino</option>
                    <option class="inputs" value="NB">NB</option>
                </select>
                
            </div>
            <div class="user-box">
                <input type="password" name="passw_a" class="inputs" id="contraseña_1" value="<%=contrasena%>">
                <label class="labels">Contraseña</label>
            </div>
                        <div class="user-box">
                <input type="password" name="passw" class="inputs" id="contraseña_2">
                <label class="labels">Confirmar contraseña</label>
            </div>
            <p class="warnings" id="warnings"></p>
            <div class="btn-iniciar">
                    <input type="hidden" name="accion" value="Guardar" id ="accion">
                    <input type="submit" name="action" value="Confirmar Cambios" id="accion">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    
            </div>
             <script>
                    
                    const edit = document.getElementById("edit");
                    const contraseña_1 = document.getElementById("contraseña_1");
                    const contraseña_2 = document.getElementById("contraseña_2");

                    const apellido_pat_1 = document.getElementById("apellido_pat");
                    const apellido_mat_1 = document.getElementById("apellido_mat");
                    const pais_1 = document.getElementById("lugar_proc");
                    const genero_1 = document.getElementById("genero");
                    const nombre_1 = document.getElementById("nombre_1");

                    
                    edit.addEventListener('submit', a=>{
                    let paisNull= "Elige tu Pais";
                    let generoNull = "Elige tu Genero";
                    
                    
                      
                      if(contraseña_1.value !== contraseña_2.value){
                           a.preventDefault();
                                  Swal.fire({
                                  icon: 'error',
                                  title: 'Confirmación de contraseña invalido',
                                  text: 'Las contraseñas deben coincidir'
                                });
                      }
        if(nombre_1.value.length > 40 || nombre_1.value.length < 3){
                                  a.preventDefault();
                                  Swal.fire({
                                  icon: 'error',
                                  title: 'Nombre invalido',
                                  text: 'Los nombres deben tener de 3-40 caracteres'
                                });
                              }else
                                                
                            if(contraseña_1.value.length > 20 || contraseña_1.value.length < 8){
                                a.preventDefault();
                                Swal.fire({
                                icon: 'error',
                                title: 'Contraseña invalida',
                                text: 'La contraseña debe tener de 8-20 caracteres'
                              });
                            }else
                                if(apellido_pat_1.value.length > 80 || apellido_pat_1.value.length < 3 || apellido_mat_1.value.length > 80 || apellido_mat_1.value.length < 3)  {
                                    a.preventDefault();
                                    Swal.fire({
                                    icon: 'error',
                                    title: 'Apellidos invalidos',
                                    text: 'Los apellidos deben tener de 3-80 caracteres'
                                  });
                                }else
                                    if(pais_1.value === paisNull)  {
                                        a.preventDefault();
                                        Swal.fire({
                                        icon: 'error',
                                        title: 'Pais invalido',
                                        text: 'Debes elegir un pais'
                                      });
                                    }else
                                        if(genero_1.value === generoNull)  {
                                            a.preventDefault();
                                            Swal.fire({
                                            icon: 'error',
                                            title: 'Genero invalido',
                                            text: 'Debes elegir un genero'
                                          });
                                        }
                                            
                        
                            
                        
                    }); 
                </script>
        </form>
    </div>
    </body>
</html>