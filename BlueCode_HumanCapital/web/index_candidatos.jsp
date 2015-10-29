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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidatos</title>
    </head>
    <body>
        <h1>Candidatos</h1>
        
        <table>
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
                    <td><a href="CandidatosDetallesServlet?id=<%= c.getId() %>"></a></td>
                    <td><a href="CandidatosEliminarServlet?id=<%= c.getId() %>"></a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
