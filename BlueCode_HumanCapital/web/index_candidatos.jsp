<%-- 
    Document   : index_candidatos
    Created on : Oct 28, 2015, 3:03:43 PM
    Author     : Lalo
--%>

<%@page import="entidades.Candidato"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
                <div class="row col-md-12">
                    <a class="btn btn-success pull-right" href="crear_candidato.jsp">Nuevo candidato</a>
                    <h2>Candidatos</h2>
                </div>
                <table class="table table-responsive table-striped table-hover table-condensed">
                    <thead>
                        <th> Nombre </th>
                        <th> Correo </th>
                        <th> Estado </th>
                        <th> Detalles </th>
                        <th> Eliminar </th>
                    </thead>
                    <tbody>
                        <% ArrayList<Candidato> candidatos = (ArrayList) request.getAttribute("candidatos");
                           for (int i = 0; i < candidatos.size(); i++) { %>
                        <tr>
                            <% Candidato c = candidatos.get(i); %>
                            <td><%= c.getNombres() + " " + c.getApellidos() %></td>
                            <td><%= c.getEmail() %></td>
                            <td><%= c.getEstado() %></td>
                            <td><a class="btn btn-primary" href="CandidatosDetallesServlet?id=<%= c.getId() %>">Detalles</a></td>
                            <td><a class="btn btn-danger" href="CandidatosEliminarServlet?id=<%= c.getId() %>">Eliminar</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    <jsp:include page="scripts.html"></jsp:include>
    </body>
</html>