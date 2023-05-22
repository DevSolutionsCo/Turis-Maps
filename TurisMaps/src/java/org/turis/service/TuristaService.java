/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.turis.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.turis.dao.Turista;

/**
 *
 * @author ruizl
 */
public class TuristaService extends Conexion<Turista>{
     public List<Turista> getTuristaList() 
    {
        List<Turista> turistaList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Turista turista = null;

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
            resultSet = statement.executeQuery("SELECT * FROM TURISTA");
            if (resultSet == null) 
            {
                return null;
            }
            turistaList = new ArrayList<>();
            while (resultSet.next()) 
            {
                turista = new Turista();
                
                turista.setCorreo(resultSet.getString(1));
                turista.setNombre(resultSet.getString(2));
                turista.setApellido_pat(resultSet.getString(3));
                turista.setApellido_mat(resultSet.getString(4));
                turista.setFecha_nac(resultSet.getDate(5));
                turista.setLugar_proc(resultSet.getString(6));
                turista.setGenero(resultSet.getString(7));
                turista.setContraseña(resultSet.getString(8));
                turista.setNombre_user(resultSet.getString(9));
                turistaList.add(turista);
            }
            resultSet.close();
            closeConnection(connection);
            return turistaList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addTurista( Turista turista )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO TURISTA( CORREO, NOMBRE, APELLIDO_PAT, APELLIDO_MAT, FECHA_NAC, LUGAR_PROC, GENERO, CONTRASENA, NOMBRE_USER) VALUES(?,?,?,?,?,?,?,?,?)";
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
            preparedStatement.setString(1, turista.getCorreo());
            preparedStatement.setString(2, turista.getNombre());
            preparedStatement.setString(3, turista.getApellido_pat());
            preparedStatement.setString(4, turista.getApellido_mat());
            preparedStatement.setDate(5, dateUtil2DateSql(turista.getFecha_nac()));
            preparedStatement.setString(6, turista.getLugar_proc());
            preparedStatement.setString(7, turista.getGenero());
            preparedStatement.setString(8, turista.getContraseña());
            preparedStatement.setString(9, turista.getNombre_user());
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
    
    public boolean updateTurista( Turista turista )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update TURISTA SET CORREO=?, NOMBRE=?, APELLIDO_PAT=?, APELLIDO_MAT=?, FECHA_NAC=?, LUGAR_PROC=?, GENERO=?, CONTRASENA=?, NOMBRE_USER=? WHERE TURISTA = ?";
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
            preparedStatement.setString(1, turista.getCorreo());
            preparedStatement.setString(2, turista.getNombre());
            preparedStatement.setString(3, turista.getApellido_pat());
            preparedStatement.setString(4, turista.getApellido_mat());
            preparedStatement.setDate(5, dateUtil2DateSql(turista.getFecha_nac()));
            preparedStatement.setString(6, turista.getLugar_proc());
            preparedStatement.setString(7, turista.getGenero());
            preparedStatement.setString(8, turista.getContraseña());
            preparedStatement.setString(9, turista.getNombre_user());
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
    
    public boolean deleteTurista( Turista turista )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM TURISTA WHERE TURISTA = ?";
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
            preparedStatement.setInt(1, turista.getId_turista());
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
    

    public Turista getTuristaByTurista(String correo) {

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Turista turista = null;

        try {
            connection = getConnection();

            String sql = "SELECT * FROM TURISTA WHERE CORREO = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, correo);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                turista = new Turista();
                turista.setNombre_user(resultSet.getString("nombre_user"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return turista;
    }

    
}
