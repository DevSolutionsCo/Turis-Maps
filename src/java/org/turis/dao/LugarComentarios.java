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
public class LugarComentarios implements Serializable{
    private Lugar id_lugar;
    private Comentarios id_comentario;

    public LugarComentarios() {
    }

    public Lugar getId_lugar() {
        return id_lugar;
    }

    public void setId_lugar(Lugar id_lugar) {
        this.id_lugar = id_lugar;
    }

    public Comentarios getId_comentario() {
        return id_comentario;
    }

    public void setId_comentario(Comentarios id_comentario) {
        this.id_comentario = id_comentario;
    }
    
}
