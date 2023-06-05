<%-- 
    Document   : borrar
    Created on : 5 jun 2023, 18:17:12
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            String borrarComentario = request.getParameter("idComentarioBorrar");
            String borrarTurista = request.getParameter("idTuristaBorrar");
        
            if (borrarComentario != null){
                int comentarioBorrar = Integer.parseInt(borrarComentario);
                
                Connection conn = null;
                Statement pstmt1 = null;
                


                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/turismaps";
                String dbUsername = "root";
                String dbPassword = "n0m3l0";
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                pstmt1 = conn.createStatement();

                String borrar1 = "delete from comentarios where id_comentario="+comentarioBorrar;

                pstmt1.executeUpdate(borrar1);
                response.sendRedirect("admin.jsp");

                
                try {
                    if (pstmt1 != null) pstmt1.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            
            if (borrarTurista != null){
                int turistaBorrar = Integer.parseInt(borrarTurista);
                
                Connection conn = null;
                Statement pstmt2 = null;
                


                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/turismaps";
                String dbUsername = "root";
                String dbPassword = "n0m3l0";
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                pstmt2 = conn.createStatement();

                String borrar2 = "delete from turista where id_turista="+turistaBorrar;

                
                pstmt2.executeUpdate(borrar2);
                
                response.sendRedirect("admin.jsp");

                
                try {
                    if (pstmt2 != null) pstmt2.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        %>
        
    </body>
</html>
