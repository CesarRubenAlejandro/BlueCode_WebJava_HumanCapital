<%-- 
    Document   : nueva_entrevista
    Created on : Dec 3, 2015, 5:27:30 AM
    Author     : Lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Candidato"%>
<%@page import="entidades.Empleado"%>
<%@page import="java.util.ArrayList"%>

<%
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
            <h2>Nueva Entrevista</h2>
            <form class="form-horizontal col-md-9" action="EntrevistasServlet?accion=index" method="post">
                
                <div class="form-group">
                    <label for="candidato" class="col-sm-2 control-label">Candidato</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="candidato" required="required">
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
                        <select class="form-control" name="entrevistador" required="required">
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
                        <input class="form-control datepicker" type="text" name="fecha" required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="plataforma" class="col-sm-2 control-label">Plataforma</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="plataforma" required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="feedback" class="col-sm-2 control-label">Feedback</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="feedback" required="required"></textarea>
                    </div>
                </div>
                
                <div class="form-group">
                    <input class="btn btn-success col-sm-2" type="submit" value="Guardar">
                </div>
            </form>
            </div>
        </div>
        <jsp:include page="scripts.html"></jsp:include>
        <script>
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy'
            });
        </script>
    </body>
</html>
