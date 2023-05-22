<%-- 
    Document   : actualizar
    Created on : May 21, 2023, 7:50:11 PM
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@ page import="java.sql.*" %>
        <%
            String nuevoNombre_user = request.getParameter("nombre_user");
            String nuevoCorreo = request.getParameter("correo");
            String nuevoNombre = request.getParameter("nombre");
            String nuevoLugar_proc = request.getParameter("lugar_proc");
            String nuevoGenero = request.getParameter("genero");
            String nuevoApellido_pat = request.getParameter("apellido_pat");
            String nuevoApellido_mat = request.getParameter("apellido_mat");
            String nuevoContrasena = request.getParameter("contraseña");

            String url = "jdbc:mysql://localhost:3306/Turismaps";
            String usuario = "root";
            String contraseña = "n0m3l0";
            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                connection = DriverManager.getConnection(url, usuario, contraseña);

                String query1 = "SELECT id_turista FROM turista WHERE nombre_user = ?";
                PreparedStatement statement = connection.prepareStatement(query1);
                statement.setString(1, nuevoNombre_user);

                ResultSet resultSet = statement.executeQuery();
                int IDTURISTA = resultSet.getInt("id_turista");

                if (resultSet.next()) {
                    int idUser = resultSet.getInt("id_turista");
                    System.out.println("El valor de id_turista es: " + idUser);
                } else {
                    System.out.println("No se encontró ningún registro con el campo conocido especificado.");
                }

                // Construir la consulta SQL para actualizar los datos
                String query = "UPDATE turista SET correo = ?, nombre = ?, apellido_pat = ?, apellido_mat = ?, fecha_nac = ?, lugar_proc = ?, genero = ?, contrasena = ?, nombre_user = ? WHERE id_turista = ?";
                PreparedStatement statement2 = connection.prepareStatement(query);
                statement2.setInt(1, IDTURISTA);
                statement2.setString(2, nuevoCorreo);
                statement2.setString(3, nuevoNombre);
                statement2.setString(4, nuevoApellido_pat);
                statement2.setString(5, nuevoApellido_mat);
                statement2.setString(7, nuevoLugar_proc);
                statement2.setString(8, nuevoGenero);
                statement2.setString(9, nuevoContrasena);

                statement.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {

                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </body>
</html>
