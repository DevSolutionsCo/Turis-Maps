<%-- 
    Document   : actualizame
    Created on : May 22, 2023, 12:00:52 AM
    Author     : sebas & jaav
--%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*" %>
<%-- GANARON LAS CHIVAS --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>
        <%
        String id_turista = (String) session.getAttribute("id_turista");
        
        String correo_a = (String) session.getAttribute("correo");
        String passw_a = request.getParameter("passw_a");
        String nombre_a = request.getParameter("nombre_a");
        String apellido_pat_a = request.getParameter("apellido_pat_a");
        String apellido_mat_a = request.getParameter("apellido_mat_a");
        String lugar_proc_a = request.getParameter("lugar_proc_a");
        String genero_a = request.getParameter("genero_a");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/turismaps";
        String dbUsername = "root";
        String dbPassword = "n0m3l0";
        int row=0;
        int si = 0;
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        
        String query = "update turista set contrasena=?, nombre=?, apellido_pat=?, apellido_mat=?, lugar_proc=?, genero=?  where correo=?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, passw_a);
        stmt.setString(2, nombre_a);
        stmt.setString(3, apellido_pat_a);
        stmt.setString(4, apellido_mat_a);
        stmt.setString(5, lugar_proc_a);
        stmt.setString(6, genero_a);
        stmt.setString(7, correo_a);
            row = stmt.executeUpdate();
            si = 1;
            session.setAttribute("correo", correo_a);
            session.setAttribute("nombre", nombre_a);
            session.setAttribute("apellido_pat", apellido_pat_a);
            session.setAttribute("apellido_mat", apellido_mat_a);
            session.setAttribute("lugar_proc", lugar_proc_a);
            session.setAttribute("genero", genero_a);
            session.setAttribute("contrasena", passw_a);
            session.setAttribute("id_turista", id_turista);
            session.setAttribute("signUp", "crearCuenta"); 
            response.sendRedirect("index.jsp");
            
            session.setAttribute("signUp", "crearCuenta"); 
            response.sendRedirect("index.jsp");
            
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

