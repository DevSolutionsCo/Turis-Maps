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
    <link rel="stylesheet" href="../../css/signStyles.css">
    <title>Sign In</title>
</head>
<body>
    <div  class="signIn-box">
        <h2>Inicio de Sesion</h2>
        <form>
            <div class="user-box">
                <input class="inputs" type="text" name="correo" required="">
                <label class="labels">Correo</label>
            </div>
            <div class="user-box">
                <input class="inputs" type="password" name="passw" required="">
                <label class="labels">Contraseña</label>
            </div>
            <a href="../../">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Iniciar Sesion
            </a>
        </form>
    </div>
</body>
</html>