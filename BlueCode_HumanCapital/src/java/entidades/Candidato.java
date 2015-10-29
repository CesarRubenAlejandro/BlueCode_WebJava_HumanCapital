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
    
    public static final int PENDIENTE = 0;
    public static final int ACEPTADO = 1;
    public static final int RECHAZADO = 2;
    
    private int id;
    private String nombres;
    private String apellidos;
    private String expectativas;
    private String direccion;
    private String telefono;
    private String email;
    private int estado;
    private Titulo titulo;
    private ArrayList<String> certificados;
    private ArrayList<String> trabajosAnteriores;

    public ArrayList<String> getCertificados() {
        return certificados;
    }

    public void setCertificados(ArrayList<String> certificados) {
        this.certificados = certificados;
    }

    public ArrayList<String> getTrabajosAnteriores() {
        return trabajosAnteriores;
    }

    public Candidato() {
    }

    public void setTrabajosAnteriores(ArrayList<String> trabajosAnteriores) {
        this.trabajosAnteriores = trabajosAnteriores;
    }

    public Candidato(int id, String nombres, String apellidos, String expectativas, String direccion, String telefono, Titulo titulo, String universidad, String email, int estado) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.expectativas = expectativas;
        this.direccion = direccion;
        this.telefono = telefono;
        this.titulo = titulo;
        this.email = email;
        this.estado = estado;
    }
    
    public Candidato(String nombres, String apellidos, String expectativas, String direccion, String telefono, Titulo titulo, String universidad, String email, int estado) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.expectativas = expectativas;
        this.direccion = direccion;
        this.telefono = telefono;
        this.titulo = titulo;
        this.email = email;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getExpectativas() {
        return expectativas;
    }

    public void setExpectativas(String expectativas) {
        this.expectativas = expectativas;
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

    public Titulo getTitulo() {
        return titulo;
    }

    public void setTitulo(Titulo titulo) {
        this.titulo = titulo;
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
