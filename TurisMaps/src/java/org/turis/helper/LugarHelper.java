/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.helper;

import java.io.Serializable;
import java.util.List;
import org.turis.dao.Lugar;
import org.turis.service.LugarService;

/**
 *
 * @author ruizl
 */
public class LugarHelper extends Helpers<Lugar> implements Serializable{

    private LugarService lugarService;

    public LugarHelper() {
    }

    public boolean isValidaCamposOk() {
        return  isNotNull(t.getId_lugar()) && isNotNullAndNotEmpity(t.getLugar());
    }

    @Override
    public boolean addT() {
        lugarService = new LugarService();
        t = new Lugar();
        
        t.setId_lugar(Integer.parseInt(getParameter("id_lugar")));
        t.setLugar(getParameter("lugar"));
        if (isValidaCamposOk()) {
            return lugarService.addLugar(t);
        }

        return false;
    }

    @Override
    public List<Lugar> getListT() {
        lugarService = new LugarService();
        return lugarService.getLugarList();
    }

    @Override
    public boolean updateT() {
        lugarService = new LugarService();
        t = new Lugar();
       
        t.setId_lugar(Integer.parseInt(getParameter("id_lugar")));
        t.setLugar(getParameter("lugar"));
        if (isValidaCamposOk()) {
            return lugarService.updateLugar(t);
        }
        return false;
    }

    @Override
    public boolean deleteT() {
        lugarService = new LugarService();
        t = new Lugar();
        t.setId_lugar(Integer.parseInt(getParameter("id_lugar")));
        if (t.getId_lugar() != null && t.getId_lugar() > 0) {
            return lugarService.deleteLugar(t);
        }
        return false;
    }

    @Override
    public Lugar getTByKey() {
        String lugar = null;
        lugar = getParameter("lugar");
        if (lugar == null || lugar.length() <= 0) {
            return null;
        }
        lugarService = new LugarService();
        return  lugarService.getLugarByLugar(lugar);
    }

}
