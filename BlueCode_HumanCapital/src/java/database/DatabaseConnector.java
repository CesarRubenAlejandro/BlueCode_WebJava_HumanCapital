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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
    
    public static ArrayList<Candidato> listaCandidatos(CondicionCandidato expresion) {
        ArrayList<Candidato> candidatos = new ArrayList<>();
        try {
            Statement stmtCandidatos = con.createStatement();
            ResultSet rsCandidatos = stmtCandidatos.executeQuery("SELECT * FROM Candidatos");
            while (rsCandidatos.next()) {
                Candidato candidato = new Candidato();
                candidato.setId(rsCandidatos.getInt(1));
                candidato.setNombres(rsCandidatos.getString(2));
                candidato.setApellidos(rsCandidatos.getString(3));
                candidato.setTitulo(rsCandidatos.getString(4));
                candidato.setUniversidad(rsCandidatos.getString(5));
                candidato.setEmail(rsCandidatos.getString(6));
                candidato.setTelefono(rsCandidatos.getString(7));
                candidato.setDireccion(rsCandidatos.getString(8));
                candidato.setExpectativas(rsCandidatos.getString(9));
                candidato.setEstado(rsCandidatos.getInt(10));
                
                // Certificados
                Statement stmtCertificados = con.createStatement();
                ResultSet rsCertificados = stmtCertificados.executeQuery("SELECT * FROM Candidatos WHERE ID = " + candidato.getId());
                while (rsCertificados.next()) {
                    candidato.getCertificados().add(rsCertificados.getString(1));
                }
                
                // Trabajos Anteriores
                Statement stmtTrabajosAnteriores = con.createStatement();
                ResultSet rsTrabajosAnteriores = stmtTrabajosAnteriores.executeQuery("SELECT * FROM Candidatos WHERE ID = " + candidato.getId());
                while (rsTrabajosAnteriores.next()) {
                    candidato.getTrabajosAnteriores().add(rsTrabajosAnteriores.getString(1));
                }
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
        return candidatos;
    }  
    
    public static void insertarCandidato(Candidato candidato) {
        try {
            PreparedStatement insertCandidatoStatement = con.prepareStatement("INSERT INTO Candidatos"
                    + "(nombres, apellidos, titulo, universidad, email, telefono, direccion, expectativas, estado) "
                    + "VALUES(?,?,?,?,?,?,?,?,?)");
            insertCandidatoStatement.setString(1, candidato.getNombres());
            insertCandidatoStatement.setString(2, candidato.getApellidos());
            insertCandidatoStatement.setString(3, candidato.getTitulo());
            insertCandidatoStatement.setString(4, candidato.getUniversidad());
            insertCandidatoStatement.setString(5, candidato.getEmail());
            insertCandidatoStatement.setString(6, candidato.getTelefono());
            insertCandidatoStatement.setString(7, candidato.getDireccion());
            insertCandidatoStatement.setString(8, candidato.getExpectativas());
            insertCandidatoStatement.setInt(9, candidato.getEstado());
            insertCandidatoStatement.executeUpdate();
            
            // obtiene el ID del candidato que acaba de ser insertado
            Statement lastIdStatement = con.createStatement();
            ResultSet rs = lastIdStatement.executeQuery("SELECT LAST_INSERT_ID()");
            candidato.setId(rs.getInt(1));
            
            //inserta los certificados
            for (String certificado : candidato.getCertificados()) {
                PreparedStatement insertCertificadoStatement = con.prepareStatement("INSERT INTO Certificados"
                        + "(candidatoId, nombre) "
                        + "VALUES(?,?)");
                insertCertificadoStatement.setInt(1, candidato.getId());
                insertCertificadoStatement.setString(2, certificado);
                insertCandidatoStatement.executeUpdate();
            }
            
             //inserta los trabajos anteriores
            for (String trabajoAnterior : candidato.getTrabajosAnteriores()) {
                PreparedStatement insertCertificadoStatement = con.prepareStatement("INSERT INTO TrabajosAnteriores"
                        + "(candidatoId, nombre) "
                        + "VALUES(?,?)");
                insertCertificadoStatement.setInt(1, candidato.getId());
                insertCertificadoStatement.setString(2, trabajoAnterior);
                insertCandidatoStatement.executeUpdate();
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*
    public static void insertarEmpleado(Candidato candidato, Empleado empleado) {
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Empleados"
                    + "(ID, salario, puesto, diasDeVacaciones) "
                    + "VALUES(?,?,?,?)");
            pstmt.setInt(1, candidato.getId());
            pstmt.setDouble(2, empleado.getSalario());
            pstmt.setString(3, .getTitulo());
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
    */
}
