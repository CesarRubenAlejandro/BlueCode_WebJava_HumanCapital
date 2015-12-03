<%-- 
    Document   : nueva_entrevista
    Created on : Dec 3, 2015, 5:27:30 AM
    Author     : Lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Entrevista"%>
<%@page import="entidades.Candidato"%>
<%@page import="entidades.Empleado"%>
<%@page import="java.util.ArrayList"%>

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
            <jsp:include page="sidebar.html"></jsp:include>
            <div id="page-content-wrapper">
            <h2>Detalles Entrevista</h2>
            <form class="form-horizontal col-md-9" action="EntrevistasServlet?accion=index" method="post">
                
                <div class="form-group">
                    <label for="candidato" class="col-sm-2 control-label">Candidato</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="candidato" id="select-candidato" disabled>
                        <%
                            for (Candidato can : candidatos) {
                        %>
                            <option value="<%= can.getId() %>"><%= can.getNombres() %></option>
                        <%
                            }
                        %>
                        </select> 
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="entrevistador" class="col-sm-2 control-label">Entrevistador</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="entrevistador" id="select-entrevistador" disabled>
                        <%
                            for (Empleado ent : entrevistadores) {
                        %>
                            <option value="<%= ent.getID() %>"><%= ent.getNombre() %></option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="fecha" class="col-sm-2 control-label">Fecha</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="fecha" value="<%= entrevista.getFecha() %>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="plataforma" class="col-sm-2 control-label">Plataforma</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="plataforma" value="<%= entrevista.getPlataforma() %>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="feedback" class="col-sm-2 control-label">Feedback</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="feedback" readonly><%= entrevista.getFeedback() %></textarea>
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
                var inputs = document.getElementsByClassName("form-control");
                for (i = 0; i < inputs.length; i++) {
                    inputs[i].readOnly = false;
                }
                document.getElementById("select-candidato").disabled = false;
                document.getElementById("select-entrevistador").disabled = false;
                document.getElementById("update-btn").disabled = false;
                document.getElementById("edit-btn").disabled = true;
            }
        </script>
        <jsp:include page="scripts.html"></jsp:include>
    </body>
</html>