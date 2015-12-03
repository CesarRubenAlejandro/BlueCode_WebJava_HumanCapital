/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;

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
    
    
    
}
