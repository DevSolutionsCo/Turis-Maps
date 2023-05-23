<%-- 
    Document   : Comentame
    Created on : May 22, 2023, 6:48:11 PM
    Author     : sebas
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
   int calificacion = Integer.parseInt("0");
   LocalDate fecha = LocalDate.now();
   String id_turissta = ("1");
   String id_lugar = ("1");
   
   Connection conn = null;
   PreparedStatement pstmt = null;

    ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/TurisMaps";
      String username = "root";
      String password = "n0m3l0";
      conn = DriverManager.getConnection(url, username, password);

      
      // Inserta los datos en la base de datos
      String sql = "INSERT INTO COMENTARIOS (COMENTARIO, CALIFICACION, FECHA, ID_TURISTA, ID_LUGAR) VALUES (?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, comentario);
      pstmt.setInt(2, calificacion);
      pstmt.setDate(3, java.sql.Date.valueOf(fecha));
      pstmt.setString(4, id_turissta);
      pstmt.setString(5, id_lugar);
      pstmt.executeUpdate();
      
      
      rs = pstmt.executeQuery();
      
       if (rs.next()) {
        String comment = rs.getString(comentario);
        session.setAttribute("comentario", comment);
    
        }
        
              response.sendRedirect("mapa.jsp");

   } catch (Exception e) {
      e.printStackTrace();
      System.out.println("NO HACE NADAAAA");
   } finally {

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
