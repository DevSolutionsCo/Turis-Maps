/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.helper;

import java.io.Serializable;
import java.util.List;
import org.turis.dao.Comentarios;
import org.turis.dao.Lugar;
import org.turis.dao.LugarComentarios;
import org.turis.service.LugarComentariosService;

/**
 *
 * @author ruizl
 */
public class LugarComentariosHelper extends Helpers<LugarComentarios> implements Serializable{
     
    private LugarComentariosService lugarService;

    public LugarComentariosHelper() {
    }
    
    public boolean isValidaCamposOk( )
    {
        return isNotNull( t.getId_comentario().getId_comentario()) && isNotNull( t.getId_lugar().getId_lugar());
    }

    @Override
    public boolean addT() 
    {
        lugarService = new LugarComentariosService();
        t = new LugarComentarios();
        t.setId_comentario(new Comentarios( Integer.parseInt(getParameter("id_comentario"))));
        t.setId_lugar(new Lugar(Integer.parseInt(getParameter("id_lugar"))));
        if( isValidaCamposOk( ) )
        {
            return lugarService.addLugarComentarios(t );
        }
        return false;
    }

    /**
     *
     * @return
     */
    @Override
    public List<LugarComentarios> getListT() 
    {
        lugarService = new LugarComentariosService();
        return lugarService.getLugarComentariosList();
    }

    /**
     *
     * @return
     */
    @Override
    public boolean updateT()
    {
        return false;   
    }
    
    /**
     *
     * @return
     */
    @Override
    public boolean deleteT()
    {
        lugarService = new LugarComentariosService();
        t = new LugarComentarios();
        t.setId_comentario(new Comentarios(Integer.parseInt(getParameter("id_comentario" ) ) ));
        t.setId_lugar(new Lugar( Integer.parseInt(getParameter("id_lugar") ) ));
        if( t.getId_comentario().getId_comentario()!= null && t.getId_comentario().getId_comentario() > 0 && 
            t.getId_lugar().getId_lugar()!= null && t.getId_lugar().getId_lugar()> 0 )
        {
            return lugarService.deleteLugarComentarios(t );
        }
        return false;
        
    }

    @Override
    public LugarComentarios getTByKey() 
    {
        Integer id_comentario = null;
        Integer id_lugar = null;
        
        id_comentario = Integer.parseInt(getParameter("id_comentario" ));
        id_lugar = Integer.parseInt(getParameter("id_lugar" ));
        if( id_comentario == null || id_comentario <= 0 )
        {
            return null;
        }
        if( id_lugar == null || id_lugar <= 0 )
        {
            return null;
        }
        lugarService = new LugarComentariosService( );
        return lugarService.getLugarComentariosByLugarComentarios(id_comentario , id_lugar );
    }
}
