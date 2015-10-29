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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles candidato</title>
    </head>
    <body>
        <h1>Detalles de <%=candidato.getNombres()%> <%= candidato.getApellidos()%></h1>
        <form action="CandidatoDetallesServlet">
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input class="inputFields" type="text" name="nombres" value="<%=candidato.getNombres()%>" readonly></td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td><input class="inputFields" type="text" name="apellidos" value="<%= candidato.getApellidos()%>" readonly></td>
                </tr>
                <tr>
                    <td>Direccion</td>
                    <td><input class="inputFields" type="text" name="direccion" value="<%=candidato.getDireccion()%>" readonly></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input class="inputFields" type="text" name="telefono" value="<%=candidato.getTelefono()%>" readonly></td>
                </tr>
                <tr>
                    <td>Correo</td>
                    <td><input class="inputFields" type="text" name="email" value="<%=candidato.getEmail()%> " readonly></td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input class="inputFields" type="text" name="titulo" value="<%=candidato.getTitulo()%>" readonly></td>
                </tr>
                <tr>
                    <td>Universidad</td>
                    <td><input class="inputFields" type="text" name="universidad" value="<%=candidato.getUniversidad()%>" readonly></td>
                </tr>
                <tr>
                    <td>Expectativas Económicas</td>
                    <td><input class="inputFields" type="text" name="expectativasEconomicas" value="<%=candidato.getExpectativas()%>" readonly></td>
                </tr>
                <tr>
                    <td>Estado</td>
                    <td>
                        <select id="estadoBox" name="estado" disabled>
                            <option>Pendiente</option>
                            <option>Aceptado</option>
                            <option>Rechazado</option>
                        </select> 
                    </td>
                </tr>
            </table>
            <table id="tablaCertificados">
                <tr>
                    <td>Certificados</td>
                    <td>
                        <%

                        %>
                    </td>
                </tr>
            </table>
            <table id="TablaTrabajosAnteriores">
                <tr>
                    <td>Trabajos anteriores</td>
                    <td>
                        <input class="inputFields" type="text" name="trabajos" readOnly> 
                        <button class="borrarTrabajoBtn" disabled>borrar</button>
                        <button class="nuevoTrabajoBtn" type="button" onclick="agregaTrabajo()" disabled>otro</button>
                    </td>
                </tr>
            </table>
            <button type="button" id="EditarBtn" onclick="hacerEditable()">Editar</button>
            <input type="submit" id="GuardarBtn" value="Guardar cambios" disabled>
        </form>
        <form action="EliminaCandidatoServlet">        
            <input type="submit" id="EliminarBtn" value="Eliminar candidato">
        </form>

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
                var nodo = document.createElement("tr");
                var linebreak = document.createElement("br");

                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name = "trabajos";

                var btnBorrar = document.createElement("button");
                btnBorrar.onclick = borraTrabajo;
                btnBorrar.innerHTML = "borrar";
                btnBorrar.type = "button";

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaTrabajo;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";

                nodo.appendChild(inputNodo);
                nodo.appendChild(btnBorrar);
                nodo.appendChild(btnAgregar);

                document.getElementById("TablaTrabajosAnteriores").appendChild(document.createElement("tr"));
                document.getElementById("TablaTrabajosAnteriores").appendChild(nodo);
            }

            function borraTrabajo() {

            }

        </script>
    </body>

</html>