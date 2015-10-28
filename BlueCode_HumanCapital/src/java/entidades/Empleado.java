/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;

/**
 *
 * @author Ricky
 */
public class Empleado implements Serializable {
    private int ID;
    private String puesto;
    private double salario;
    private int diasDeVacaciones;

    public Empleado(int ID, String puesto, double salario, int diasDeVacaciones) {
        this.ID = ID;
        this.puesto = puesto;
        this.salario = salario;
        this.diasDeVacaciones = diasDeVacaciones;
    }

    public Empleado(String puesto, double salario, int diasDeVacaciones) {
        this.puesto = puesto;
        this.salario = salario;
        this.diasDeVacaciones = diasDeVacaciones;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public int getDiasDeVacaciones() {
        return diasDeVacaciones;
    }

    public void setDiasDeVacaciones(int diasDeVacaciones) {
        this.diasDeVacaciones = diasDeVacaciones;
    }
    
    
}
