/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Ricky
 */
public class AdminIO {
    
    public static boolean loginSuccessful(Connection con, String username, String password) {
        boolean success;
        try {
            
            PreparedStatement stmtAdmin = con.prepareStatement("SELECT * FROM usuarioadmin WHERE username = ? AND password = ?");
            stmtAdmin.setString(1, username);
            stmtAdmin.setString(2, password);
            ResultSet rs = stmtAdmin.executeQuery();
            success = rs.next();
            System.out.println("Termina bien");
        } catch (SQLException sql) {
            System.out.println("excepcion");
            success = false;
        }
        return success;
    }
    
}
