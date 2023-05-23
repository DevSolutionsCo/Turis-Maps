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
            String correo = rs.getString("correo");
            String nombre = rs.getString("nombre");
            String apellido_pat = rs.getString("apellido_pat");
            String apellido_mat = rs.getString("apellido_mat");
            String  lugar_proc = rs.getString("lugar_proc");
            String  genero = rs.getString("genero");
            String  contrasena = rs.getString("contrasena");
            String  id_turista = rs.getString("id_turista");            
            
            session.setAttribute("nombre_user", nombre_user);
            session.setAttribute("correo", correo);
            session.setAttribute("nombre", nombre);
            session.setAttribute("apellido_pat", apellido_pat);
            session.setAttribute("apellido_mat", apellido_mat);
            session.setAttribute("lugar_proc", lugar_proc);
            session.setAttribute("genero", genero);
            session.setAttribute("contrasena", contrasena);
            session.setAttribute("id_turista", id_turista);
            session.setAttribute("signUp", "crearCuenta"); 
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("noSesion", "noSesion");
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
