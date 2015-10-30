<%-- 
    Document   : crear_candidato
    Created on : Oct 28, 2015, 10:59:38 AM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo candidato</title>
    </head>
    <body>
        <h1>Nuevo Candidato</h1>
        <form action="CrearCandidatoServlet">
            <table>
                <tr>
                    <td>Nombre de pila</td>
                    <td><input type="text" name="nombres"></td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td><input type="text" name="apellidos"></td>
                </tr>
                <tr>
                    <td>Expectativas economicas</td>
                    <td><input type="text" name="expectativas"></td>
                </tr>
                <tr>
                    <td>Direccion</td>
                    <td><input type="text" name="direccion"></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input type="text" name="telefono"></td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo"></td>
                </tr>
                <tr>
                    <td>Universidad</td>
                    <td><input type="text" name="universidad"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td>Estado</td>
                    <td>
                        <select name="estado">
                            <option value="aceptado">Aceptado</option>
                            <option value="rechazado">Rechazado</option>
                            <option value="pendiente">Pendiente</option>
                        </select> 
                    </td>
                </tr>
            </table>

            <table id="certificadosTabla">
                <tr>
                    <td>Certificados</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="certificados">
                        <button type="button" onclick="borraCertificado(this)">borrar</button>
                        <button type="button" onclick="agregaCertificado()">otro</button>
                    </td>
                </tr>
            </table>

            <table id="trabajosTabla">
                <tr>
                    <td>Trabajos anteriores</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="trabajos"> 
                        <button type="button" onclick="borraTrabajo(this)">borrar</button>
                        <button type="button" onclick="agregaTrabajo()">otro</button>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Guardar">
        </form>
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

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaTrabajo;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";

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

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaCertificado;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";

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
    </body>
</html>
