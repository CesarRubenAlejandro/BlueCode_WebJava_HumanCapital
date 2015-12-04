/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Cesar
 */
public class Reporte implements Serializable{
    private String nombreCandidato;
    private String tituloCandidato;
    private String universidadCandidato;
    private String certificadosCandidato;
    private String tipoCandidato;
    private String nombreEntrevistador;
    private String puestoEntrevistador;

    public Reporte(String nombreCandidato, String tituloCandidato, String universidadCandidato, String certificadosCandidato, String tipoCandidato, String nombreEntrevistador, String puestoEntrevistador) {
        this.nombreCandidato = nombreCandidato;
        this.tituloCandidato = tituloCandidato;
        this.universidadCandidato = universidadCandidato;
        this.certificadosCandidato = certificadosCandidato;
        this.tipoCandidato = tipoCandidato;
        this.nombreEntrevistador = nombreEntrevistador;
        this.puestoEntrevistador = puestoEntrevistador;
    }

    public Reporte() {
    }

    public String getNombreCandidato() {
        return nombreCandidato;
    }

    public void setNombreCandidato(String nombreCandidato) {
        this.nombreCandidato = nombreCandidato;
    }

    public String getTituloCandidato() {
        return tituloCandidato;
    }

    public void setTituloCandidato(String tituloCandidato) {
        this.tituloCandidato = tituloCandidato;
    }

    public String getUniversidadCandidato() {
        return universidadCandidato;
    }

    public void setUniversidadCandidato(String universidadCandidato) {
        this.universidadCandidato = universidadCandidato;
    }

    public String getCertificadosCandidato() {
        return certificadosCandidato;
    }

    public void setCertificadosCandidato(String certificadosCandidato) {
        this.certificadosCandidato = certificadosCandidato;
    }

    public String getTipoCandidato() {
        return tipoCandidato;
    }

    public void setTipoCandidato(String tipoCandidato) {
        this.tipoCandidato = tipoCandidato;
    }

    public String getNombreEntrevistador() {
        return nombreEntrevistador;
    }

    public void setNombreEntrevistador(String nombreEntrevistador) {
        this.nombreEntrevistador = nombreEntrevistador;
    }

    public String getPuestoEntrevistador() {
        return puestoEntrevistador;
    }

    public void setPuestoEntrevistador(String puestoEntrevistador) {
        this.puestoEntrevistador = puestoEntrevistador;
    }
    
    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * titulo con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorTitulo(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getTituloCandidato().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }
    
    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * universidad con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorUniversidad(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getUniversidadCandidato().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }
    
    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * certificados con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorCertificado(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getCertificadosCandidato().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }

    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * nombre entrevistador con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorEntrevistador(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getNombreEntrevistador().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }
    
    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * puesto entrevistador con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorPuesto(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getPuestoEntrevistador().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }
    
    /**
     * Metodo para filtrar una lista de reportes en base a coincidencias de 
     * estado con texto
     * @param reportes
     * @param texto
     * @return 
     */
    public static ArrayList<Reporte> filtraPorEstado(ArrayList<Reporte> reportes, String texto){
        ArrayList<Reporte> aux = new ArrayList<Reporte>();
        for (int i=0; i<reportes.size();i++){
            if (reportes.get(i).getTipoCandidato().toLowerCase().contains(texto.toLowerCase())){
                aux.add(reportes.get(i));
            }
        }
        return aux;
    }
    
}
