<%-- 
    Document   : detalles_candidato.jsp
    Created on : 28/10/2015, 11:25:17 AM
    Author     : Angela Romo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Candidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
            <h2>Detalles de <%=candidato.getNombres()%> <%= candidato.getApellidos()%></h2>
            <form class="form-horizontal col-md-9" action="CandidatosDetallesServlet">
                <input type="hidden" name="idCandidato" value="<%=candidato.getId()%>">
                
                <div class="form-group">
                    <label for="estado" class="col-sm-2 control-label">Estado</label>
                    <div class="col-sm-10">
                        <select id="estadoBox" class="form-control" name="estado" disabled required="required">
                                <option value="0">Pendiente</option>
                                <option value="1">Aceptado</option>
                                <option value="2">Rechazado</option>
                        </select> 
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="nombres" class="col-sm-2 control-label">Nombre de pila</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="nombres" value="<%=candidato.getNombres()%>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="apellidos" value="<%= candidato.getApellidos()%>" readonly required="required">
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="direccion" class="col-sm-2 control-label">Dirección</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="direccion" value="<%=candidato.getDireccion()%>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="telefono" class="col-sm-2 control-label">Teléfono</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="telefono" value="<%=candidato.getTelefono()%>" readonly required="required">
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Correo</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="email" value="<%=candidato.getEmail()%>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="titulo" class="col-sm-2 control-label">Título</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="titulo" value="<%=candidato.getTitulo()%>" readonly required="required">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="universidad" class="col-sm-2 control-label">Universidad</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="universidad" value="<%=candidato.getUniversidad()%>" readonly required="required">
                    </div>
                </div>

                <div class="form-group">
                    <label for="expectativas" class="col-sm-2 control-label">Expectativas económicas</label>
                    <div class="col-sm-10">
                        <input class="form-control inputFields" type="text" name="expectativas" value="<%=candidato.getExpectativas()%>" readonly required="required">
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
                <button class="btn btn-warning" type="button" id="EditarBtn" onclick="hacerEditable()">Editar</button>
                <input class="btn btn-success" type="submit" id="GuardarBtn" value="Guardar cambios" disabled>
            </form>
        </div>
        </div>

        <script>
            var index = "<%=candidato.getEstado()%>";
            document.getElementById("estadoBox").selectedIndex = index;

            function hacerEditable() {
                var inputs = document.getElementsByClassName("inputFields");
                for (i = 0; i < inputs.length; i++) {
                    inputs[i].readOnly = false;
                }
                document.getElementById("estadoBox").disabled = false;
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

