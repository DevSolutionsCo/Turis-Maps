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
                            <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
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
                                            } else if ("sesionCerrada".equals(signUp)) {
                                                valor = 0;
                                            }
                                        } else {
                                            valor = 0;
                                        }

                                        String nombre_user = (String) session.getAttribute("nombre_user");
                                        String botonPresionado = request.getParameter("botonPresionado");
                                        if (botonPresionado != null && botonPresionado.equals("Iniciar Sesion")) {

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
                                    } else if (nombre_user != null && valor == 1) {
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
                                    } else {
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
                        <p class="card-text" style="text-align: justify"> DevSolutions es una empresa creada con el objetivo de realizar soluciones simples y eficientes para resolver 
                            distintas problemáticas, conformada por 4 estudiantes del Politécnico, los cuales se encuentran en un aprendizaje continuo para que cada día mejore 
                            la calidad de nuestro trabajo, siempre manteniedno presentes los valores de la empresa en cada uno de los integrantes</p>
                            
                    </div>
                </div>


                <div class="card">
                    <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
                        travel_explore
                    </span>
                    <div class="card-body">
                        <h5 class="card-title" >Explora la CDMX</h5>
                        <p class="card-text" style="text-align: justify">La Ciudad de México es una de las principales atracciones de turismo en México, debido 
                        a que se concentra en gran cantidad lo que representa al país, teniendo desde restaurantes con platillos nacionales
                        hasta un patrimonio de la humanidad. Es por esto que es aqui te mostramos lugares imperdibles durante tu estancia en 
                        la capital.</p>
                    </div>
                </div>


                <div class="card">
                    <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
                        volunteer_activism
                    </span>
                    <div class="card-body">
                        <h5 class="card-title" >¡Califícanos!</h5>
                        <p class="card-text" style="font-size: 18px">  ¡Si la aplicación fue de tu agrado no olvides dejar un comentario y disfruta de tu estadia conociendo  
                            la Ciudad de México!</p>
                    </div>
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
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut exercitationem sunt porro architecto dolorum nesciunt veritatis nostrum consequuntur eos sit reiciendis nisi rerum delectus dolore nihil deleniti, cupiditate impedit alias!</p>
                            </div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/Angel.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Angel de la independencia</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione exercitationem ipsam mollitia, soluta deserunt quo omnis voluptatem. Molestias amet tempora blanditiis, sed vitae facere! Iusto, minus! Architecto iste illo doloremque.</p>
                            </div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/Castillo-Chapultepec-fb-1.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Castillo de Chapultepec</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat delectus eaque quidem deleniti, quisquam at asperiores voluptas repellendus dignissimos eos quia debitis enim eveniet quo dolores molestiae, eligendi voluptate aut.</p>
                            </div>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card">
                            <img src="img/revo.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Monumento de la Revolución Mexicana</h5>
                                <p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odit obcaecati deserunt et itaque aliquid nesciunt minima officia. Autem aliquid in eos quia maxime nobis pariatur tempora, fuga nihil! Illum, adipisci.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <br><br><br><br>
            <h1 class="TitleFeat">Mapa</h1>
            <hr class="barra">
        </div>



        <!--========== FIN Visitas recomendadas ==================-->  

        <!--================ A LA VERGA LLAMEN A DIOS =================-->

        <div id="mapa" class="framesito"><iframe src="secure/comentarios/mapa.jsp" title="mapa"></iframe></div>


    </body>
</html>