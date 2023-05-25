/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.dao;

import java.io.Serializable;

/**
 *
 * @author ruizl
 */
public class TuristaComentario implements Serializable{
    private Turista id_turista;
    private Comentarios id_comentario;

    public TuristaComentario() {
    }

    public Turista getId_turista() {
        return id_turista;
    }

    public void setId_turista(Turista id_turista) {
        this.id_turista = id_turista;
    }

    public Comentarios getId_comentario() {
        return id_comentario;
    }

    public void setId_comentario(Comentarios id_comentario) {
        this.id_comentario = id_comentario;
    }
    
    
}
