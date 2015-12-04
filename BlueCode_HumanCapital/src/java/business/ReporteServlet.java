/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import database.DatabaseConnector;
import entidades.Reporte;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cesar
 */
public class ReporteServlet extends HttpServlet {

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
        String url="/index_reportes.jsp";
        if (accion.equals("index")){
            // cargar lista de reportes
            ArrayList<Reporte> reportes = DatabaseConnector.getReportes();
            // redireccionar
            request.setAttribute("reportes", reportes);
            ServletContext sc = this.getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if(accion.equals("filtra")){
           String texto = request.getParameter("text");
            String columna = request.getParameter("col");
            ArrayList<Reporte> reportes = DatabaseConnector.getReportes();
            // filtrar lista de reportes dependiendo de la columna
            switch(columna){
                case "titulo":
                    reportes = Reporte.filtraPorTitulo(reportes, texto);
                    break;
                case "universidad":
                    reportes = Reporte.filtraPorUniversidad(reportes, texto);
                    break;
                case "certificados":
                    reportes = Reporte.filtraPorCertificado(reportes, texto);
                    break;
                case "entrevistador":
                    reportes = Reporte.filtraPorEntrevistador(reportes, texto);
                    break;
                case "puesto":
                    reportes = Reporte.filtraPorPuesto(reportes, texto);
                    break;
                case "tipo":
                    reportes = Reporte.filtraPorEstado(reportes, texto);
                    break;
            }
            // imprime contenido de la tabla
            response.setContentType("text/plain");
            response.getWriter().println("<thead>" + "<th>Nombre</th>" + "<th>Titulo</th>" 
                    +"<th>Universidad</th>" +"<th>Certificados</th>" + "<th>Estado</th>" 
                    + "<th>Entrevistador</th>" + "<th>Puesto</th>" +"</thead>");
            for (Reporte actual:reportes){
                response.getWriter().println("<tr>");
                response.getWriter().println("<td>"+ actual.getNombreCandidato() + "</td>");
                response.getWriter().println("<td>"+ actual.getTituloCandidato() + "</td>");
                response.getWriter().println("<td>"+ actual.getUniversidadCandidato() + "</td>");
                response.getWriter().println("<td>"+ actual.getCertificadosCandidato() + "</td>");
                response.getWriter().println("<td>"+ actual.getTipoCandidato() + "</td>");
                response.getWriter().println("<td>"+ actual.getNombreEntrevistador() + "</td>");
                response.getWriter().println("<td>"+ actual.getPuestoEntrevistador() + "</td>");
                response.getWriter().println("</tr>");
            }
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
