<%-- 
    Document   : signIn
    Created on : 14 may 2023, 1:53:38
    Author     : USUARIO
--%>

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

    <title>Sign In</title>
</head>
<body>
    <div  class="signIn-box">
        <h2>Inicio de Sesion</h2>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>

        <%
            String siOnel = (String) session.getAttribute("noSesion");
            
            if (siOnel != null) {
                    if ("noSesion".equals(siOnel)) {
                            %>
                            <script>
                                    Swal.fire({
                                    icon: 'error',
                                    title: 'Inicio de sesion invalido',
                                    text: 'Contraseña o correo incorrectos'
                                  });
                            </script>
                                      
                            <%
                        }
            }
        %>

        <form action="jalasOque.jsp" method="post">
            <div class="user-box">
                <input class="inputs" type="text" name="correo_signIN" required="">
                <label class="labels">Correo</label>
            </div>
            <div class="user-box">
                <input class="inputs" type="password" name="passw" required="">
                <label class="labels">Contraseña</label>
            </div>
            <input type="hidden" name="nombre_user" value="Inicar Sesion">
            <input type="submit" name="botonPresionado" value="Iniciar Sesion" id="copiaAref">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
        </form>
    </div>

</body>
</html>