/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entidades.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cesar
 */
public class DatabaseConnector {
    
    private static Connection con;
    
    public DatabaseConnector() {
        String url ="jdbc:mysql://localhost/capital_humano";
        try {
            con = DriverManager.getConnection(url, "root", "");
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void insertarCandidato(Candidato candidato) {
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Candidatos"
                    + "(nombres, apellidos, titulo, universidad, email, telefono, direccion, expectativas, estado) "
                    + "VALUES(?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, candidato.getNombres());
            pstmt.setString(2, candidato.getApellidos());
            pstmt.setString(3, candidato.getTitulo());
            pstmt.setString(4, candidato.getUniversidad());
            pstmt.setString(5, candidato.getEmail());
            pstmt.setString(6, candidato.getTelefono());
            pstmt.setString(7, candidato.getDireccion());
            pstmt.setString(8, candidato.getExpectativas());
            pstmt.setInt(9, candidato.getEstado());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
