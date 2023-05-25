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
public class Lugar implements Serializable{
    private Integer id_lugar;
    private String lugar;

    public Lugar() {
    }

    public Lugar (Integer id_lugar) 
    {
        this.id_lugar = id_lugar;
    }
    public Integer getId_lugar() {
        return id_lugar;
    }

    public void setId_lugar(Integer id_lugar) {
        this.id_lugar = id_lugar;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
}
