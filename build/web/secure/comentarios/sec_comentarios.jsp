<%-- 
    Document   : sec_comentarios
    Created on : 21 may 2023, 2:05:17
    Author     : CrX26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/comentStyle.css" rel="stylesheet" type="text/css"/>
        <title>Comentarios</title>
    </head>
    <body>
                            <%

            String comentario = (String) session.getAttribute("comentario_b");
            String nombre_user = (String) session.getAttribute("nombre_user_u");
        %>
        <div id="comentarios" class="contenedor-2">
            <div class="contenido-comentario">
                <div class="nombreuser"><%=nombre_user%></div> 
                <div class="texto-comentario"><%=comentario%></div>
            </div>
            <div class="contenido-comentario">
                <div class="nombreuser">Panchito 321</div> 
                <div class="texto-comentario"> Buen lugar!</div>
            </div>
            <div class="contenido-comentario">
                <div class="nombreuser">Panchito 321</div> 
                <div class="texto-comentario"> Buen lugar!</div>
            </div>
            <div class="contenido-comentario">
                <div class="nombreuser">Panchito 321</div> 
                <div class="texto-comentario"> Buen lugar!</div>
            </div>
            <div class="contenido-comentario">
                <div class="nombreuser">Panchito 321</div> 
                <div class="texto-comentario"> Buen lugar!</div>
            </div>
            <div class="contenido-comentario">
                <div class="nombreuser">Panchito 321</div> 
                <div class="texto-comentario"> Buen lugar!</div>
            </div>
        </div>
    </body>
    <script src="../javascript/comentarios.js" ></script>
</html>
