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
            %>

    </body>
</html>
