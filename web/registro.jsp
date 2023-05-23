<%-- 
    Document   : registro
    Created on : 19 may 2023, 12:51:17
    Author     : alumno
--%>

<%@page import="java.util.Calendar"%>
<%@page import="org.turis.helper.TuristaHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.turis.dao.Turista"%>
<%@page import="org.turis.helper.Helpers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
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
 

            if( "Guardar".equals( accion ) || "Borrar".equals( accion ) || "Actualizar".equals( accion ) )
            {


                helpers = new TuristaHelper( ).addRequest( request );
                if( "Guardar".equals( accion ) )
                {
                    flag = helpers.addT( );
                  
                 
                    if(flag != false){
                    String nombre_user = request.getParameter("nombre_user");
                    String correo = request.getParameter("correo");
                    String nombre = request.getParameter("nombre");
                    String apellido_pat = request.getParameter("apellido_pat");
                    String apellido_mat = request.getParameter("apellido_mat");
                    String lugar_proc = request.getParameter("lugar_proc");
                    String genero = request.getParameter("genero");
                    String contrasena = request.getParameter("contrasena");


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
                    }else
                        {
                        
                            session.setAttribute("invalido", "creacionInvalida");
                            response.sendRedirect("registro.jsp?accion=Nuevo");
                        } 
                    

                }
                if( "Borrar".equals( accion ) )
                {
                    flag = helpers.deleteT( );
                }
                if( "Actualizar".equals( accion ) )
                {
                    flag = helpers.updateT( );
                }
                if( flag )
                {
        %>
        
        <%
                }                
            }
            if( accion == null || "list".equals(accion ))
            {
        %>
        <jsp:forward page="index.jsp" />
        <%
            }
        %>
        
    </body>
</html>
