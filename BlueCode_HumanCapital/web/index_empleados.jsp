<%-- 
    Document   : index_empleados
    Created on : Dec 2, 2015, 11:20:00 PM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Empleado"%>
<%@page import="java.util.ArrayList"%>
<%
  ArrayList<Empleado> empleados = (ArrayList) request.getAttribute("empleados");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
                <div class="row col-md-12">
                    <a class="btn btn-success pull-right" href="EmpleadosServlet?accion=nuevoEmpleado">Nuevo empleado</a>
                    <h2>Empleados</h2>
                </div>
                <table class="table table-responsive table-striped table-hover table-condensed">
                    <thead>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Puesto</th>
                        <th>Salario</th>
                        <th>Dias de vacaciones</th>
                        <th>Detalles</th>
                        <th>Borrar</th>
                    </thead>
                    <tbody>
                    <%
                        for (Empleado actual: empleados){
                            out.println("<tr>");
                            out.println("<td>" + actual.getNombre() + "</td>");
                            out.println("<td>" + actual.getApellido() + "</td>");
                            out.println("<td>" + actual.getPuesto()+ "</td>");
                            out.println("<td>" + actual.getSalario() + "</td>");
                            out.println("<td>" + actual.getDiasDeVacaciones() + "</td>");
                            out.println("<td><a class='btn btn-primary' href=EmpleadosServlet?accion=verDetalles&idDetalles=" + actual.getID() + "> Detalles </a></td>");
                            out.println("<td><a class='btn btn-danger' href=EmpleadosServlet?accion=borrar&idBorrar=" + actual.getID() + "> Borrar </a></td>");
                            out.println("</tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        <jsp:include page="scripts.html"></jsp:include>             
    </body>
</html>
