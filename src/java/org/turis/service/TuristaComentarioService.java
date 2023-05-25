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
import org.turis.dao.Turista;
import org.turis.dao.TuristaComentario;

/**
 *
 * @author ruizl
 */
public class TuristaComentarioService extends Conexion<TuristaComentario>{
    public List<TuristaComentario> getTuristaComentarioList() 
    {
        List<TuristaComentario> turistaComentarioList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        TuristaComentario turistaComentario = null;

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
            resultSet = statement.executeQuery("SELECT * FROM TURISTA_COMENTARIOS");
            if (resultSet == null) 
            {
                return null;
            }
            turistaComentarioList = new ArrayList<>();
            while (resultSet.next()) 
            {
                turistaComentario = new TuristaComentario();
                turistaComentario.setId_comentario(new Comentarios( resultSet.getInt(1) ) );
                turistaComentario.setId_turista(new Turista( resultSet.getInt(2) ) );
                turistaComentarioList.add(turistaComentario);
            }
            resultSet.close();
            closeConnection(connection);
            return turistaComentarioList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addTuristaComentario( TuristaComentario turistaComentario )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO TURISTA_COMENTARIOS(ID_COMENTARIO,ID_TURISTA) VALUES(?,?)";
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
            preparedStatement.setInt(1, turistaComentario.getId_comentario().getId_comentario());
            preparedStatement.setInt(2, turistaComentario.getId_turista().getId_turista());
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
    
    public boolean updateTuristaComentario( TuristaComentario turistaComentario )
    {
        return false;
    }
    
    public boolean deleteTuristaComentario( TuristaComentario turistaComentario )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM TURISTA_COMENTARIOS WHERE ID_COMENTARIO = ? AND ID_TURISTA = ?";
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
            preparedStatement.setInt(1, turistaComentario.getId_comentario().getId_comentario());
            preparedStatement.setInt(2, turistaComentario.getId_turista().getId_turista());
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
    
    public TuristaComentario getTuristaComentarioByTuristaComentario( Integer id_comentario , Integer id_turista) 
    {
        TuristaComentario aux = null;
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
            preparedStatement = connection.prepareStatement("SELECT * FROM TURISTA_COMENTARIOS WHERE ID_COMENTARIO = ? AND ID_TURISTA = ?" );
            if (preparedStatement == null) 
            {
                return null;
            }
            preparedStatement.setInt(1,  id_comentario);
            preparedStatement.setInt(2, id_turista );
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) 
            {
                return null;
            }
            aux = new TuristaComentario ( );
            while (resultSet.next()) 
            {
                
                aux.setId_comentario(new Comentarios( resultSet.getInt(1)) );
                aux.setId_turista(new Turista( resultSet.getInt(2)) );
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
