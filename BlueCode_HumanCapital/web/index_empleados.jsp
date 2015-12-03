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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
    </head>
    <body>
        <h2>Empleados</h2>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Appellido</th>
                <th>Puesto</th>
                <th>Salario</th>
                <th>Dias de vacaciones</th>
                <th>Detalles</th>
                <th>Borrar</th>
            </tr>
            <%
                for (Empleado actual: empleados){
                    out.println("<tr>");
                    out.println("<td>" + actual.getNombre() + "</td>");
                    out.println("<td>" + actual.getApellido() + "</td>");
                    out.println("<td>" + actual.getPuesto()+ "</td>");
                    out.println("<td>" + actual.getSalario() + "</td>");
                    out.println("<td>" + actual.getDiasDeVacaciones() + "</td>");
                    out.println("<td><a href=EmpleadosServlet?accion=verDetalles&idDetalles=" + actual.getID() + "> Detalles </a></td>");
                    out.println("<td><a href=EmpleadosServlet?accion=borrar&idBorrar=" + actual.getID() + "> Borrar </a></td>");
                    out.println("</tr>");
                }
            %>
        </table>
    </body>
</html>
