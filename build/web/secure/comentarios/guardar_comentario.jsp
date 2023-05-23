<%-- 
    Document   : guardar_comentario
    Created on : May 22, 2023, 11:48:56 PM
    Author     : sebas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String comentario = request.getParameter("comentario");
            int calificacion = Integer.parseInt(request.getParameter("calificacion"));
            LocalDate fecha = LocalDate.now();
            int idTuristaObj = (int) session.getAttribute("idTuristaa");
            int idLugar = 1;
            ResultSet rs = null;

            // Establece la conexión a la base de datos
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/TurisMaps";
                String username = "root";
                String password = "n0m3l0";
                conn = DriverManager.getConnection(url, username, password);

                // Inserta el comentario en la base de datos
                String sql = "INSERT INTO comentarios (comentario, calificacion, fecha, id_turista, id_lugar) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, comentario);
                pstmt.setInt(2, calificacion);
                pstmt.setDate(3, java.sql.Date.valueOf(fecha));
                pstmt.setInt(4, idTuristaObj);
                pstmt.setInt(5, idLugar);
                pstmt.executeUpdate();

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String comentario_b = rs.getString("comentario");
                    session.setAttribute("comentario_b", comentario_b);

                }

                // Redirige a la página de comentarios para mostrar el nuevo comentario
                response.sendRedirect("mapa.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                // Redirige a una página de error o muestra un mensaje de error
                response.sendRedirect("mapa.jsp");
            } finally {
                // Cierra los recursos (PreparedStatement, Connection)
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </body>
</html>
