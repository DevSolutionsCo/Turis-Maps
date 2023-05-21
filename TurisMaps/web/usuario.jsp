<%-- 
    Document   : usuario
    Created on : 21 may 2023, 11:25:24
    Author     : ruizl
--%>

<%@page import="org.turis.helper.TuristaHelper"%>
<%@page import="org.turis.dao.Turista"%>
<%@page import="org.turis.helper.Helpers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
         
        <%
            String accion = request.getParameter("accion");
            Helpers helpers = null;
            Turista turista = null;
            String aux = null;
            boolean flag = false;
            String readonly = null;
            
            if( "Editar".equals( accion ) )
            {
                String correo = request.getParameter("correo");
                helpers = new TuristaHelper( ).addRequest( request );
                turista = (Turista)helpers.getTByKey( );
                aux = "Actualizar";
                readonly = "readonly='true'";
       %>
       <jsp:include page="editarperfil.jsp" >
                    <jsp:param name="nombre_user" value="<%=turista.getNombre_user()%>" />
                    <jsp:param name="correo" value="<%=turista.getCorreo()%>" />
                    <jsp:param name="nombre" value="<%=turista.getNombre()%>" />
                    <jsp:param name="apellido_pat" value="<%=turista.getApellido_pat()%>" />
                    <jsp:param name="apellido_mat" value="<%=turista.getApellido_mat()%>" />
                    <jsp:param name="lugar_proc" value="<%=turista.getLugar_proc()%>" />
                    <jsp:param name="genero" value="<%=turista.getGenero()%>" />
                    <jsp:param name="contraseña" value="<%=turista.getContraseña()%>" />
                    <jsp:param name="accion" value="<%=aux%>" />
                    <jsp:param name="readonly" value="<%=readonly%>" />
                </jsp:include>
            <%  
            }
            if( "Actualizar".equals( accion ) )
            {
                helpers = new TuristaHelper( ).addRequest( request );
                flag = helpers.updateT( );   
                
                response.sendRedirect("index.jsp?nombre_user="+request.getParameter("nombre_user"));
            }
            if( accion == null)
            {
        %>
            <jsp:forward page="index.jsp" />
        <%
            }
        %>
    

