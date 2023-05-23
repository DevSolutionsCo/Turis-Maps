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

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
                String nombre_user = null;
                String comentario = null;
                                String id_lugar_rec = request.getParameter("id_lugar");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/TurisMaps";
                String dbUsername = "root";
                String dbPassword = "n0m3l0";

                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                int id_lugar = Integer.parseInt(id_lugar_rec);
                String query = "SELECT TURISTA.NOMBRE_USER, COMENTARIOS.COMENTARIO FROM COMENTARIOS INNER JOIN TURISTA ON TURISTA.ID_TURISTA=COMENTARIOS.ID_TURISTA WHERE ID_LUGAR = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, id_lugar);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    nombre_user = rs.getString("nombre_user");
                    comentario = rs.getString("comentario");
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


        <div id="comentarios" class="contenedor-2">
            <div class="contenido-comentario">
                <div class="nombreuser"><%=id_lugar_rec%></div> 
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
    <script src="../javascript/popup.js.js" ></script>
</html>
