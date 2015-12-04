/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entidades.Candidato;
import entidades.Empleado;
import entidades.Entrevista;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lalo
 */
public class EntrevistaIO {
    /**
     * Metodo para obtener una lista de todos las entrevistas
     * @param con
     * @return 
     */
    public static ArrayList<Entrevista> getEntrevistas(Connection con){
        ArrayList<Entrevista> entrevistas = new ArrayList<>();
        Statement stmtEntrevistas;
        try {
            stmtEntrevistas = con.createStatement();
            ResultSet rsEntrevistas = stmtEntrevistas.executeQuery("SELECT * FROM entrevistas");
            while (rsEntrevistas.next()){
                // agregar informacion de la entrevista
                Entrevista auxEntrevista = new Entrevista();
                auxEntrevista.setEntrevistaID(rsEntrevistas.getInt("entrevistaID"));
                auxEntrevista.setCandidatoID(rsEntrevistas.getInt("candidatoID"));
                auxEntrevista.setEntrevistadorID(rsEntrevistas.getInt("entrevistadorID"));
                auxEntrevista.setFecha(rsEntrevistas.getTimestamp("fecha"));
                auxEntrevista.setPlataforma(rsEntrevistas.getString("plataforma"));
                auxEntrevista.setFeedback(rsEntrevistas.getString("feedback"));
                
                // agregar candidato y entrevistador
                Candidato auxCandidato = CandidatoIO.getCandidato(auxEntrevista.getCandidatoID(), con);
                auxEntrevista.setCandidato(auxCandidato);
                
                Empleado auxEntrevistador = EmpleadoIO.getEmpleado(con, auxEntrevista.getEntrevistadorID());
                auxEntrevista.setEntrevistador(auxEntrevistador);
                entrevistas.add(auxEntrevista);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return entrevistas;
    }
    
    public static void insertarEntrevista(Entrevista entrevista, Connection con) {
        try {
            PreparedStatement insertEntrevistaStatement = 
                    con.prepareStatement("INSERT INTO Entrevistas"
                    + "(candidatoID, entrevistadorID, fecha, plataforma, feedback) "
                    + "VALUES(?,?,?,?,?)");
            insertEntrevistaStatement.setInt(1, entrevista.getCandidatoID());
            insertEntrevistaStatement.setInt(2, entrevista.getEntrevistadorID());
            insertEntrevistaStatement.setTimestamp(3, new java.sql.Timestamp(entrevista.getFecha().getTime()));
            insertEntrevistaStatement.setString(4, entrevista.getPlataforma());
            insertEntrevistaStatement.setString(5, entrevista.getFeedback());
            insertEntrevistaStatement.executeUpdate();
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void borrarEntrevista(Connection con, int idEntrevista){
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM entrevistas WHERE entrevistaID = " + idEntrevista);
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Metodo para obtener una entrevista
     * @param con
     * @param idEntrevista
     */
    public static Entrevista getEntrevista(Connection con, int idEntrevista) {
        Statement stmtEntrevista;
        try {
            stmtEntrevista = con.createStatement();
            ResultSet rsEntrevista = stmtEntrevista.executeQuery("SELECT * FROM entrevistas WHERE entrevistaID = "
                    + idEntrevista);
            if (rsEntrevista.next()){
                // agregar informacion de empleado
                Entrevista auxEntrevista = new Entrevista();
                auxEntrevista.setEntrevistaID(rsEntrevista.getInt("entrevistaID"));
                auxEntrevista.setCandidatoID(rsEntrevista.getInt("candidatoID"));
                auxEntrevista.setEntrevistadorID(rsEntrevista.getInt("entrevistadorID"));
                auxEntrevista.setFecha(rsEntrevista.getDate("fecha"));
                auxEntrevista.setPlataforma(rsEntrevista.getString("plataforma"));
                auxEntrevista.setFeedback(rsEntrevista.getString("feedback"));
                
                auxEntrevista.setCandidato(DatabaseConnector.getCandidato(auxEntrevista.getCandidatoID()));
                auxEntrevista.setEntrevistador(DatabaseConnector.getEmpleado(auxEntrevista.getEntrevistadorID()));
                
                return auxEntrevista;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void modificarEntrevista(Connection con, Entrevista entrevista) {
        try {
            PreparedStatement stmtEntrevista = con.prepareStatement("UPDATE Entrevistas "
                    + "SET candidatoID = ?, entrevistadorID = ?, fecha = ?, plataforma = ?, feedback = ? " 
                    + "WHERE entrevistaID = " + entrevista.getEntrevistaID());
            stmtEntrevista.setInt(1, entrevista.getCandidatoID());
            stmtEntrevista.setInt(2, entrevista.getEntrevistadorID());
            stmtEntrevista.setTimestamp(3, new java.sql.Timestamp(entrevista.getFecha().getTime()));
            stmtEntrevista.setString(4, entrevista.getPlataforma());
            stmtEntrevista.setString(5, entrevista.getFeedback());
            stmtEntrevista.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
