<%-- 
    Document   : crear_empleado
    Created on : 3/12/2015, 11:59:03 AM
    Author     : Angela Romo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Candidato"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
            <h1>Nuevo Empleado</h1>
            <form class="form-horizontal col-md-9" action="EmpleadosServlet">
                <input type="hidden" name="accion" value="guardarNuevo">
                <div class="form-group">
                    <label for="candidato" class="col-sm-2 control-label">Candidato</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="candidato">
                            <% ArrayList<Candidato> candidatos = (ArrayList) request.getAttribute("candidatos");
                            for (int i = 0; i < candidatos.size(); i++) { 
                             Candidato c = candidatos.get(i); %>
                                <option value="<%=c.getId()%>"><%= c.getNombres() + " " + c.getApellidos() %></option>
                            <% }%>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="puesto" class="col-sm-2 control-label">Puesto</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="puesto">
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="salario" class="col-sm-2 control-label">Salario</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="number" name="salario">
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="vacaciones" class="col-sm-2 control-label">Dias de vacaciones</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="number" name="vacaciones">
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="esEntrevistador" class="col-sm-2 control-label">¿Entrevistador?</label>
                    <div class="col-sm-1">
                        <input class="form-control" type="checkbox" name="esEntrevistador" value="1" style="width: 25px; height: 25px;"> 
                    </div>
                </div>        
                <input class="btn btn-success" type="submit" value="Guardar">
            </form>
            </div>
        </div>
        <jsp:include page="scripts.html"></jsp:include>
    </body>
</html>
