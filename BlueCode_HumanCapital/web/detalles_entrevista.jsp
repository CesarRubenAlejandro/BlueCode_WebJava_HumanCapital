<%-- 
    Document   : nueva_entrevista
    Created on : Dec 3, 2015, 5:27:30 AM
    Author     : Lalo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Entrevista"%>
<%@page import="entidades.Candidato"%>
<%@page import="entidades.Empleado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%
  Entrevista entrevista = (Entrevista) request.getAttribute("entrevista");
  ArrayList<Candidato> candidatos = (ArrayList) request.getAttribute("candidatos");
  ArrayList<Empleado> entrevistadores = (ArrayList) request.getAttribute("entrevistadores");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
            <h2>Detalles Entrevista</h2>
            <form class="form-horizontal col-md-9" action="EntrevistasServlet?accion=index" method="post">
                
                <div class="form-group">
                    <label for="candidato" class="col-sm-2 control-label">Candidato</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" value="<%= entrevista.getCandidato().getNombres() %>" readonly>
                        <input class="form-control" type="hidden" name="candidato" value="<%= entrevista.getCandidatoID() %>">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="entrevistador" class="col-sm-2 control-label">Entrevistador</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" value="<%= entrevista.getEntrevistador().getNombre() %>" readonly>
                        <input class="form-control" type="hidden" name="entrevistador" value="<%= entrevista.getEntrevistadorID() %>">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="fecha" class="col-sm-2 control-label">Fecha</label>
                    <div class="col-sm-10">
                        <% DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                           String fecha = df.format(entrevista.getFecha()); %>
                        <input class="form-control datepicker editable" type="text" name="fecha" value="<%= fecha %>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="plataforma" class="col-sm-2 control-label">Plataforma</label>
                    <div class="col-sm-10">
                        <input class="form-control editable" type="text" name="plataforma" value="<%= entrevista.getPlataforma() %>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="feedback" class="col-sm-2 control-label">Feedback</label>
                    <div class="col-sm-10">
                        <textarea class="form-control editable" name="feedback" readonly required="required"><%= entrevista.getFeedback() %></textarea>
                    </div>
                </div>
                    
               <input type="hidden" name="id" value="<%= entrevista.getEntrevistaID() %>">
                
                <div class="form-group">
                    <button type="button" class="btn btn-warning col-sm-2" id="edit-btn" onclick="hacerEditable()">Editar</button>
                    <input class="btn btn-success col-sm-2" type="submit" id="update-btn" value="Actualizar" disabled>
                </div>
            </form>
            </div>
        </div>
        <script>
            function hacerEditable() {
                var inputs = document.getElementsByClassName("editable");
                for (i = 0; i < inputs.length; i++) {
                    inputs[i].readOnly = false;
                }
                document.getElementById("update-btn").disabled = false;
                document.getElementById("edit-btn").disabled = true;
            }
        </script>
        <jsp:include page="scripts.html"></jsp:include>
        <script>
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy'
            });
        </script>
    </body>
</html>
