/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import entidades.Candidato;
import database.DatabaseConnector;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricky
 */
public class CrearCandidatoServlet extends HttpServlet {

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

        String url = "/index_candidatos.jsp";

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String expectativas = request.getParameter("expectativas");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String titulo = request.getParameter("titulo");
        String universidad = request.getParameter("universidad");
        String email = request.getParameter("email");

        String estadoString = request.getParameter("estado");
        int estado = 0;
        if (estadoString.equals("aceptado")) {
            estado = Candidato.ACEPTADO;
        } else if (estadoString.equals("rechazado")) {
            estado = Candidato.RECHAZADO;
        } else if (estadoString.equals("pendiente")) {
            estado = Candidato.PENDIENTE;
        }
        String[] certificados = request.getParameterValues("certificados");
        ArrayList<String> cert = new ArrayList<String>();
        for (int i = 0; i < certificados.length; i++) {
            cert.add(certificados[i]);
        }

        String[] trabajos = request.getParameterValues("trabajos");
        ArrayList<String> trab = new ArrayList<String>();
        for (int i = 0; i < trabajos.length; i++) {
            trab.add(trabajos[i]);
        }

        Candidato candidato = new Candidato(nombres, apellidos, expectativas, direccion, telefono, titulo, universidad, email, estado, cert, trab);
        DatabaseConnector.insertarCandidato(candidato);
      
        ArrayList<Candidato> candidatos = DatabaseConnector.listaCandidatos(c->c.getEstado() == Candidato.PENDIENTE || c.getEstado() == Candidato.RECHAZADO);
        request.setAttribute("candidatos", candidatos);
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
