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
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url ="jdbc:mysql://localhost/capital_humano";
            con = DriverManager.getConnection(url, "root", "");
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Candidato getCandidato(int id) {
       return CandidatoIO.getCandidato(id, con);
    }
    
    public static void eliminarCandidato(int id) {
        CandidatoIO.eliminarCandidato(id, con);
    }
    
    public static void modificarCandidato(Candidato candidato) {
        CandidatoIO.modificarCandidato(candidato, con);
    }
    
    public static ArrayList<Candidato> listaCandidatos(CondicionCandidato expresion) {
        return CandidatoIO.listaCandidatos(expresion, con);
    }  
    
    public static void insertarCandidato(Candidato candidato) {
        CandidatoIO.insertarCandidato(candidato, con);
    }
    
    public static ArrayList<Empleado> getEmpleados(){
        return EmpleadoIO.getEmpleados(con);
    }
    
    public static void borrarEmpleado(int idEmpleado){
        EmpleadoIO.borrarEmpleado(con, idEmpleado);
    }
    
    public static void guardarEmpleado(Empleado empleado) {
        EmpleadoIO.guardarEmpleado(con, empleado);
    }
    
    public static ArrayList<Empleado> getEntrevistadores() {
        return EmpleadoIO.getEntrevistadores(con);
    }
    
    public static ArrayList<Entrevista> getEntrevistas() {
        return EntrevistaIO.getEntrevistas(con);
    }
    
    public static void insertarEntrevista(Entrevista entrevista) {
        EntrevistaIO.insertarEntrevista(entrevista, con);
    }
    
    public static void borrarEntrevista(int idEntrevista) {
        EntrevistaIO.borrarEntrevista(con, idEntrevista);
    }
    
    public static Entrevista getEntrevista(int idEntrevista) {
        return EntrevistaIO.getEntrevista(con, idEntrevista);
    }
    
    public static void modificarEntrevista(Entrevista entrevista) {
        EntrevistaIO.modificarEntrevista(con, entrevista);
    }
    
    public static boolean loginSuccessful(String username, String password) {
        return AdminIO.loginSuccessful(con, username, password);
    }
}
