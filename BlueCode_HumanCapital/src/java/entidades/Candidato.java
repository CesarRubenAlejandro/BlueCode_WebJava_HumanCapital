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
public class Candidato implements Serializable {
    
    public static final int PENDIENTE = 0;
    public static final int ACEPTADO = 1;
    public static final int RECHAZADO = 2;
    
    private int id;
    private String nombreDePila;
    private String apellidos;
    private String expectativasEconomicas;
    private String direccion;
    private String telefono;
    private String titulo;
    private String universidad;
    private String email;
    private int estado;

    public Candidato(int id, String nombreDePila, String apellidos, String expectativasEconomicas, String direccion, String telefono, String titulo, String universidad, String email, int estado) {
        this.id = id;
        this.nombreDePila = nombreDePila;
        this.apellidos = apellidos;
        this.expectativasEconomicas = expectativasEconomicas;
        this.direccion = direccion;
        this.telefono = telefono;
        this.titulo = titulo;
        this.universidad = universidad;
        this.email = email;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreDePila() {
        return nombreDePila;
    }

    public void setNombreDePila(String nombreDePila) {
        this.nombreDePila = nombreDePila;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getExpectativasEconomicas() {
        return expectativasEconomicas;
    }

    public void setExpectativasEconomicas(String expectativasEconomicas) {
        this.expectativasEconomicas = expectativasEconomicas;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
