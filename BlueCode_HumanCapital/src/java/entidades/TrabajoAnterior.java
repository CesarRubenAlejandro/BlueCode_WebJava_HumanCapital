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
public class TrabajoAnterior implements Serializable {
    
    private String trabajoAnterior;
    
    public TrabajoAnterior() {
    }
    
    public TrabajoAnterior(String trabajoAnterior) {
        this.trabajoAnterior = trabajoAnterior;
    }

    public String getTrabajoAnterior() {
        return trabajoAnterior;
    }

    public void setTrabajoAnterior(String trabajoAnterior) {
        this.trabajoAnterior = trabajoAnterior;
    }
    
    
}
