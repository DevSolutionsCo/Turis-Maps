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
import org.turis.dao.Lugar;

/**
 *
 * @author ruizl
 */
public class LugarService extends Conexion<Lugar>{
    public List<Lugar> getLugarList() 
    {
        List<Lugar> lugarList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Lugar lugar = null;

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
            resultSet = statement.executeQuery("SELECT * FROM LUGAR");
            if (resultSet == null) 
            {
                return null;
            }
            lugarList = new ArrayList<>();
            while (resultSet.next()) 
            {
                lugar = new Lugar();
                
                lugar.setId_lugar(resultSet.getInt(1));
                lugar.setLugar(resultSet.getString(2));
                lugarList.add(lugar);
            }
            resultSet.close();
            closeConnection(connection);
            return lugarList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addLugar( Lugar lugar )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO LUGAR( ID_LUGAR, LUGAR) VALUES(?,?)";
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
            preparedStatement.setInt(1, lugar.getId_lugar());
            preparedStatement.setString(2, lugar.getLugar());
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
    
    public boolean updateLugar( Lugar lugar )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update LUGAR SET ID_LUGAR=?, LUGAR=? WHERE ID_LUGAR = ?";
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
            preparedStatement.setInt(1, lugar.getId_lugar());
            preparedStatement.setString(2, lugar.getLugar());
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
    
    public boolean deleteLugar( Lugar lugar )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM LUGAR WHERE ID_LUGAR = ?";
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
            preparedStatement.setInt(1, lugar.getId_lugar());
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
    

    public Lugar getLugarByLugar( String lugar) 
    {
        Lugar aux = null;
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
            preparedStatement = connection.prepareStatement("SELECT * FROM LUGAR WHERE LUGAR = ?" );
            if (preparedStatement == null) 
            {
                return null;
            }
            preparedStatement.setString(1, lugar );
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) 
            {
                return null;
            }
            aux = new Lugar ( );
            while (resultSet.next()) 
            {
                aux.setId_lugar(resultSet.getInt(1 ) );
                aux.setLugar(resultSet.getString(2 ) );
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
