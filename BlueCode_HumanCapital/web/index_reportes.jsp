<%-- 
    Document   : reporte
    Created on : 2/12/2015, 09:10:51 PM
    Author     : Ricky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Reporte"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <%
        ArrayList<Reporte> reportes = (ArrayList) request.getAttribute("reportes");
    %>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <jsp:include page="sidebar.html"></jsp:include>
            <table id="tablaReportes" class="table table-responsive table-striped table-hover table-condensed">
                <thead>
                    <th>Nombre</th>
                    <th>Titulo</th>
                    <th>Universidad</th>
                    <th>Certificados</th>
                    <th>Estado</th>
                    <th>Entrevistador</th>
                    <th>Puesto</th>
                </thead>
                <tbody>
                <% 
                        for (int i = 0; i < reportes.size(); i++) { %>
                        <tr>
                            <% Reporte r = reportes.get(i); %>
                            <td><%= r.getNombreCandidato() %></td>
                            <td><%= r.getTituloCandidato() %></td>
                            <td><%= r.getUniversidadCandidato() %></td>
                            <td><%= r.getCertificadosCandidato() %></td>
                            <td><%= r.getTipoCandidato() %></td>
                            <td><%= r.getNombreEntrevistador() %></td>
                            <td><%= r.getPuestoEntrevistador()%></td>
                        </tr>
                        <% } %>
                </tbody>
            </table>
        </div>
        <jsp:include page="scripts.html"></jsp:include>
    </body>
</html> 
