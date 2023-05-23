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
public class Turista implements Serializable{
    private Integer id_turista;
    private String correo;
    private String nombre;
    private String apellido_pat;
    private String apellido_mat;
    private Date fecha_nac;
    private String lugar_proc;
    private String genero;
    private String contraseña;
    private String nombre_user;
    private int iniciado;

    public int getIniciado() {
        return iniciado;
    }

    public void setIniciado(int iniciado) {
        this.iniciado = iniciado;
    }




    public Turista() {
    }

    public Integer getId_turista() {
        return id_turista;
    }

    public void setId_turista(Integer id_turista) {
        this.id_turista = id_turista;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_pat() {
        return apellido_pat;
    }

    public void setApellido_pat(String apellido_pat) {
        this.apellido_pat = apellido_pat;
    }

    public String getApellido_mat() {
        return apellido_mat;
    }

    public void setApellido_mat(String apellido_mat) {
        this.apellido_mat = apellido_mat;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getLugar_proc() {
        return lugar_proc;
    }

    public void setLugar_proc(String lugar_proc) {
        this.lugar_proc = lugar_proc;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getNombre_user() {
        return nombre_user;
    }

    public void setNombre_user(String nombre_user) {
        this.nombre_user = nombre_user;
    }
    
    
}
