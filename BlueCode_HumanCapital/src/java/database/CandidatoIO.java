/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entidades.Candidato;
import java.sql.Connection;
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
public class CandidatoIO {
    public static Candidato getCandidato(int id, Connection con) {
       return listaCandidatos(c -> c.getId() == id, con).get(0);
    }
    
    public static void eliminarCandidato(int id, Connection con) {
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM Candidatos WHERE ID = " + id);
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void modificarCandidato(Candidato candidato, Connection con) {
        try {
            PreparedStatement stmtCandidato = con.prepareStatement("UPDATE Candidatos "
                    + "SET nombres = ?, apellidos = ?, titulo = ?, universidad = ?, email  = ?, telefono = ?, direccion = ?, expectativas = ?, estado = ? "
                    + "WHERE ID = " + candidato.getId());
            stmtCandidato.setString(1, candidato.getNombres());
            stmtCandidato.setString(2, candidato.getApellidos());
            stmtCandidato.setString(3, candidato.getTitulo());
            stmtCandidato.setString(4, candidato.getUniversidad());
            stmtCandidato.setString(5, candidato.getEmail());
            stmtCandidato.setString(6, candidato.getTelefono());
            stmtCandidato.setString(7, candidato.getDireccion());
            stmtCandidato.setString(8, candidato.getExpectativas());
            stmtCandidato.setInt(9, candidato.getEstado());
            stmtCandidato.executeUpdate();
            
            // eliminar certificados previos
            Statement eliminaCertificadoStatement = con.createStatement();
            eliminaCertificadoStatement.executeUpdate("DELETE FROM certificados WHERE candidatoID = " + candidato.getId());
            
            //inserta los certificados
            for (String certificado : candidato.getCertificados()) {
                PreparedStatement insertCertificadoStatement = con.prepareStatement("INSERT INTO Certificados "
                        + "(candidatoId, certificado) "
                        + "VALUES(?,?)");
                insertCertificadoStatement.setInt(1, candidato.getId());
                insertCertificadoStatement.setString(2, certificado);
                insertCertificadoStatement.executeUpdate();
            }
            
            // eliminar trabajos previos
            Statement eliminaTrabajosStatement = con.createStatement();
            eliminaCertificadoStatement.executeUpdate("DELETE FROM trabajosanteriores WHERE candidatoID = " + candidato.getId());
            
             //inserta los trabajos anteriores
             for (String trabajoAnterior : candidato.getTrabajosAnteriores()) {
                PreparedStatement insertTrabajoAnteriorStatement = con.prepareStatement("INSERT INTO trabajosanteriores "
                        + "(candidatoId, nombre) "
                        + "VALUES(?,?)");
                insertTrabajoAnteriorStatement.setInt(1, candidato.getId());
                insertTrabajoAnteriorStatement.setString(2, trabajoAnterior);
                insertTrabajoAnteriorStatement.executeUpdate();
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<Candidato> listaCandidatos(CondicionCandidato expresion, Connection con) {
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
                if (expresion.condicion(candidato)) {
                    // Certificados
                    Statement stmtCertificados = con.createStatement();
                    ResultSet rsCertificados = stmtCertificados.executeQuery("SELECT * FROM certificados WHERE candidatoID = " + candidato.getId());
                    while (rsCertificados.next()) {
                        candidato.getCertificados().add(rsCertificados.getString(2));
                    }

                    // Trabajos Anteriores
                    Statement stmtTrabajosAnteriores = con.createStatement();
                    ResultSet rsTrabajosAnteriores = stmtTrabajosAnteriores.executeQuery("SELECT * FROM trabajosanteriores WHERE candidatoID = " + candidato.getId());
                    while (rsTrabajosAnteriores.next()) {
                        candidato.getTrabajosAnteriores().add(rsTrabajosAnteriores.getString(2));
                    }
                    candidatos.add(candidato);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
        return candidatos;
    }  
    
    public static void insertarCandidato(Candidato candidato, Connection con) {
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
            ResultSet rs = lastIdStatement.executeQuery("SELECT LAST_INSERT_ID() FROM CANDIDATOS");
            rs.next();
            candidato.setId(rs.getInt(1));
            
            //inserta los certificados
            for (String certificado : candidato.getCertificados()) {
                PreparedStatement insertCertificadoStatement = con.prepareStatement("INSERT INTO Certificados"
                        + "(candidatoId, certificado) "
                        + "VALUES(?,?)");
                insertCertificadoStatement.setInt(1, candidato.getId());
                insertCertificadoStatement.setString(2, certificado);
                insertCertificadoStatement.executeUpdate();
            }
            
             //inserta los trabajos anteriores
            for (String trabajoAnterior : candidato.getTrabajosAnteriores()) {
                PreparedStatement insertTrabajoAnteriorStatement = con.prepareStatement("INSERT INTO TrabajosAnteriores"
                        + "(candidatoId, nombre) "
                        + "VALUES(?,?)");
                insertTrabajoAnteriorStatement.setInt(1, candidato.getId());
                insertTrabajoAnteriorStatement.setString(2, trabajoAnterior);
                insertTrabajoAnteriorStatement.executeUpdate();
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
