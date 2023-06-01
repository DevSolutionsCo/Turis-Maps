<%-- 
    Document   : index
    Created on : 14 may 2023, 22:30:02
    Author     : ruizl
--%>

<%@page import="org.turis.service.TuristaService"%>
<%@page import="java.util.List"%>
<%@page import="org.turis.helper.TuristaHelper"%>
<%@page import="org.turis.dao.Turista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"   crossorigin="anonymous">

        <link rel="stylesheet" href="css/Style_Index.css">
 
        <link rel="stylesheet" href="css/mapaStyles.css">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TurisMaps</title>
    </head>
    <body>
        <!--header?? -->
        <header></header>
        <!-- ============================ -->

        <!-- ===============BARRA DE NAVEGACION===============-->
        <div id="navBarID">
            <nav class="navbar navbar-expand-md navbar-light bg-light" id="NavBarXD">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="img/logo_Dev_Mini.png" alt="" width="54" height="54">
                        <span class ="LogoText">TurisMaps</span>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <form class="d-flex" id="SearchBar">
                            <input class="form-control me-2" type="search" placeholder="Buscar" id="popup_l1_coyo" aria-label="Search">
                            <button class="btn btn-dark btn-dark-outline-success" type="submit">Buscar</button>
                        </form>
                        <ul class="navbar-nav d-flex ms-auto " id="navlista">
                            <li class="nav-item" id="liNav">
                                <a class="nav-link active" aria-current="page" href="#"> <span class="navegacionspan"> Inicio </span> </a>
                            </li>
                            <li class="nav-item" id="liNav">
                                <a class="nav-link active" target="_blank" href="http://devsolutions.gerdoc.com/"> <span class="navegacionspan">Descúbrenos</span></a>
                            </li>
                            <li class="nav-item" id="liNav">
                                <a class="nav-link active" aria-current="page" href="#mapa"> <span class="navegacionspan"> Mapa </span> </a>
                            </li>
                            <li class="nav-item" id="liNav">
                                <div class="input-group mb-3" id ="botonsesion">
                                    <%
                                       int valor = 0;
                                        String signUp = (String) session.getAttribute("signUp");

                                        if (signUp != null) {
                                            if ("crearCuenta".equals(signUp)) {
                                                valor = 1;
                                            }else
                                                if("sesionCerrada".equals(signUp)){
                                                   valor=0;
                                            }
                                        }else{
                                            valor = 0;
                                        }
                                        
                                        String nombre_user = (String) session.getAttribute("nombre_user");
                                        String botonPresionado = request.getParameter("botonPresionado");
                                    if (botonPresionado != null && botonPresionado.equals("Iniciar Sesion")) 
                                    {

                                        %>
                                    <button class="btn btn-outline-dark"  type="button" id="borderboton" data-bs-toggle="dropdown" ><%=nombre_user%></button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="editarperfil.jsp">Editar Perfil</a></li>
                                         <li><a class="dropdown-item" onclick="cerrarSesion()">Cerrar sesión</a></li>
                                         <script>
                                            function cerrarSesion() {
                                              var xhr = new XMLHttpRequest();
                                              xhr.open("GET", "cerrarSesion.jsp?signUp=crearCuenta", true);
                                              xhr.onreadystatechange = function () {
                                                if (xhr.readyState === 4 && xhr.status === 200) {
                                                  window.location.href = "index.jsp";
                                                }
                                              };
                                              xhr.send();
                                            }
                                          </script>
                                         <%
                                         %>
                                    </ul>   
                                        <%
                                    }else
                                        if (nombre_user != null && valor == 1) {
                                                %>
                                                <button class="btn btn-outline-dark" type="button" id="borderboton" data-bs-toggle="dropdown"><%=nombre_user%></button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="editarperfil.jsp">Editar Perfil</a></li>
                                                    <li><a class="dropdown-item" onclick="cerrarSesion()">Cerrar sesión</a></li>
                                                      <script>
                                                        function cerrarSesion() {
                                                          var xhr = new XMLHttpRequest();
                                                          xhr.open("GET", "cerrarSesion.jsp?signUp=crearCuenta", true);
                                                          xhr.onreadystatechange = function () {
                                                            if (xhr.readyState === 4 && xhr.status === 200) {
                                                              window.location.href = "index.jsp";
                                                            }
                                                          };
                                                          xhr.send();
                                                        }
                                                      </script>           
                                                </ul> 
                                        <%
                                            }

                                        
                                        else {
                                        %>
                                    <button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="borderboton">Inicio de sesión</button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="signIn.jsp">Iniciar Sesión</a></li>
                                        <li><a class="dropdown-item" href="registro.jsp?accion=Nuevo">Crear cuenta</a></li>
                                    </ul>   
                                        <%
                                    }

                                    %>                                    
                                </div>

                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <!-- ============================ -->
        <!-- ===============Inicio===============-->
        <!--===========FotoInicio=========-->
        <div class="container-fluid" id ="main">
            <h1 class = "textomain">TurisMaps <br> ¡Conoce la Ciudad de México!</h1>
            <div class="botonesmain">
                <a type="button" class="btn btn-light " id="botonesmainID" href="#mapa">Mapa</a>
                <a type="button" class="btn btn-light " id="botonesmainID" href="#Featured">Visitas recomendadas</a>
            </div>
        </div>
        <!--===========FINFotoInicio=========-->

        <!--==============CardAboutUsTurism&IDK -=========-->
        <div class="container-fluid" id ="Cards"> 
            <div class="card-group">
                <div class="card">
                    <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
                        public
                    </span>
                    <div class="card-body">
                        <h5 class="card-title">Sobre nosotros</h5>
                        <p class="card-text">DevSolutions es una empresa creada con el objetivo de realizar soluciones simples y eficientes para resolver 
                            distintas problemáticas, conformada por 4 estudiantes del Politécnico, los cuales se encuentran en un aprendizaje continuo para que cada día mejore 
                            la calidad de nuestro trabajo, siempre manteniedno presentes los valores de la empresa en cada uno de los integrantes</p>
                    </div>
                </div>


                <div class="card">
                    <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
                        travel_explore
                    </span>
                    <div class="card-body">
                        <h5 class="card-title">Explora la CDMX</h5>
                        <p class="card-text">La Ciudad de México es una de las principales atracciones de turismo en México, debido 
                        a que se concentra en gran cantidad lo que representa al país, teniendo desde restaurantes con platillos nacionales
                        hasta un patrimonio de la humanidad. Es por esto que es aqui te mostramos lugares imperdibles durante tu estancia en 
                        la capital.</div>
                </div>


                <div class="card">
                    <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
                        volunteer_activism
                    </span>
                    <div class="card-body">
                        <h5 class="card-title">¡Califícanos!</h5>
                        <p class="card-text">¡Si la aplicación fue de tu agrado no olvides dejar un comentario y disfruta de tu estadia conociendo  
                            la Ciudad de México!</div>
                </div>


            </div>

        </div>
        <!--==============FINCardAboutUsTurism&IDK -=========-->    

        <!--============== Visitas recomendadas ==================-->
        <div class="container-fluid" id="Featured">
            <h1 class="TitleFeat">Visitas recomendadas</h1>
            <hr class="barra">

            <section class="Visitas">
                <div class="row row-cols-1 row-cols-md-2 g-4" >
                    <div class="col">
                        <div class="card">
                            <img src="img/BellasArtes.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Bellas Artes</h5>
                                <p class="card-text">El icónico Palacio de Bellas Artes de la CDMX combina el esplendor arquitectónico del Art Nouveau y el Art Decó. Su hermosa cúpula de cristal y su interior grandioso albergan una exposición de arte excepcional. Además, es un escenario destacado para espectáculos culturales, teatro, danza y música de renombre mundial, convirtiéndose en un símbolo de la vibrante escena artística de la Ciudad de México.</div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/Angel.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Angel de la independencia</h5>
                                <p class="card-text">El majestuoso Ángel de la Independencia en la CDMX es un símbolo imponente de la libertad y la independencia de México. Esta estatua dorada de Victoria alada se encuentra en el Paseo de la Reforma y es un hito emblemático. Rodeado de amplias avenidas y hermosos jardines, el Ángel de la Independencia representa el espíritu y el orgullo de la nación mexicana.</div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/Castillo-Chapultepec-fb-1.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Castillo de Chapultepec</h5>
                                <p class="card-text">El imponente Castillo de Chapultepec en la CDMX es una joya histórica ubicada en el Bosque de Chapultepec. Esta antigua fortaleza real y residencia presidencial ofrece una arquitectura espectacular y vistas panorámicas de la ciudad. Rodeado de hermosos jardines, el castillo alberga el Museo Nacional de Historia, donde los visitantes pueden adentrarse en la rica historia de México. Con su encanto y esplendor, el Castillo de Chapultepec es un destino imperdible para los amantes de la historia y la cultura.</div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/revo.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Monumento de la Revolución Mexicana</h5>
                                <p class="card-text">El Monumento a la Revolución en la CDMX es un impresionante ícono conmemorativo que rinde homenaje a la Revolución Mexicana. Esta estructura de granito y mármol se destaca en el horizonte de la ciudad. En su interior, alberga un museo que narra los acontecimientos históricos que llevaron a la revolución. Además, ofrece una vista panorámica desde su mirador en la cima. El Monumento a la Revolución es un lugar emblemático que evoca el espíritu revolucionario y es un punto de referencia imperdible para los visitantes en busca de historia y cultura en la capital mexicana.</div>
                        </div>
                    </div>
                </div>
            </section>
            <br><br><br><br>
            <h1 class="TitleFeat">Mapa</h1>
            <hr class="barra">
        </div>



        <!--========== FIN Visitas recomendadas ==================-->  


        <div id="mapa" class="framesito"><iframe src="secure/comentarios/mapa.jsp" title="mapa"></iframe></div>


    </body>
</html>