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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                auxEntrevista.setCandidatoID(rsEntrevistas.getInt("candidatoID"));
                auxEntrevista.setEntrevistadorID(rsEntrevistas.getInt("entrevistadorID"));
                auxEntrevista.setFecha(rsEntrevistas.getDate("fecha"));
                auxEntrevista.setPlataforma(rsEntrevistas.getString("plataforma"));
                auxEntrevista.setFeedback(rsEntrevistas.getString("feedback"));
                
                // agregar candidato y entrevistador
                Candidato auxCandidato = CandidatoIO.getCandidato(auxEntrevista.getCandidatoID(), con);
                auxEntrevista.setCandidato(auxCandidato);
                
                Empleado auxEntrevistador = EmpleadoIO.getEmpleado(con, auxEntrevista.getEntrevistadorID());
                auxEntrevista.setEntrevistador(auxEntrevistador);
                auxEntrevista.setID();
                entrevistas.add(auxEntrevista);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return entrevistas;
    }
}
