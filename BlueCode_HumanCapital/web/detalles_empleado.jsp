<%-- 
    Document   : detalles_empleado
    Created on : 3/12/2015, 04:09:36 PM
    Author     : Angela Romo
--%>

<%@page import="entidades.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Candidato"%>
<%
    Empleado empleado = (Empleado) request.getAttribute("empleado");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <jsp:include page="sidebar.html"></jsp:include>
            <div id="page-content-wrapper">
            <h1>Detalles de <%=empleado.getNombre()%> <%=empleado.getApellido()%> </h1>
            <form class="form-horizontal col-md-9" action="EmpleadosServlet">
                <input type="hidden" name="accion" value="guardarCambios">
                <input type="hidden" name="idEmpleado" value="<%=empleado.getID()%>">
               
                <div class="form-group">
                    <label for="puesto" class="col-sm-2 control-label">Puesto</label>
                    <div class="col-sm-10">
                        <input class="inputFields form-control" type="text" name="puesto" value="<%=empleado.getPuesto()%>" readonly>
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="salario" class="col-sm-2 control-label">Salario</label>
                    <div class="col-sm-10">
                        <input class="inputFields form-control" type="number" name="salario" step="0.01" min="0" value="<%=empleado.getSalario()%>" readonly>
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="vacaciones" class="col-sm-2 control-label">Dias de vacaciones</label>
                    <div class="col-sm-10">
                        <input class="inputFields form-control" type="number" name="vacaciones" value="<%=empleado.getDiasDeVacaciones()%>" readonly>
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="esEntrevistador" class="col-sm-2 control-label">¿Entrevistador?</label>
                    <div class="col-sm-1">
                        <input id="esEntrevistador" class="form-control" type="checkbox" name="esEntrevistador" style="width: 25px; height: 25px;" disabled> 
                    </div>
                </div>        
                
                <button class="btn btn-success" type="button" id="EditarBtn" onclick="hacerEditable()">Editar</button>
                <input class="btn btn-success" type="submit" id="GuardarBtn" value="Guardar cambios" disabled>
            </form>
            </div>
        </div>
        <jsp:include page="scripts.html"></jsp:include>
        <script>
            var value = "<%=empleado.isEsEntrevistador()%>";
            document.getElementById("esEntrevistador").checked = value;
            
            function hacerEditable() {
                var inputs = document.getElementsByClassName("inputFields");
                for (i = 0; i < inputs.length; i++) {
                    inputs[i].readOnly = false;
                }
                document.getElementById("esEntrevistador").disabled = false;
                document.getElementById("GuardarBtn").disabled = false;
                document.getElementById("EditarBtn").disabled = true;
            }
        </script>
        
    </body>
</html>