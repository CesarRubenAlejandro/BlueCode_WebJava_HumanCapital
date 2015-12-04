<%-- 
    Document   : detalles_empleado
    Created on : 3/12/2015, 04:09:36 PM
    Author     : Angela Romo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Empleado"%>
<%@page import="entidades.Candidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Candidato"%>
<%
    Empleado empleado = (Empleado) request.getAttribute("empleado");
    Candidato candidato = (Candidato) request.getAttribute("candidato");

    ArrayList<String> certificados = candidato.getCertificados();
    ArrayList<String> trabajosAnt = candidato.getTrabajosAnteriores();

%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
            <h1>Detalles de <%=empleado.getNombre()%> <%=empleado.getApellido()%> </h1>
            <form class="form-horizontal col-md-9" action="EmpleadosServlet">
                <input type="hidden" name="accion" value="guardarCambios">
                <input type="hidden" name="idEmpleado" value="<%=empleado.getID()%>">
               <!-- inician datos candidato-->
                
               <div class="form-group">
                    <label for="nombres" class="col-sm-2 control-label">Nombre de pila</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="nombres" value="<%=candidato.getNombres()%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="apellidos" value="<%= candidato.getApellidos()%>" readonly>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="direccion" class="col-sm-2 control-label">Dirección</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="direccion" value="<%=candidato.getDireccion()%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="telefono" class="col-sm-2 control-label">Teléfono</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="telefono" value="<%=candidato.getTelefono()%>" readonly>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Correo</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="email" value="<%=candidato.getEmail()%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="titulo" class="col-sm-2 control-label">Título</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="titulo" value="<%=candidato.getTitulo()%>" readonly>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="universidad" class="col-sm-2 control-label">Universidad</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="universidad" value="<%=candidato.getUniversidad()%>" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label for="expectativas" class="col-sm-2 control-label">Expectativas económicas</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="expectativas" value="<%=candidato.getExpectativas()%>" readonly>
                    </div>
                </div>
                    
                <table class="table table-condensed table-responsive">
                    <tbody id="tablaCertificados">
                    <tr>
                        <td>Certificados</td>                   
                    </tr>
                    <%
                        if (certificados.isEmpty()) {
                    %> 
                    <tr>
                        <td>
                            <input class="inputFields" type="text" name="certificados" readOnly> 
                            <button class="btn btn-xs btn-danger borrarTrabajoBtn" type="button" onclick="borraCertificado(this)" disabled>borrar</button>
                            <button class="btn btn-xs btn-primary nuevoTrabajoBtn" type="button" onclick="agregaCertificado()" disabled>otro</button>
                        </td>
                    </tr> 
                    <%
                    } else {
                        for (String certificado : certificados) {
                    %> 
                    <tr>
                        <td>
                            <input class="inputFields" type="text" name="certificados" value="<%=certificado%>" readOnly> 
                            <button class="btn btn-xs btn-danger borrarTrabajoBtn" type="button" onclick="borraCertificado(this)" disabled>borrar</button>
                            <button class="btn btn-xs btn-primary nuevoTrabajoBtn" type="button" onclick="agregaCertificado()" disabled>otro</button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                    
                <table class="table table-condensed table-responsive">
                    <tbody id="tablaTrabajosAnteriores">
                    <tr>
                        <td>Trabajos anteriores</td>                   
                    </tr>

                    <% if (trabajosAnt.isEmpty()) {
                    %> 
                    <tr>
                        <td>
                            <input class="inputFields" type="text" name="trabajos" readOnly> 
                            <button class="btn btn-xs btn-danger borrarTrabajoBtn" type="button" onclick="borraTrabajo(this)" disabled>borrar</button>
                            <button class="btn btn-xs btn-primary nuevoTrabajoBtn" type="button" onclick="agregaTrabajo()" disabled>otro</button>
                        </td>
                    </tr>
                    <%
                    } else {
                        for (String trabajo : trabajosAnt) {
                    %> 
                    <tr>
                        <td>
                            <input class="inputFields" type="text" name="trabajos" value="<%=trabajo%>" readOnly> 
                            <button class="btn btn-xs btn-danger borrarTrabajoBtn" type="button" onclick="borraTrabajo(this)" disabled>borrar</button>
                            <button class="btn btn-xs btn-primary nuevoTrabajoBtn" type="button" onclick="agregaTrabajo()" disabled>otro</button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                
                
                <!-- inician datos empleado -->
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
                
                <button class="btn btn-warning" type="button" id="EditarBtn" onclick="hacerEditable()">Editar</button>
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
                
                var borrarTrabajo = document.getElementsByClassName("borrarTrabajoBtn");
                for (i = 0; i < borrarTrabajo.length; i++) {
                    borrarTrabajo[i].disabled = false;
                }
                var nuevoTrabajo = document.getElementsByClassName("nuevoTrabajoBtn");
                for (i = 0; i < nuevoTrabajo.length; i++) {
                    nuevoTrabajo[i].disabled = false;
                }
            }
            
            function agregaTrabajo() {
                var renglon = document.createElement("tr");
                var columna = document.createElement("td");

                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name = "trabajos";

                var btnBorrar = document.createElement("button");
                btnBorrar.onclick = function() {
                    borraTrabajo(this);
                };
                btnBorrar.innerHTML = "borrar";
                btnBorrar.type = "button";
                btnBorrar.className = "btn btn-xs btn-danger";

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaTrabajo;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";
                btnAgregar.className = "btn btn-xs btn-primary";

                columna.appendChild(inputNodo);
                columna.appendChild(btnBorrar);
                columna.appendChild(btnAgregar);

                renglon.appendChild(columna);
                document.getElementById("tablaTrabajosAnteriores").appendChild(renglon);
            }

            function borraTrabajo(t) {
                var renglon = t.parentNode.parentNode;
                if (renglon.rowIndex > 1) {
                    document.getElementById("tablaTrabajosAnteriores").deleteRow(renglon.rowIndex);
                }
            }

            function agregaCertificado() {
                var renglon = document.createElement("tr");
                var columna = document.createElement("td");

                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name = "certificados";

                var btnBorrar = document.createElement("button");
                btnBorrar.onclick = btnBorrar.onclick = function() {
                    borraCertificado(this);
                };
                btnBorrar.innerHTML = "borrar";
                btnBorrar.type = "button";
                btnBorrar.className = "btn btn-xs btn-danger";

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaCertificado;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";
                btnAgregar.className = "btn btn-xs btn-primary";

                columna.appendChild(inputNodo);
                columna.appendChild(btnBorrar);
                columna.appendChild(btnAgregar);

                renglon.appendChild(columna);
                document.getElementById("tablaCertificados").appendChild(renglon);
            }

            function borraCertificado(t) {
                var renglon = t.parentNode.parentNode;
                if (renglon.rowIndex > 1) {
                    document.getElementById("tablaCertificados").deleteRow(renglon.rowIndex);
                }
            }
        
        </script>
        
    </body>
</html>