<%--
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWMMMMMMWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMW0dxxk0XWMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMNo;lc:cld0WMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMNocdl;;llcOWMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMWNOccxocclocxWMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMWXkdl::clc:;;ccxWMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMWKdc::;;,'',,,:c;l0NWMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMNxc::;,,;;::;;;::clcldONMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMWx:lc:;;::cll:''cxkkkxl:oXMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWMMMMWWWWWWMMMMMMMMMMKl:lol,;odxdl:;okkkkkkkd:oNMMMMMMMWNWWWWMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWMMMMMMWWWWMMMMMMMMMMMNKKNWO:lkOx:';dkkkkkdolc,cKMMMMMMMMWWMWMMMMMMWWWWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk;ldo:'':odxxo::cll,lXMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXo',;;;;;;;;;,':xkd:l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXx::ldxxdoodxxdl;;:clxXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMWNKOkxxdxxkO0KNWMMMMMMMMMMMMKl;oxxdl:,,,,:ldxxo,;OWMMMMMMMMMMMWNK0OkxxxxxkOKNWMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMWXkolccllooolllcllldk0XWMMMMMMXl',::;;;coxxoc;;;;:;'lXMMMMMMWX0kdlllclllooollcclokXWMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMWXxc:okOOOOkxxxkkOOkxolcclodxxxxo,,:cloxkkkkkkkkxolc:,,oxxxxdolccloxkOOkxxxxkOO0Oxo:cxXWMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMWOc:dO0OxlcclooollclxO00Okxdool,,:;lkkkkkkkkkkkkkkkkkkl;:,,loodxkO00OxlcclooolcclxO0Od:cOWMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMWk;ck0Oxc:dOXNXKKNXOo:lk00000Oxc;d0c';:::ccldxxdlcc:::;'cOd;cx000000kl:oOXNKKXNXOd:cxO0kc:kWMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMWO;ck0Oo;oKNKxo:;dNMMWx;lO00000x:;kN0;':oolc:;,,;:cloo:';0Nx;:xO00000o;xWMMNd;coxKNKo;oO0kc:OWMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMXl;x0Oo;dNXd:coc,xWMMWx;lO000000k::0WKl,;ldkkxddxkkdl;,lKW0::k000000Ol;xWMMWd,coc:dXNd;oO0x;lXMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMM0:cO0x;cXXo;dO0xc:dOOo:ck0000Odll:,lOko,';;;:cccc:;;;',okOl,:lldO0000kc:oOOd:ck0Od;oXXc;x0Oc:0MMMMMMMWNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWMMMMMMMO;cO0d;dW0:cO000OdlllldO00OxkOo'........,cllllccllllc,........'oOkxO00OxlllldO000Oc:0Wd;d0Oc;OMMMMMMMWNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWMMMMMMMK::k0d;oWK::k000000000000Od,,c:,:lll:',llc:;:cllc:;:clc,':lll;,:c,,dO000000000000k::KNo;d0k::KMMMMMMMWNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWMMMMMMMNd;d0k:cKNx;lO0000000000Od;;c,..;;,''cxOkkkxo:;;:oxkkkOxc'',;;..,c;;dO0000000000Ol;xNKc:k0d;dNMMMMMMMWNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMKc:x0o;dNNk::dO00OOkxdl;............;loxkkOOkkkkOOkkxol;............;ldkkOO00Od::kNNd;o0k:cKMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMWO:ckOl;d0x;..lOkc,'.............,:ccc::::clloollc::::cclc;.............',ckOl..;x0d;lOkc:OWMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMWk:ckOo;'.',':kd'....:oolllllll:;;;:cloollc::::clloolc:;;;:lollllloo:....'dk:','..,oOkc:kWMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMWk;:xOd,'ll'.co,....,d0koloxO00Okdlc:;;:coxxxxoc:;;:cldkO000xolok0d,....,oc.'lc',dOx:;kWMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMW0l'.;dOx:............;xkoclxO0000000Okdlc:;;;;:cldkO0000000Oxlcokk;............:xOd;..l0WMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMW0l'.;l;,oOkc............okkkkkklccccccccccc:;,,;:ccccccccccclkkkkkko............ckOo,;l;.'l0NMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMW0l'.;ddc...lkOo'..........lO0000d'............................'d0000Ol..........'oOkl...cdd;.'l0WMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMWXo'.;dxc......:kOd,.........lO0000d'...........''''''...........'d0000Ol.........,dOk:......cxd;.'oKWMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMNk;.'oxl.........;xOx;........lO0000d'......';:cccllllccc:;'......'d0000Ol........;xOx;.........lxo'.;kNMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMKl..cxo,...........,d0k:.......lO0000d'....,:clllllllllllllll:,....'d00000l.......:kOd,...........,oxc..lKMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMWO;.'ox:..............;x0k:.'cdc'lO0000d'...,cllllllllllllllllllc,...'d0000Ol,cdl'.:k0x;..............:xo'.;OWMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMNx,.;xd'...;:;'.........lO0k:,c;..lO0000d'...;llllllllllllllllllll;...'d00000l..;:,:k0Ol................'dx;.'xNMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMNd..ckl...:docldo;.......cO00x;.;:,lO0000d'...'cllllllllllllllllllc'...'d0000Ol,:;.;x00Oc............,:'...lkc..dNMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMXo..lkc...'dd....lx,......cO000d;ld;lkdddxd'....';cllllllllllllllc;'....'dxdddkl;dl;d000Oc..........';cdo;...ckl..oXMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMNo..lk:...,;cl'.';dd'...,;,oO000Ol;;,lkl:cxd'.......,;:cccccccc:;,.......'dxc:lkl,;;lO000Oo,;,....,lllloOOc....:kl..oNMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMNd..lk:...oxdooccooc'...ckc'ck0000k:..lkdddxd'............,;;,............'dxdddkl..;k0000kc'cxc.......:do,.;;...:kl..dNMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMWk'.ckc...ld,.':loc'...'dk:...;d000Ol..lO0000d;,...;:;'....';;'....';:;...,;d0000Ol..lO000d;...:kd'....cd:..'od,...ckc.'kWMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMWWWWWWWWWWWWWWWMMMMMMMMM0;.;ko...;oo:,........,xx,..'..;xO00d'.lO0000d;;,'oO0kl,..,::::,..,lk0Oo,,;;d0000Ol.'d00Ox;..'..,xx,....'::.':ldc...ok;.;0MMMMMMMMMWWWWWWWWWWWWWWWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMXl.'dx'..:doclloo:....,xx,..',,'.'ck0x,.lO0000d'.';d00Oo,';::::::;',oO00x;'.'d0000Ol.,x0kc'.'','..,xx,...,xl....lx;..'xd'.lXMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMWk'.lk:...dx,....''...'xx,..',,,,'.;k0d'.lO0000d'',.:x00koc:;;::;;:cok00x:.,''d0000Ol.'d0k;.',,,,'..,xx'...ldc:coxc....:kl.'kWMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMM
MMMMMMMMMMMMMWNWMMMMMMMMMMMMMMMMMMMMMXc.,xo....,loolc;.....dk;..',,,,,'.;xOc..lO0000d,;:':x00ko;..';;'..;ok00x:':;,d0000Ol..cOx;.',,,,,'..;kd....,ccc:'......ok,.cXMMMMMMMMMMMMMMMMMMMMMWNWMMMMMMMMMMMMM
MMMMMMMMMMMMMWWMMMWWWMMMW0OXMMMMMMMMWk'.lk;..,loloodxl'...cOc.,c;,,,,,,''cc;;,lO0000d''lxO00x:....,;;,....:x00Oxo''d0000Ol,,;cc'',,,,,,;c,.cOc........'.'c,..;kl.'kWMMMMMMMMXO0WMMMWWWMMMWWMMMMMMMMMMMMM
MMMMMMMMMMMMMWWMMMW0ddOOo,lXMMMMMMMMNl.'xd...lxclOxdkl...,xd..dx;',,,,,ll;ckx;lO0000d'.cO0kdl:,',,;::;,,',:odx0Oc.'d0000Ol;xkc;ll,,,,,';xd..dk,...cl':d,'dl...dx'.lNMMMMMMMMXc,oOkdd0WMMMWWMMMMMMMMMMMMM
MMMMMMMMMMMMWWWMMMMNx'....:kXWMMMMMMK:.;kl...oxcdOccx:...lk:.:0k;,,,,,,dKXNWO;lOOkkkd;.;xx,..;:,..,::,..,:;..;xx;.;dkkkOOl;kWNXKd,,,,,,;k0:.:kl...:xllOxokd'..ck;.:KMMMMMMWXk;....,xNMMMMWWWMMMMMMMMMMMM
MMMMMMMMMMMMWWMMMMMNx,.....,lkXWMMMWO,.lk;...'cllloo:....xx'.dNk;,,,,,,dNMMM0::kkl:lxd,.,:;'.....';::;'.....';c,.,dxlclkkc:0MMMNd,,,,,,;kNd.'xx...'ldxkkdl,...;kl.'OMMMMWKxc,.....,kNMMMMMWWMMMMMMMMMMMM
MMMMMMMMMMMMMWMMMMXxccc,.'dKXNWMMMMWx..ox,..............,ko.,OWk;,,,,,,dNMMMNd;oxoloxOx;.........;::::;.........;xOxoloxo;dNMMMNd,,,,,,;kWO,.ok,...'odllldl'..,xo..xWMMMMWNXKo..;cccxXMMMMWMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMNXNWWKc:0MMMMMMMMWd..dx'..':::::::'...:Oc.;KWk;,,,,,,dNMMMMXo;lkOOO00ko;.........''.........,ok00OOOkl;oXMMMMNd,,,,,,;kWK;.ck:...cx;...,xl..'xd..dWMMMMMMMM0:lKWWNXNMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMXKNMMMMMMMMNo..xd...okocccokc...ck:.:KWk;,,,,,,dNMMMMMXl,ck000000Odc,..............,cdO000000kc,lXMMMMMNd,,,,,,;kWX:.:kc...ckdlllokl...dx..oNMMMMMMMMNKNMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNo..xd...cx;...:x:...cO:.:KWk;,,,,,,dNMMMMMWx,.,ok0000000kdl:,......,:ldk0000000ko,.,xWMMMMMNd,,,,,,;kWX:.:Oc....,;,,,,'....dx..oNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd..dx'...coooodl'...:Oc.;KWk;',,,,,dNMMMMMWk;'..,lk000000000Oxooooxk00000000Okl,..';xWMMMMMNd,,,,,,;kWK;.ck:..........;'..'xd..dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx..ok,..'coxkkdxl...,ko.'OWk;',,,,,dNMMMMMWk;,'''.,:dk0000000kollok0000000kd:,.'',,;xWMMMMMNd,,,,,,;kWO,.ok,........'cd;..'xo..xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMWMMMMMMMMMMMMMMMMMMMMMMO,.ck;..;kd:xx,lx'...dx'.dNk;,,,,,,dNMMMMMWx;',,,'';cccdkO000kl::lk000Okdccc;',,,,';xWMMMMMNd,,,,,,;kNd.'xd....coookkoc'..;kl.'OWMMMMMMMMMMMMMMMMMMMMMWMMMMMMMMMMMMM
MMMMMMMMMMMMWWMMMMMMMMMMWKKWMMMMMMMMK:.;kl..'dl.:l';o,...cO:.:0k;,,,,,,dNMMMMMWx;,,,,,,dXKxocclxkkxkkxkkxlcclxKXd,,,,,,;xWMMMMMNd,,,,,,;k0:.:kc....cxxxOo.....lk;.:KMMMMMMMMWKKMMMMMMMMMMMWWMMMMMMMMMMMM
MMMMMMMMMMMMWWWMMMMMWMMW0:cKMMMMMMMMNo.'xd...,;,:lloxl...'xd..ox;,,,,,,dNMMMMMWx;,,,,,,dNMMWXOd:;:lool:;:dOXWMMNd,,,,,,;xWMMMMMNd,,,,,,;xo..dx,......':ddl'...dx'.oNMMMMMMMMK:cKMMMWMMMMMWWWMMMMMMMMMMMM
MMMMMMMMMMMMMWWMMMWXkooo;..oO0KXWMMMWO'.lk:...cloOx:lx:...cOc.,:;,,,,',dNMMMMMWx;,,,,,,dNMMMMMNx,......,dNMMMMMNd,,,,,,;xWMMMMMNd,',,,,;c,.cOc..........:c'..;kl.'kWMMMWX00Ol..;oookXMMMMWWMMMMMMMMMMMMM
MMMMMMMMMMMMMWWMMMMWXx;.....'cxKWMMMMXc.,xd......:xoox:....ok;..',,,,,,dNMMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xNMMMMMNd,,,,,,;xWMMMMMNd,,,,,,'..;ko...'loc;clll;...dx,.cXMMMMWKd:'.....;xXWMMMMWWMMMMMMMMMMMMM
MMMMMMMMMMMMMWNWMMMMMXl.....dNWMMMMMMWk'.ck:......;dkd:'...'dx,..',,,,,dNMMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMMMMNd,,,,,'..,xx'...lx:cxolxo...:kc.'kWMMMMMMWXd.....oXMMMMMWNWMMMMMMMMMMMMM
MMMMMMMMMMMMMMWWMMMMNkcokkc,dNMMMMMMMMNl..dx'....;ddllldc...,xx,..',,,,dNMMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMMMMNd,,,,'..,xx,....;oddl;cxc..'xd..lNMMMMMMMMNo,lkklckWMMMMWWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWWWMMMWXNWMMW00NMMMMMMMMM0:.,ko...,xo....ck;...'dx;..'',,dNMMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMMMMNd,,''..;xd,.........'cc,...ok,.;0MMMMMMMMMN0KWMMWNXWMMMWWWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMWk,.:kl...od:,;lxd:'...'okc...',dNMMMMMWk;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMMMMNd,'...cko'...,;;,'........ck:.,kWMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMNx'.ckc...;lloxkxdxl....ckd,..'dNMMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMMMMNd'..'okc.....o0xdkxol,...ckc..xNMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMNd..lkc....:ddkk;;xo....,dxc..;OWMMMMWx;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xNMMMMNO;..cxo,....'''cxkx;.....ckl..dNMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMWWMMMMMMMMNd..ckc...,,.'xkddo:;....;dxc.'ckNMMWk;,,,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xWMMNOc'.cxd:....coodo,;dx;....ckc..dNMMMMMMMMMWMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMKx0WMMMMMMMMNd'.:xo....'ldl,..;kx;....:dxc'.;d0Xx;,,,,',dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,,;xX0d;.'cxd:....'dk:,dkdool,...ok:.'dNMMMMMMMMW0xXMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMWWWMMMMMMMMMWk,;OXK00NMMMMNk,.;xd,..';'...:ddooc'....;oxo;.':;'',,,,,dNMMMMMWx,,,,,,,,xWMMMMMNd,,,,,'';:'.;oxo;....''':oxOx,.,;'..,dx;.,kNMMMMN00KXk;,OWMMMMMMMMMWWWMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMWWMMMMMWXOxo;...',cONMMMMMW0:.'oxc.....:do;..,dd:'....'cddo;'....'',dNMMMMMWx,,,,,,,,xNMMMMMNd,''....';lddc'.....,xkolcldxl'....cxo'.:0WMMMMMNkc,,...:dxOXWMMMMMWWMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMWWMMMMWKkl,.....cKWMMMMMMMMXo'.:xd,...;,...cdocdo.......,codol;'...;ok0KXNXd,',,,,,,dXNXK0ko;...';lodoc,.....,c'.lkxOOdol;...,dx:.'oXMMMMMMMMW0:.....;lkKWMMMMWWMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMWWMMMMMMWO;.';',xNMMMMMMMMMWO:.'lxl'....,do;.cx;.,c:.......;coddoc:,''',;;'........';;,''',:coodoc;.........'ox:,o0o'.'...'lxl'.:ONMMMMMMMMMNx,';'.;0WMMMMMMWWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMWWWMMMMMWOcoKNKOkXMMMMMMMMMMMXd,.,oxl'...'..;kxlooddollc,......,:coooooolllcccccccclllooooool:'.......;l;.....:xo:oc....'cxo,.,dXMMMMMMMMMMWKkOKN0lc0MMMMMMWWWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMWWMMMMMXXWMMMMMMMMMMMMMMMMMMWKo'.;oxl'....:kd:,;dd;''ox;............',;::ccccccccc:;,'..............d0xdc'':cdk:....'lxo;.'oKWMMMMMMMMMMMMMMMMMMWXNMMMMMWWWMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMW0o'.,oxo,.......lk;...ck:...,ccc:'........................,'..cc.....ckxxkxdolc,...,oxo,.'l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMWKo,.'cddc'....,ooccoxc...cxl;;ldclc...;;..;;'..,cccl:'.;kOl':kl....;kx,.';'...'cddc'.,o0WMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMWK0NMMMWNWMMMMWXx:..;odo:'...,::;'...,kl.,clooko..'xo'cOOkc.oOl,;dx;lkdOx:lkc';::l;.....':odo;..:xKWMMMMWNWMMMN0KWMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMWk;ckOxldXMMMMMMMN0o;..:odoc,.........ox::o0xokc..:klcOxkKO:ck:..:kodOoldxooxoc:'....,codo:..;oONMMMMMMMXdlxOk:;kWMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMNk,....:0WMMMMMMMMMWXOo;..;lodoc,......;ccod:;dd::xxlxxclokxlkx::dd:ol...,,......,cldol;..;lOXWMMMMMMMMMW0;....,kNMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMWKxc,.....,xXWMMMMMMMMMMMWNOd:'.';looolc;'........;:c;';:....'c::lc:;.........';cloooc;'.':dONWMMMMMMMMMMMWXx,.....,lkXWMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMWXKOOo'.,cllxXWMMMMMMMMMMMMMMWKko:,..,:loooolc:;,'....................',;:clooool:,..,:okKWMMMMMMMMMMMMMMWKxllc,.'oOOKNWMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMKc:0WWWWWMMMMMMMMMMMMMMMMMMMWXOxo:,'.',;clllooooollllllllllllooooolllc;,'.',:oxOXWMMMMMMMMMMMMMMMMMMMWWWWWO;lXMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMW0KWMMMMMMMMMMMMMMMMMMMNNMMMMMMMMWXKOxol:;,'..''',,,;;;;;;,,,'''..',;:loxOKXWMMMMMMMWNNMMMMMMMMMMMMMMMMMMMW00WMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMXO0NWNkoOWMMMMMMMMMMMMMMWNXK0OkxxddoooooooodddxkO0KXNWMMMMMMMMMMMMMMWOokNWN0OXMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMNd;;c;.;0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0,.;c;;dNMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMWK:....'lkKNMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMNKxc.....:KMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMMMMMNkc'....,cokKWMMMMMMMMMMMMMNxkNMMMMMMMMMMMMMMMMMMNxxNMMMMMMMMMMMMMWKxoc,....'cONMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMMMMMMWXOO00o.;0WMMMMMMMMMMMWXO0K0o.:KWMMMMMMMMMMMMMMMMWK:'o0K00XWMMMMMMMMMMWWO,'o0OkOXMMMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMNxdXMMMMMMMMMMMMMXx:'....:ldkXWMMMMMMMMWXkdl;....':kXMMMMMMMMMMMMMXdxNMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMWNWMMMMMMMMMMMMMMWO;....'cx0NMMMMMMMMMMN0xc.....;0WMMMMMMMMMMMMMMWNWMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMXo,;:,.:KMMMMMMMMMMMMMMMMK:.,:;,dNMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWMMMMMMMMMMMMMMMMWKk0NWKdl0MMMMMMMMMMMMMMMM0ldXWX0OXWMMMMMMMMMMMMMMMMWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWMMMMMMMMMMMMMMMMMMMWNNMMMMMMMMMMMMMMMMNNWMMMMMMMMMMMMMMMMMMMWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWWWWWMMMMMMMMMMMMWWWWWNNWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM


--%>
