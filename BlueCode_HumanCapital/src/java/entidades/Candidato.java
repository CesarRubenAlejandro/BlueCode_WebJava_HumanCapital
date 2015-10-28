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
public class Candidato implements Serializable {
    int id;
    String nombreDePila;
    String apellidos;
    String expectativasEconomicas;
    String direccion;
    String telefono;
    String titulo;
    String email;
    ArrayList<String> certificados;
    ArrayList<String> trabajosAnteriores;

    public Candidato(int id, String nombreDePila, String apellidos, String expectativasEconomicas, String direccion, String telefono, String titulo, String email, ArrayList<String> certificados, ArrayList<String> trabajosAnteriores) {
        this.id = id;
        this.nombreDePila = nombreDePila;
        this.apellidos = apellidos;
        this.expectativasEconomicas = expectativasEconomicas;
        this.direccion = direccion;
        this.telefono = telefono;
        this.titulo = titulo;
        this.email = email;
        this.certificados = certificados;
        this.trabajosAnteriores = trabajosAnteriores;
    }

    public ArrayList<String> getCertificados() {
        return certificados;
    }

    public void setCertificados(ArrayList<String> certificados) {
        this.certificados = certificados;
    }

    public ArrayList<String> getTrabajosAnteriores() {
        return trabajosAnteriores;
    }

    public void setTrabajosAnteriores(ArrayList<String> trabajosAnteriores) {
        this.trabajosAnteriores = trabajosAnteriores;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
