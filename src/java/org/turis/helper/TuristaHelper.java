/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.helper;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.turis.dao.Turista;
import org.turis.service.TuristaService;

/**
 *
 * @author ruizl
 */
public class TuristaHelper extends Helpers<Turista> implements Serializable {

    private TuristaService turistaService;

    public TuristaHelper() {
    }

    public boolean isValidaCamposOk() {
        return  isNotNullAndNotEmpity(t.getCorreo())
                && isNotNullAndNotEmpity(t.getNombre()) && isNotNullAndNotEmpity(t.getApellido_pat())
                && isNotNullAndNotEmpity(t.getApellido_mat()) && isNotNull(t.getFecha_nac())
                && isNotNullAndNotEmpity(t.getLugar_proc()) && isNotNullAndNotEmpity(t.getGenero())
                && isNotNullAndNotEmpity(t.getContraseña()) && isNotNullAndNotEmpity(t.getNombre_user());
    }

    @Override
    public boolean addT() {
        turistaService = new TuristaService();
        t = new Turista();
        
        t.setNombre_user(getParameter("nombre_user"));
        t.setCorreo(getParameter("correo"));
        t.setNombre(getParameter("nombre"));
        t.setApellido_pat(getParameter("apellido_pat"));
        t.setApellido_mat(getParameter("apellido_mat"));
        t.setFecha_nac(string2Date(getParameter("fecha_nac")));
        t.setLugar_proc(getParameter("lugar_proc"));
        t.setGenero(getParameter("genero"));
        t.setContraseña(getParameter("contrasena"));
        if (isValidaCamposOk()) {
            return turistaService.addTurista(t);
        }

        return false;
    }

    @Override
    public List<Turista> getListT() {
        turistaService = new TuristaService();
        return turistaService.getTuristaList();
    }

    @Override
    public boolean updateT() {
        turistaService = new TuristaService();
        t = new Turista();
       
        t.setCorreo(getParameter("correo"));
        t.setNombre(getParameter("nombre"));
        t.setApellido_pat(getParameter("apellido_pat"));
        t.setApellido_mat(getParameter("apellido_mat"));
        t.setFecha_nac(string2Date("fecha_nac"));
        t.setLugar_proc(getParameter("lugar_proc"));
        t.setGenero(getParameter("genero"));
        t.setContraseña(getParameter("contraseña"));
        t.setNombre_user(getParameter("nombre_user"));
        if (isValidaCamposOk()) {
            return turistaService.updateTurista(t);
        }
        return false;
    }

   
    @Override
    public Turista getTByKey() {
        String correo = null;
        correo = getParameter("correo");
        if (correo == null || correo.length() <= 0) {
            return null;
        }
        turistaService = new TuristaService();
        return  turistaService.getTuristaByCorreo(correo);
    }

    @Override
    public boolean deleteT() {
        return false;
    }

}
