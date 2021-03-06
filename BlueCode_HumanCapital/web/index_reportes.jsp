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
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
            <div class="row col-md-12">
                <h2>Reportes</h2>
            </div>
            <div class="col-md-12 form-group">
                <label for="columna" class="col-sm-1 col-sm-offset-6 control-label">Filtar por</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="columna" id="columna">
                            <option value="titulo">Titulo</option>
                            <option value="universidad">Universidad</option>
                            <option value="certificados">Certificado</option>
                            <option value="entrevistador">Entrevistador</option>
                            <option value="puesto">Puesto</option>
                            <option value="tipo">Estado</option>
                        </select>
                    </div>
                <div class="col-sm-offset-9">
                    <input id ="searchBox" class="form-control" type="text" name="search" onkeyup="filtra()">
                </div>
            </div>
            
            
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
        </div>
                
        <jsp:include page="scripts.html"></jsp:include>
        <script>
            var req;
            function filtra(){
                var texto = document.getElementById("searchBox").value;
                var selectColumna = document.getElementById("columna");
                var columna = selectColumna.options[selectColumna.selectedIndex].value;
                
                req = new XMLHttpRequest();
                req.onload= llenar;
                var url="ReporteServlet?accion=filtra&text="+texto+"&col="+columna;
                
                req.open("GET",url ,true);
                req.onreadystatechange=llenar;
                
                req.send(null);
            }
            function llenar(){
                document.getElementById("tablaReportes").innerHTML= req.responseText;
            }
        </script>
    </body>
</html> 
