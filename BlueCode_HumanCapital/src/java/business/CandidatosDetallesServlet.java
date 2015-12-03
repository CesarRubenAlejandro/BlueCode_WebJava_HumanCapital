/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import database.DatabaseConnector;
import entidades.Candidato;
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
 * @author Angela Romo
 */
public class CandidatosDetallesServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        if (id != null) {
            int idCand = Integer.parseInt(id);
            Candidato candidato = DatabaseConnector.getCandidato(idCand);
            
            request.setAttribute("candidato", candidato);
            String url = "/detalles_candidato.jsp";
            ServletContext sc = this.getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        } else {
            int idCandidato = Integer.parseInt(request.getParameter("idCandidato"));
            System.out.println("ID: " + idCandidato);
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
            if (estadoString.equals(Candidato.ACEPTADO)) {
                estado = 1;
            } else if (estadoString.equals(Candidato.RECHAZADO)) {
                estado = 2;
            } else if (estadoString.equals(Candidato.PENDIENTE)) {
                estado = 0;
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
            Candidato candidato = new Candidato(idCandidato,nombres, apellidos, 
                    expectativas, direccion, telefono, titulo, universidad, email, estado, cert, trab);
            DatabaseConnector.modificarCandidato(candidato);

            String url = "/index_candidatos.jsp";
            ArrayList<Candidato> candidatos = DatabaseConnector.listaCandidatos(c -> c.getEstado() == Candidato.PENDIENTE || c.getEstado() == Candidato.RECHAZADO);
            request.setAttribute("candidatos", candidatos);
            ServletContext sc = this.getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        }
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
