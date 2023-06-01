<%-- 
    Document   : registro
    Created on : 19 may 2023, 12:51:17
    Author     : jaav
--%>

<%@ page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="org.turis.helper.TuristaHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.turis.dao.Turista"%>
<%@page import="org.turis.helper.Helpers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
       <%
            session.removeAttribute("nombreUsado");
            session.removeAttribute("correoUsado");

            String accion = request.getParameter("accion");
            Helpers helpers = null;
            Turista turista = null;
            String aux = null;
            boolean flag = false;
            String readonly =    null;
            
            if( "Nuevo".equals( request.getParameter("accion") ) || "Editar".equals( request.getParameter("accion") ) )
            {
                if( "Nuevo".equals( accion ) )
                {
                    turista = new Turista();
                 
                    turista.setNombre_user("");
                    turista.setCorreo("");
                    turista.setNombre("");
                    turista.setApellido_pat("");
                    turista.setApellido_mat("");
                    turista.setFecha_nac( Calendar.getInstance().getTime());
                    turista.setLugar_proc("");
                    turista.setGenero("");
                    turista.setContraseña("");
                    aux = "Guardar";
                    readonly = "";
                }
                if( "Editar".equals( accion ) )
                {
                    helpers = new TuristaHelper( ).addRequest( request );
                    turista = (Turista)helpers.getTByKey( );
                    aux = "Actualizar";
                    readonly = "readonly='true'";
                }
                
            
        %>
        <jsp:include page="signUp.jsp" >
                    <jsp:param name="id_turista" value="<%=turista.getId_turista()%>" />
                    <jsp:param name="nombre_user" value="<%=turista.getNombre_user()%>" />
                    <jsp:param name="correo" value="<%=turista.getCorreo()%>" />
                    <jsp:param name="nombre" value="<%=turista.getNombre()%>" />
                    <jsp:param name="apellido_pat" value="<%=turista.getApellido_pat()%>" />
                    <jsp:param name="apellido_mat" value="<%=turista.getApellido_mat()%>" />
                    <jsp:param name="fecha_nac" value="<%=turista.getFecha_nac()%>" />
                    <jsp:param name="lugar_proc" value="<%=turista.getLugar_proc()%>" />
                    <jsp:param name="genero" value="<%=turista.getGenero()%>" />
                    <jsp:param name="contraseña" value="<%=turista.getContraseña()%>" />
                    <jsp:param name="accion" value="<%=aux%>" />
                    <jsp:param name="readonly" value="<%=readonly%>" />
                </jsp:include>
        <%
            }
 
                Connection conn = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        String dbURL = "jdbc:mysql://localhost:3306/turismaps";
                        String dbUsername = "root";
                        String dbPassword = "1234";
                         conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                String correo_pro = request.getParameter("correo");
                String nombre_user_pro = request.getParameter("nombre_user");

                String consulta1 = "select count(*) from turista where correo = ?";
                String consulta2 = "select count(*) from turista where nombre_user= ?";


                PreparedStatement pstmt1 = conn.prepareStatement(consulta1);
                pstmt1.setString(1, correo_pro);
                PreparedStatement pstmt2 = conn.prepareStatement(consulta2);
                pstmt2.setString(1, nombre_user_pro);

                ResultSet rs1 = pstmt1.executeQuery();
                ResultSet rs2 = pstmt2.executeQuery();

                rs1.next();
                int count1 = rs1.getInt(1);
                rs2.next();
                int count2 = rs2.getInt(1);

                if (count1 > 0) {
                    session.setAttribute("correoUsado", "correoUsado");
                    response.sendRedirect("signUp.jsp");
                }else
                    if(count2>0){
                        session.setAttribute("nombreUsado", "nombreUsado");
                        response.sendRedirect("signUp.jsp");
                    }else


                   
              
            if( "Guardar".equals( accion ) || "Borrar".equals( accion ) || "Actualizar".equals( accion ) )
            {


                helpers = new TuristaHelper( ).addRequest( request );
                if( "Guardar".equals( accion ) )
                {
                    
                  
                 
                    
                    String nombre_user = request.getParameter("nombre_user");
                    String correo = request.getParameter("correo");
                    String nombre = request.getParameter("nombre");
                    String apellido_pat = request.getParameter("apellido_pat");
                    String apellido_mat = request.getParameter("apellido_mat");
                    String lugar_proc = request.getParameter("lugar_proc");
                    String genero = request.getParameter("genero");
                    String contrasena = request.getParameter("contrasena");
                    String fecha_nac = request.getParameter("fecha_nac");
                    java.sql.Date fecha = java.sql.Date.valueOf(fecha_nac);



                    String url = "jdbc:mysql://localhost:3306/turismaps";
                    String usuario = "root";
                    String contraseña = "1234";

                    PreparedStatement pstmt = null;

                    try {
                      Class.forName("com.mysql.jdbc.Driver");
                      conn = DriverManager.getConnection(url, usuario, contraseña);

                      String sql = "insert into turista( correo, nombre, apellido_pat, apellido_mat, fecha_nac, lugar_proc, genero, contrasena, nombre_user) values(?,?,?,?,?,?,?,?,?)";
                      pstmt = conn.prepareStatement(sql);

                      pstmt.setString(1, correo);
                      pstmt.setString(2, nombre);
                      pstmt.setString(3, apellido_pat);
                      pstmt.setString(4, apellido_mat);
                      pstmt.setDate(5, fecha);
                      pstmt.setString(6, lugar_proc);
                      pstmt.setString(7, genero);
                      pstmt.setString(8, contrasena);
                      pstmt.setString(9, nombre_user);

                      pstmt.executeUpdate();

                    session.setAttribute("signUp", "crearCuenta"); 
                    session.setAttribute("nombre_user", nombre_user);
                    session.setAttribute("correo", correo);
                    session.setAttribute("nombre", nombre);
                    session.setAttribute("apellido_pat", apellido_pat);
                    session.setAttribute("apellido_mat", apellido_mat);
                    session.setAttribute("lugar_proc", lugar_proc);
                    session.setAttribute("genero", genero);
                    session.setAttribute("contrasena", contrasena);
                    session.setAttribute("valido", "creacionValida");
                    response.sendRedirect("index.jsp");
                    } catch (Exception e) {
                      e.printStackTrace();
                            session.setAttribute("invalido", "creacionInvalida");
                            response.sendRedirect("registro.jsp?accion=Nuevo");
                    } finally {
                      if (pstmt != null) {
                        pstmt.close();
                      }
                      if (conn != null) {
                        conn.close();
                      }
                    }





                    }
                    

                }
               
       
            
        %>
        
    