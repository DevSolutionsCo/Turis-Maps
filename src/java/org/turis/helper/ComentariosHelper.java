/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.helper;

import java.io.Serializable;
import java.util.List;
import org.turis.dao.Comentarios;
import org.turis.dao.Lugar;
import org.turis.dao.Turista;
import org.turis.service.ComentariosService;

/**
 *
 * @author ruizl
 */
public class ComentariosHelper extends Helpers<Comentarios> implements Serializable{

    private ComentariosService comentariosService;
    
    public ComentariosHelper() {
    }

    
    public boolean isValidaCamposOk() {
        return  isNotNullAndNotEmpity(t.getComentario()) && isNotNull(t.getCalificacion()) && isNotNull(t.getFecha()) && isNotNull(t.getId_turista()) && isNotNull(t.getId_lugar());
    }

    @Override
    public boolean addT() {
        comentariosService = new ComentariosService();
        t = new Comentarios();
        
        t.setComentario(getParameter("comentario"));
        t.setCalificacion(Integer.parseInt(getParameter("calificacion")));
        t.setFecha(string2Date(getParameter("fecha")));
        t.setId_turista(new Turista(Integer.parseInt(getParameter("id_turista"))));
        t.setId_lugar(new Lugar(Integer.parseInt(getParameter("id_lugar"))));
        if (isValidaCamposOk()) {
            return comentariosService.addComentarios(t);
        }

        return false;
    }

    @Override
    public List<Comentarios> getListT() {
        comentariosService = new ComentariosService();
        return comentariosService.getComentariosList();
    }

    @Override
    public boolean updateT() {
        comentariosService = new ComentariosService();
        t = new Comentarios();
        t.setComentario(getParameter("comentario"));
        t.setCalificacion(Integer.parseInt(getParameter("calificacion")));
        t.setFecha(string2Date(getParameter("fecha")));
        t.setId_turista(new Turista(Integer.parseInt(getParameter("id_turista"))));
        t.setId_lugar(new Lugar(Integer.parseInt(getParameter("id_lugar"))));
        if (isValidaCamposOk()) {
            return comentariosService.updateComentarios(t);
        }
        return false;
    }

    @Override
    public boolean deleteT() {
        comentariosService = new ComentariosService();
        t = new Comentarios();
        t.setComentario(getParameter("comentario"));
        if (t.getComentario()!= null && t.getComentario().isEmpty()) {
            return comentariosService.deleteComentarios(t);
        }
        return false;
    }

    @Override
    public Comentarios getTByKey() {
        String comentario = null;
        comentario = getParameter("comentario");
        if (comentario == null || comentario.length() <= 0) {
            return null;
        }
        comentariosService = new ComentariosService();
        return  comentariosService.getComentariosByComentario(comentario);
    }

}
