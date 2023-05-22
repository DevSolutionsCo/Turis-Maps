<%-- 
    Document   : jalasOque
    Created on : 21 may 2023, 0:16:27
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
    String correo_signIN = request.getParameter("correo_signIN");
    String passw = request.getParameter("passw");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/TurisMaps";
        String dbUsername = "root";
        String dbPassword = "n0m3l0";
        
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        
        String query = "SELECT * FROM TURISTA WHERE CORREO = ? AND CONTRASENA = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, correo_signIN);
        stmt.setString(2, passw);
        
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            String nombre_user = rs.getString("nombre_user");
            
            session.setAttribute("nombre_user", nombre_user);
            session.setAttribute("signUp", "crearCuenta"); 
            response.sendRedirect("index.jsp");
        } else {
            
            %>
            <script>
                alert("Correo no registrado o contraseña incorrecta")
            </script>
            <%
        
            response.sendRedirect("signIn.jsp");
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
</html>
