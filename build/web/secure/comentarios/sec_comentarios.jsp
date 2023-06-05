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

            String id_lugar_rec = request.getParameter("id_lugar");

        %>


        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String nombre_user = null;
            String comentario = null;
            int id_lugar = Integer.parseInt(id_lugar_rec);

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/turismaps";
                String dbUsername = "root";
                String dbPassword = "n0m3l0";

                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                String query = "select turista.nombre_user, comentarios.comentario from comentarios inner join turista on turista.id_turista=comentarios.id_turista where id_lugar = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, id_lugar);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    nombre_user = rs.getString("nombre_user");
                    comentario = rs.getString("comentario");

        %>
        <div id="comentarios" class="contenedor-2">
            <div class="contenido-comentario">
                <div class="nombreuser"><%=nombre_user%></div> 
                <div class="texto-comentario"><%=comentario%></div>
            </div>
        </div>
        <%
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        %>



    </body>
    <script src="../javascript/comentarios.js" ></script>
</html>
