/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.helper;

import java.io.Serializable;
import java.util.List;
import org.turis.dao.Comentarios;
import org.turis.dao.Turista;
import org.turis.dao.TuristaComentario;
import org.turis.service.TuristaComentarioService;

/**
 *
 * @author ruizl
 */
public class TuristaComentarioHelper extends Helpers<TuristaComentario> implements Serializable{
    
    private TuristaComentarioService turistaService;

    public TuristaComentarioHelper() {
    }
    
    public boolean isValidaCamposOk( )
    {
        return isNotNull( t.getId_comentario().getId_comentario()) && isNotNull( t.getId_turista().getId_turista());
    }

    @Override
    public boolean addT() 
    {
        turistaService = new TuristaComentarioService();
        t = new TuristaComentario();
        t.setId_comentario(new Comentarios( Integer.parseInt(getParameter("id_comentario"))));
        t.setId_turista(new Turista(Integer.parseInt(getParameter("id_turista"))));
        if( isValidaCamposOk( ) )
        {
            return turistaService.addTuristaComentario(t );
        }
        return false;
    }

    /**
     *
     * @return
     */
    @Override
    public List<TuristaComentario> getListT() 
    {
        turistaService = new TuristaComentarioService();
        return turistaService.getTuristaComentarioList();
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
        turistaService = new TuristaComentarioService();
        t = new TuristaComentario();
        t.setId_comentario(new Comentarios(Integer.parseInt(getParameter("id_comentario" ) ) ));
        t.setId_turista(new Turista( Integer.parseInt(getParameter("id_turista") ) ));
        if( t.getId_comentario().getId_comentario()!= null && t.getId_comentario().getId_comentario() > 0 && 
            t.getId_turista().getId_turista()!= null && t.getId_turista().getId_turista() > 0 )
        {
            return turistaService.deleteTuristaComentario(t );
        }
        return false;
        
    }

    @Override
    public TuristaComentario getTByKey() 
    {
        Integer id_comentario = null;
        Integer id_turista = null;
        
        id_comentario = Integer.parseInt(getParameter("id_comentario" ));
        id_turista = Integer.parseInt(getParameter("id_turista" ));
        if( id_comentario == null || id_comentario <= 0 )
        {
            return null;
        }
        if( id_turista == null || id_turista <= 0 )
        {
            return null;
        }
        turistaService = new TuristaComentarioService( );
        return turistaService.getTuristaComentarioByTuristaComentario(id_comentario , id_turista );
    }
}
