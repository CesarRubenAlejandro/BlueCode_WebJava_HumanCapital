/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.Date;

/**
 *
 * @author Lalo
 */
public class Entrevista {
    private int entrevistadorID;
    private int candidatoID;
    private Date fecha;
    private String plataforma;
    private String feedback;
    
    private Empleado entrevistador;
    private Candidato candidato;
    
    private String ID;

    public Entrevista() {
    }
    
    public Entrevista(Date fecha, String plataforma, String feedback, Empleado entrevistador, Candidato candidato) {
        this.fecha = fecha;
        this.plataforma = plataforma;
        this.feedback = feedback;
        this.entrevistador = entrevistador;
        this.candidato = candidato;
        this.candidatoID = candidato.getId();
        this.entrevistadorID = entrevistador.getID();
        this.ID = "" + this.candidatoID + this.entrevistadorID + this.fecha;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Empleado getEntrevistador() {
        return entrevistador;
    }

    public void setEntrevistador(Empleado entrevistador) {
        this.entrevistador = entrevistador;
    }

    public Candidato getCandidato() {
        return candidato;
    }

    public void setCandidato(Candidato candidato) {
        this.candidato = candidato;
    }

    public int getEntrevistadorID() {
        return entrevistadorID;
    }

    public void setEntrevistadorID(int entrevistadorID) {
        this.entrevistadorID = entrevistadorID;
    }

    public int getCandidatoID() {
        return candidatoID;
    }

    public void setCandidatoID(int candidatoID) {
        this.candidatoID = candidatoID;
    }
    
    public void setID() {
        this.ID = "" + this.candidatoID + this.entrevistadorID + this.fecha;
    }
    
    public String getID() {
        return this.ID;
    }
}
