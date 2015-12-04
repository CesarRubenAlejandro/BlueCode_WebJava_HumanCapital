/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import database.DatabaseConnector;
import entidades.Candidato;
import entidades.Empleado;
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
public class EmpleadosServlet extends HttpServlet {

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
        System.out.println("Accion en Servlet "+ accion);
        
        String url = "/index_empleados.jsp";
        if (accion.equals("cargar")){
            // agregar la lista de empleados al request
            request.setAttribute("empleados", DatabaseConnector.getEmpleados());
        } else if (accion.equals("borrar")){
            // obtener el id y borrar el empleado
            int idEmpleado = Integer.parseInt(request.getParameter("idBorrar"));
            DatabaseConnector.borrarEmpleado(idEmpleado);
            // agregar la lista actualizada al request
            request.setAttribute("empleados", DatabaseConnector.getEmpleados());
        } else if (accion.equals("nuevoEmpleado")){
            url = "/crear_empleado.jsp";
            ArrayList<Candidato> candidatos = DatabaseConnector.listaCandidatosPreEmpleados(c->c.getEstado() == Candidato.ACEPTADO);
            request.setAttribute("candidatos", candidatos);
        } else if (accion.equals("guardarNuevo")) {
            Empleado empleado = new Empleado();
            empleado.setID(Integer.parseInt(request.getParameter("candidato")));
            empleado.setPuesto(request.getParameter("puesto"));
            empleado.setSalario(Double.parseDouble(request.getParameter("salario")));
            empleado.setDiasDeVacaciones(Integer.parseInt(request.getParameter("vacaciones")));
            empleado.setEsEntrevistador(request.getParameter("esEntrevistador")!= null);
            DatabaseConnector.guardarEmpleado(empleado);
            // agregar la lista actualizada al request
            request.setAttribute("empleados", DatabaseConnector.getEmpleados());
        } else if (accion.equals("verDetalles")){
            String id = request.getParameter("idDetalles");
            if (id != null) {
                int idEmp = Integer.parseInt(id);
                Empleado empleado = DatabaseConnector.getEmpleado(idEmp);
                request.setAttribute("empleado", empleado);
                url = "/detalles_empleado.jsp";
            }
        } else if (accion.equals("guardarCambios")) {
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            String puesto = request.getParameter("puesto");
            String salarioStr = request.getParameter("salario");
             double salario = Double.parseDouble(salarioStr);
            String vacacionesStr = request.getParameter("vacaciones");
             int vacaciones = Integer.parseInt(vacacionesStr);
            Boolean esEntrevistador = request.getParameter("esEntrevistador")!= null;
            
            Empleado empleado = new Empleado(idEmpleado, puesto, salario,
                    vacaciones, esEntrevistador, null, null);
            DatabaseConnector.modificarEmpleado(empleado);
            // agregar la lista actualizada al request
            request.setAttribute("empleados", DatabaseConnector.getEmpleados());
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
