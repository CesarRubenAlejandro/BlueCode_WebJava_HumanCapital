/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import database.DatabaseConnector;
import entidades.Candidato;
import entidades.Entrevista;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lalo
 */
public class EntrevistasServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String url = "/index_entrevistas.jsp";
        if (accion.equals("index")){
            // agregar la lista de entrevistas al request
            request.setAttribute("entrevistas", DatabaseConnector.getEntrevistas());
        } else if (accion.equals("nueva")) {
            url = "/nueva_entrevista.jsp";
            ArrayList<Candidato> candidatos = DatabaseConnector
                    .listaCandidatos(c->c.getEstado() == Candidato.PENDIENTE ||
                            c.getEstado() == Candidato.RECHAZADO);
            request.setAttribute("candidatos", candidatos);
            request.setAttribute("entrevistadores", DatabaseConnector.getEntrevistadores());
        } else if (accion.equals("borrar")) {
            int id = parseInt(request.getParameter("idBorrar"));
            DatabaseConnector.borrarEntrevista(id);
            request.setAttribute("entrevistas", DatabaseConnector.getEntrevistas());
        } else if (accion.equals("verDetalles")) {
            int id = parseInt(request.getParameter("idDetalles"));
            request.setAttribute("entrevista", DatabaseConnector.getEntrevista(id));
            url = "/detalles_entrevista.jsp";
        }
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        
        String candidatoID = request.getParameter("candidato");
        String entrevistadorID = request.getParameter("entrevistador");
        String fechaS = request.getParameter("fecha");
        String plataforma = request.getParameter("plataforma");
        String feedback = request.getParameter("feedback");

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fecha;

        try {
            fecha = (Date) formatter.parse(fechaS);
        } catch (ParseException ex) {
            fecha = new Date();
            Logger.getLogger(EntrevistasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Entrevista entrevista = new Entrevista(fecha, plataforma, feedback,
                    parseInt(entrevistadorID), parseInt(candidatoID));
            
        if (id == null) {
            DatabaseConnector.insertarEntrevista(entrevista);
        } else {
            entrevista.setEntrevistaID(parseInt(id));
            DatabaseConnector.modificarEntrevista(entrevista);
        }
        
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
