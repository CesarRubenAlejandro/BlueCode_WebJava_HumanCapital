/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entidades.Empleado;
import java.sql.Connection;
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
public class EmpleadoIO {
    /**
     * Metodo para obtener una lista de todos los empleados
     * @param con
     * @return 
     */
    public static ArrayList<Empleado> getEmpleados(Connection con){
        ArrayList<Empleado> empleados = new ArrayList<Empleado>();
        Statement stmtEmpleados;
        try {
            stmtEmpleados = con.createStatement();
            ResultSet rsEmpleados = stmtEmpleados.executeQuery("SELECT * FROM empleados");
            while (rsEmpleados.next()){
                // agregar informacion de empleado
                Empleado auxEmpleado = new Empleado();
                auxEmpleado.setID(rsEmpleados.getInt("ID"));
                auxEmpleado.setSalario(rsEmpleados.getDouble("salario"));
                auxEmpleado.setPuesto(rsEmpleados.getString("puesto"));
                auxEmpleado.setDiasDeVacaciones(rsEmpleados.getInt("diasDeVacaciones"));
                // agregar nombre y apellidos desde candidato
                Statement stmtNombres = con.createStatement();
                ResultSet rsCandidato = stmtNombres.executeQuery("SELECT nombres, apellidos "
                        + "FROM candidatos "
                        + "WHERE ID = " + auxEmpleado.getID());
                if (rsCandidato.next()){
                    auxEmpleado.setNombre(rsCandidato.getString(1));
                    auxEmpleado.setApellido(rsCandidato.getString(2));
                }
                empleados.add(auxEmpleado);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empleados;
    }
    
    /**
     * Metodo para borrar un empleado de la base de datos
     * @param con
     * @param idEmpleado 
     */
    public static void borrarEmpleado(Connection con, int idEmpleado){
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM empleados WHERE ID = " + idEmpleado);
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Metodo para obtener un empleado
     * @param con
     * @param idEmpleado 
     */
    public static Empleado getEmpleado(Connection con, int idEmpleado) {
        Statement stmtEmpleado;
        try {
            stmtEmpleado = con.createStatement();
            ResultSet rsEmpleado = stmtEmpleado.executeQuery("SELECT * FROM empleados WHERE ID = "
                    + idEmpleado);
            if (rsEmpleado.next()){
                // agregar informacion de empleado
                Empleado auxEmpleado = new Empleado();
                auxEmpleado.setID(rsEmpleado.getInt("ID"));
                auxEmpleado.setSalario(rsEmpleado.getDouble("salario"));
                auxEmpleado.setPuesto(rsEmpleado.getString("puesto"));
                auxEmpleado.setDiasDeVacaciones(rsEmpleado.getInt("diasDeVacaciones"));
                // agregar nombre y apellidos desde candidato
                Statement stmtNombre = con.createStatement();
                ResultSet rsCandidato = stmtNombre.executeQuery("SELECT nombres, apellidos "
                        + "FROM candidatos "
                        + "WHERE ID = " + auxEmpleado.getID());
                if (rsCandidato.next()){
                    auxEmpleado.setNombre(rsCandidato.getString(1));
                    auxEmpleado.setApellido(rsCandidato.getString(2));
                }
                return auxEmpleado;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
