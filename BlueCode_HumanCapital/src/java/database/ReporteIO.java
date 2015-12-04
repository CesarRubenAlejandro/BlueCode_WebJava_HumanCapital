/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entidades.Candidato;
import entidades.Reporte;
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
public class ReporteIO {
    /**
     * Metodo para llenar una lista de reportes con todos los datos 
     * de las entrevistas
     * @param con
     * @return 
     */
    public static ArrayList<Reporte> getReportes(Connection con){
        ArrayList<Reporte> reportes = new ArrayList<Reporte>();
        Statement stmtEntrevistas;
        try {
            stmtEntrevistas = con.createStatement();
            ResultSet rsEntrevistas = stmtEntrevistas.executeQuery("SELECT * FROM entrevistas");
            // para cada entrevista, se crea un objeto de tipo Reporte
            while (rsEntrevistas.next()){
                Reporte reporteActual = new Reporte();
                // obtener llaves foraneas
                int candidatoId= rsEntrevistas.getInt("candidatoID");
                int empleadoId = rsEntrevistas.getInt("entrevistadorID");
                // obtener y guardar informacion de candidato
                Candidato auxCandidato = CandidatoIO.getCandidato(candidatoId, con);
                reporteActual.setNombreCandidato(auxCandidato.getNombres()+" " + auxCandidato.getApellidos());
                switch(auxCandidato.getEstado()){
                    case 0:
                        reporteActual.setTipoCandidato("Pendiente");
                        break;
                    case 1:
                        reporteActual.setTipoCandidato("Aceptado");
                        break;
                    case 2:
                        reporteActual.setTipoCandidato("Rechazado");
                        break;
                }
                reporteActual.setUniversidadCandidato(auxCandidato.getUniversidad());
                reporteActual.setTituloCandidato(auxCandidato.getTitulo());
                if (auxCandidato.getCertificados().isEmpty()){
                    reporteActual.setCertificadosCandidato("-");
                } else {
                    String certificados = "";
                    for (int i =0; i< auxCandidato.getCertificados().size(); i++){
                        String cert = auxCandidato.getCertificados().get(i);
                        certificados += (i==auxCandidato.getCertificados().size()-1? cert: " " + cert + ", ");
                    }
                    reporteActual.setCertificadosCandidato(certificados);
                }
                // obtener y guardar informacion de empleado
                Statement stmtEmpleado = con.createStatement();
                ResultSet rsEmpleados = stmtEmpleado.executeQuery("SELECT c.nombres, c.apellidos, e.puesto "
                        + "FROM candidatos c, empleados e "
                        + "WHERE c.ID = e.ID AND c.ID = " + empleadoId);
                if (rsEmpleados.next()){
                    reporteActual.setNombreEntrevistador(rsEmpleados.getString(1) + " " + rsEmpleados.getString(2));
                    reporteActual.setPuestoEntrevistador(rsEmpleados.getString(3));
                }
                reportes.add(reporteActual);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReporteIO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return reportes;
    }
    
}
