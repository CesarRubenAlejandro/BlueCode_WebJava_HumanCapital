<%-- 
    Document   : index_entrevistas
    Created on : Dec 3, 2015, 2:33:32 AM
    Author     : Lalo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Entrevista"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%
  ArrayList<Entrevista> entrevistas = (ArrayList) request.getAttribute("entrevistas");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
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
                    <%  DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                        for (Entrevista actual: entrevistas){
                            String fecha = df.format(actual.getFecha());
                            out.println("<tr>");
                            out.println("<td>" + actual.getCandidato().getNombres() + "</td>");
                            out.println("<td>" + actual.getEntrevistador().getNombre() + "</td>");
                            out.println("<td>" + fecha+ "</td>");
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
