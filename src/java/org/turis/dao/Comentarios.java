/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.dao;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author ruizl
 */
public class Comentarios implements Serializable{
    
    private Integer id_comentario;
    private String comentario;
    private Integer calificacion;
    private Date fecha;
    private Turista id_turista;
    private Lugar id_lugar;

    public Comentarios() {
    }

    public Comentarios (Integer id_comentario) 
    {
        this.id_comentario = id_comentario;
    }

    public Integer getId_comentario() {
        return id_comentario;
    }

    public void setId_comentario(Integer id_comentario) {
        this.id_comentario = id_comentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Integer getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(Integer calificacion) {
        this.calificacion = calificacion;
    }

    public Turista getId_turista() {
        return id_turista;
    }

    public void setId_turista(Turista id_turista) {
        this.id_turista = id_turista;
    }

    public Lugar getId_lugar() {
        return id_lugar;
    }

    public void setId_lugar(Lugar id_lugar) {
        this.id_lugar = id_lugar;
    }
    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
