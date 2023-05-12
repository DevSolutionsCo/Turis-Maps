<%-- 
    Document   : index
    Created on : May 7, 2023, 3:04:00 PM
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"   crossorigin="anonymous">
    
    <link rel="stylesheet" href="./css/Style_Index.css">

    <link rel="stylesheet" href="mapaStyles.css">

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
            <img src="./css/Imagenes/logo_Dev_Mini.png" alt="" width="54" height="54">
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
            <ul class="navbar-nav d-flex ms-auto" id="navlista">
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
                <a class="btn btn-dark btn-dark-outline-success" aria-current="page" href="index1.html"> <span class="navegacionspan"> Iniciar Sesión </span> </a>
              </li>
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
            <h5 class="card-title">About Us</h5>
            <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt, eius adipisci officia quos labore unde, delectus corporis officiis nostrum quas est ipsam eligendi ad accusantium odit, tempore esse. Incidunt, corporis?
            Similique quia odit doloremque dolores nobis, in soluta excepturi aliquam debitis impedit labore necessitatibus expedita alias molestiae dolor accusamus minima animi fugiat, fugit, perferendis quaerat aut! Error voluptatum aliquid dolorum.</p>
          </div>
        </div>


        <div class="card">
          <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
            travel_explore
            </span>
          <div class="card-body">
            <h5 class="card-title">Explore CDMX</h5>
            <p class="card-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Assumenda minus non, aperiam ipsa natus quisquam cum autem quas et nobis molestiae asperiores, eaque culpa itaque nostrum officia veniam sunt fugit?
            Odio quam explicabo sequi, ipsam delectus ad, esse voluptates qui soluta dicta repudiandae accusantium ab quibusdam veniam eos consequatur? Totam nisi veritatis nesciunt at excepturi soluta distinctio voluptatem recusandae suscipit!</p>
          </div>
        </div>


        <div class="card">
          <span class="material-symbols-outlined" style="font-size: 64px;" id="iconoCard">
            volunteer_activism
            </span>
          <div class="card-body">
            <h5 class="card-title">¡Califícanos!</h5>
            <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos corrupti mollitia sapiente tempora recusandae tempore, iusto quaerat, perspiciatis, magnam numquam libero ad optio consectetur maxime ea at labore deserunt eveniet?
            Dolor, magnam. Deleniti, ullaem rerum. Earum fugit quod illum eligendi. Nisi optio eos consequuntur facilis, alias dolore adipisci iure et reiciendis tempore nesciunt excepturi laborum assumenda quo quaerat deserunt dolorum.</p>
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
             <img src="./Imagenes/BellasArtes.jpg" class="card-img-top" alt="...">
             <div class="card-body">
               <h5 class="card-title">Bellas Artes</h5>
               <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut exercitationem sunt porro architecto dolorum nesciunt veritatis nostrum consequuntur eos sit reiciendis nisi rerum delectus dolore nihil deleniti, cupiditate impedit alias!</p>
             </div>
           </div>
         </div>


         <div class="col">
           <div class="card">
             <img src="./Imagenes/Angel.jpg" class="card-img-top" alt="...">
             <div class="card-body">
               <h5 class="card-title">Angel de la independencia</h5>
               <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione exercitationem ipsam mollitia, soluta deserunt quo omnis voluptatem. Molestias amet tempora blanditiis, sed vitae facere! Iusto, minus! Architecto iste illo doloremque.</p>
             </div>
           </div>
         </div>


         <div class="col">
           <div class="card">
             <img src="./Imagenes/Castillo-Chapultepec-fb-1.jpg" class="card-img-top" alt="...">
             <div class="card-body">
               <h5 class="card-title">Castillo de Chapultepec</h5>
               <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat delectus eaque quidem deleniti, quisquam at asperiores voluptas repellendus dignissimos eos quia debitis enim eveniet quo dolores molestiae, eligendi voluptate aut.</p>
             </div>
           </div>
         </div>


         <div class="col">
           <div class="card">
             <img src="./Imagenes/revo.jpg" class="card-img-top" alt="...">
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

   <div id="mapa" class="framesito"><iframe src="mapa.html" title="mapa"></iframe></div>
   
   
</body>
</html>
</html>
