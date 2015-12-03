<%-- 
    Document   : index_entrevistas
    Created on : Dec 3, 2015, 2:33:32 AM
    Author     : Lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Entrevista"%>
<%@page import="java.util.ArrayList"%>
<%
  ArrayList<Entrevista> entrevistas = (ArrayList) request.getAttribute("entrevistas");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <jsp:include page="sidebar.html"></jsp:include>
            <div id="page-content-wrapper">
                <a class="btn btn-success pull-right" href="EntrevistasServlet?accion=nueva">Nueva Entrevista</a>
                <h2>Entrevistas</h2>
                <table class="table table-responsive table-striped">
                    <thead>
                        <tr>
                            <th>Candidato</th>
                            <th>Entrevistador</th>
                            <th>Fecha</th>
                            <th>Detalles</th>
                            <th>Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Entrevista actual: entrevistas){
                            out.println("<tr>");
                            out.println("<td>" + actual.getCandidato().getNombres() + "</td>");
                            out.println("<td>" + actual.getEntrevistador().getNombre() + "</td>");
                            out.println("<td>" + actual.getFecha()+ "</td>");
                            out.println("<td><a class='btn btn-primary' href=EntrevistasServlet?accion=verDetalles&idDetalles=" + actual.getEntrevistaID() + "> Detalles </a></td>");
                            out.println("<td><a class='btn btn-danger' href=EntrevistasServlet?accion=borrar&idBorrar=" + actual.getEntrevistaID() + "> Borrar </a></td>");
                            out.println("</tr>");
                        }
                    %>
                    <tbody>
                </table>
            </div>
        </div>
    </body>
</html>
