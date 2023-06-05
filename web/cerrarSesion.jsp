<%-- 
    Document   : cerrarSesion
    Created on : 21 may 2023, 14:05:32
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
                    <%
              session.setAttribute("signUp", "sesionCerrada");
              session.removeAttribute("admin");
              session.removeAttribute("nombre");
              session.removeAttribute("nombre_user");
              session.removeAttribute("apellido_pat");
              session.removeAttribute("apellido_mat");
              session.removeAttribute("lugar_proc");
              session.removeAttribute("genero");
              session.removeAttribute("contrasena");
              session.removeAttribute("correo");
              session.removeAttribute("id_turista");    
              session.removeAttribute("idTuristaa");
            %>

    </body>
</html>
