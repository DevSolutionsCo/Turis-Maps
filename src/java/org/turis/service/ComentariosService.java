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
import org.turis.dao.Turista;

/**
 *
 * @author ruizl
 */
public class ComentariosService extends Conexion<Comentarios>{
     public List<Comentarios> getComentariosList() 
    {
        List<Comentarios> comentariosList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Comentarios comentarios = null;

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
            resultSet = statement.executeQuery("SELECT * FROM COMENTARIOS");
            if (resultSet == null) 
            {
                return null;
            }
            comentariosList = new ArrayList<>();
            while (resultSet.next()) 
            {
                comentarios = new Comentarios();
                
                comentarios.setComentario(resultSet.getString(1));
                comentarios.setCalificacion(resultSet.getInt(2));
                comentarios.setFecha(resultSet.getDate(3));
                comentarios.setId_turista(new Turista(resultSet.getInt(4)));
                comentarios.setId_lugar(new Lugar(resultSet.getInt(5)));
                comentariosList.add(comentarios);
            }
            resultSet.close();
            closeConnection(connection);
            return comentariosList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addComentarios( Comentarios comentarios )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO COMENTARIOS( COMENTARIO, CALIFICACION, FECHA, ID_TURISTA, ID_LUGAR,) VALUES(?,?,?,?,?)";
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
            preparedStatement.setString(1, comentarios.getComentario());
            preparedStatement.setInt(2, comentarios.getCalificacion());
            preparedStatement.setDate(3, dateUtil2DateSql(comentarios.getFecha()));
            preparedStatement.setInt(4, comentarios.getId_turista().getId_turista());
            preparedStatement.setInt(5, comentarios.getId_lugar().getId_lugar());
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
    
    public boolean updateComentarios( Comentarios comentarios )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update COMENTARIOS SET COMENTARIO=?, CALIFICACION=?, FECHA=?, ID_TURISTA=?, ID_LUGAR=? WHERE COMENTARIO = ?";
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
            preparedStatement.setString(1, comentarios.getComentario());
            preparedStatement.setInt(2, comentarios.getCalificacion());
            preparedStatement.setDate(3, dateUtil2DateSql(comentarios.getFecha()));
            preparedStatement.setInt(4, comentarios.getId_turista().getId_turista());
            preparedStatement.setInt(5, comentarios.getId_lugar().hashCode());
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
    
    public boolean deleteComentarios(Comentarios  comentarios )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM COMENTARIOS WHERE COMENTARIO = ?";
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
            preparedStatement.setString(1, comentarios.getComentario());
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
    

    public Comentarios getComentariosByComentario( String comentario) 
    {
        Comentarios aux = null;
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
            preparedStatement = connection.prepareStatement("SELECT * FROM COMENTARIOS WHERE COMENTARIO = ?" );
            if (preparedStatement == null) 
            {
                return null;
            }
            preparedStatement.setString(1, comentario );
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) 
            {
                return null;
            }
            aux = new Comentarios ( );
            while (resultSet.next()) 
            {
                aux.setComentario(resultSet.getString(1 ) );
                aux.setCalificacion(resultSet.getInt(2 ) );
                aux.setFecha(resultSet.getDate(3 ) );
                aux.setId_turista(new Turista(resultSet.getInt( 4 )) );
                aux.setId_lugar(new Lugar(resultSet.getInt(5 )) );
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
