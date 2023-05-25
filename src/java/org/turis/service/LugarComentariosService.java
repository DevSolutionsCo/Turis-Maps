/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.turis.dao.Comentarios;
import org.turis.dao.Lugar;
import org.turis.dao.LugarComentarios;

/**
 *
 * @author ruizl
 */
public class LugarComentariosService extends Conexion<LugarComentarios>{
    public List<LugarComentarios> getLugarComentariosList() 
    {
        List<LugarComentarios> lugarComentariosList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        LugarComentarios lugarComentarios = null;

        try 
        {
            connection = getConnection();
            if (connection == null) 
            {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM LUGAR_COMENTARIOS");
            if (resultSet == null) 
            {
                return null;
            }
            lugarComentariosList = new ArrayList<>();
            while (resultSet.next()) 
            {
                lugarComentarios = new LugarComentarios();
                lugarComentarios.setId_comentario(new Comentarios( resultSet.getInt(1) ) );
                lugarComentarios.setId_lugar(new Lugar( resultSet.getInt(2) ) );
                lugarComentariosList.add(lugarComentarios);
            }
            resultSet.close();
            closeConnection(connection);
            return lugarComentariosList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addLugarComentarios( LugarComentarios lugarComentarios )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO LUGAR_COMENTARIOS(ID_COMENTARIO,ID_LUGAR) VALUES(?,?)";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, lugarComentarios.getId_comentario().getId_comentario());
            preparedStatement.setInt(2, lugarComentarios.getId_lugar().getId_lugar());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean updateLugarComentarios( LugarComentarios lugarComentarios )
    {
        return false;
    }
    
    public boolean deleteLugarComentarios( LugarComentarios lugarComentarios )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM LUGAR_COMENTARIOS WHERE ID_COMENTARIO = ? AND ID_LUGAR = ?";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, lugarComentarios.getId_comentario().getId_comentario());
            preparedStatement.setInt(2, lugarComentarios.getId_lugar().getId_lugar());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public LugarComentarios getLugarComentariosByLugarComentarios( Integer id_comentario , Integer id_lugar) 
    {
        LugarComentarios aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try 
        {
            connection = getConnection();
            if (connection == null) 
            {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM LUGAR_COMENTARIOS WHERE ID_COMENTARIO = ? AND ID_LUGAR = ?" );
            if (preparedStatement == null) 
            {
                return null;
            }
            preparedStatement.setInt(1,  id_comentario);
            preparedStatement.setInt(2, id_lugar );
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) 
            {
                return null;
            }
            aux = new LugarComentarios ( );
            while (resultSet.next()) 
            {
                
                aux.setId_comentario(new Comentarios( resultSet.getInt(1)) );
                aux.setId_lugar(new Lugar( resultSet.getInt(2)) );
            }
            resultSet.close();
            closeConnection(connection);
            return aux;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
}
