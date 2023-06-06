<%-- 
    Document   : admin
    Created on : 5 jun 2023, 17:39:40
    Author     : USUARIO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

            <%
                Connection conn = null;

                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/turismaps";
                String dbUsername = "root";
                String dbPassword = "n0m3l0";
                 conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);


                String consulta1 = "select * from turista";
                String consulta2 = "select * from comentarios";


                PreparedStatement pstmt1 = conn.prepareStatement(consulta1);
                PreparedStatement pstmt2 = conn.prepareStatement(consulta2);

                ResultSet rs1 = pstmt1.executeQuery();
                ResultSet rs2 = pstmt2.executeQuery();
            
            %>

            <!DOCTYPE html>
            <html>
            <head>
            <meta charset="UTF-8">
            <title>Administación</title>
            </head>
            <body>
                <h1>Administación</h1>

                                 <a href="index.jsp" >Regresar</a>

                <h2>Comentarios</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Comentario</th>
                        <th>Turista</th>
                        <th>Lugar</th>
                        <th>Acciones</th>
                    </tr>
                    <% while (rs2.next()) { %>
                    <tr>
                        <td><%= rs2.getInt("id_comentario") %></td>
                        <td><%= rs2.getString("comentario") %></td>
                        <td><%= rs2.getInt("id_turista") %></td>
                        <td><%= rs2.getInt("id_lugar") %></td>
                        <td>
                            <a href="borrar.jsp?idComentarioBorrar=<%= rs2.getInt("id_comentario") %>">Borrar</a>
                        </td>
                    </tr>
                    <% } %>
                </table>

                <h2>Turistas</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                    <% while (rs1.next()) { %>
                    <tr>
                        <td><%= rs1.getInt("id_turista") %></td>
                        <td><%= rs1.getString("nombre_user") %></td>
                        <td><%= rs1.getString("correo") %></td>
                        <td>
                            <a href="borrar.jsp?idTuristaBorrar=<%= rs1.getInt("id_turista") %>">Borrar</a>
                        </td>
                    </tr>
                    <% } %>
                </table>

                <%

                   try {
                       if (rs1 != null) rs1.close();
                       if (rs2 != null) rs2.close();

                       if (pstmt1 != null) pstmt1.close();
                       if (pstmt2 != null) pstmt2.close();
                       if (conn != null) conn.close();
                   } catch (Exception e) {
                       e.printStackTrace();
                   }
               
                %>
</body>
</html>

