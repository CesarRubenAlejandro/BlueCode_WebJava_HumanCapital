<%-- 
    Document   : crear_candidato
    Created on : Oct 28, 2015, 10:59:38 AM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspf/sidebar.jspf"%>
            <div id="page-content-wrapper">
            <h1>Nuevo Candidato</h1>
            <form class="form-horizontal col-md-9" action="CrearCandidatoServlet">
                <div class="form-group">
                    <label for="nombres" class="col-sm-2 control-label">Nombre de pila</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="nombres">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="apellidos">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="expectativas" class="col-sm-2 control-label">Expectativas económicas</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="expectativas">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="direccion" class="col-sm-2 control-label">Dirección</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="direccion">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="telefono" class="col-sm-2 control-label">Teléfono</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="telefono">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="titulo" class="col-sm-2 control-label">Título</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="titulo">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="universidad" class="col-sm-2 control-label">Universidad</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="universidad">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="email">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="estado" class="col-sm-2 control-label">Estado</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="estado">
                                <option value="aceptado">Aceptado</option>
                                <option value="rechazado">Rechazado</option>
                                <option value="pendiente">Pendiente</option>
                        </select> 
                    </div>
                </div>
                

                <table class="table table-condensed table-responsive">
                    <tbody id="certificadosTabla">
                    <tr>
                        <td>Certificados</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="certificados">
                            <button class="btn btn-xs btn-danger" type="button" onclick="borraCertificado(this)">borrar</button>
                            <button class="btn btn-xs btn-primary" type="button" onclick="agregaCertificado()">otro</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="table table-condensed table-responsive" >
                    <tbody id="trabajosTabla">
                    <tr>
                        <td>Trabajos anteriores</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="trabajos"> 
                            <button class="btn btn-xs btn-danger" type="button" onclick="borraTrabajo(this)">borrar</button>
                            <button class="btn btn-xs btn-primary" type="button" onclick="agregaTrabajo()">otro</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input class="btn btn-success" type="submit" value="Guardar">
            </form>
            </div>
        </div>
            
        <script>
            function agregaTrabajo() {
                var renglon = document.createElement("tr");
                var columna = document.createElement("td");

                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name = "trabajos";

                var btnBorrar = document.createElement("button");
                btnBorrar.onclick = function () {
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
                document.getElementById("trabajosTabla").appendChild(renglon);
            }

            function borraTrabajo(t) {
                var renglon = t.parentNode.parentNode;
                if (renglon.rowIndex > 1){
                    document.getElementById("trabajosTabla").deleteRow(renglon.rowIndex);
                }
            }

            function agregaCertificado() {
                var renglon = document.createElement("tr");
                var columna = document.createElement("td");

                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name = "certificados";

                var btnBorrar = document.createElement("button");
                btnBorrar.onclick = btnBorrar.onclick = function () {
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
                document.getElementById("certificadosTabla").appendChild(renglon);
            }

            function borraCertificado(t) {
                var renglon = t.parentNode.parentNode;
                if (renglon.rowIndex > 1){
                    document.getElementById("certificadosTabla").deleteRow(renglon.rowIndex);
                }
            }
        </script>
        <jsp:include page="scripts.html"></jsp:include>
    </body>
</html>
