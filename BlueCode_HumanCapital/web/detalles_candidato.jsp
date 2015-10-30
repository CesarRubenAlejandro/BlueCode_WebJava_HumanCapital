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
<%  /*Candidato candidato = new Candidato(123, "Tigre Antonio", "Kelloggs", "Muy altas", "Valle del Cereal", "811299302", "Tigre", "Zucaritas", "tonio@email.com", Candidato.RECHAZADO);
     ArrayList<String> certificados = new ArrayList();
     certificados.add("Certificacion en Azucar");
     certificados.add("Certificacion en Cereales");
     certificados.add("Certificacion genial");

     ArrayList<String> trabajosAnt = new ArrayList();
     trabajosAnt.add("Tigger en WinniePooh");
     trabajosAnt.add("Basquetbolista profesional");
     trabajosAnt.add("Conferencista motivacional"); */
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles candidato</title>
    </head>
    <body>
        <h1>Detalles de <%=candidato.getNombres()%> <%= candidato.getApellidos()%></h1>
        <form action="CandidatosDetallesServlet">
            <table>
                <tr>
                    <td>Estado</td>
                    <td>
                        <select id="estadoBox" name="estado" disabled>
                            <option><%=Candidato.PENDIENTE%></option>
                            <option><%=Candidato.ACEPTADO%></option>
                            <option><%=Candidato.RECHAZADO%></option>
                        </select> 
                    </td>
                </tr>
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
                    <td><input class="inputFields" type="text" name="email" value="<%=candidato.getEmail()%>" readonly></td>
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
                    <td><input class="inputFields" type="text" name="expectativas" value="<%=candidato.getExpectativas()%>" readonly></td>
                </tr>
            </table>
            <table id="tablaCertificados">
                <tr>
                    <td>Certificados</td>                   
                </tr>
                <%
                    if (certificados.isEmpty()) {
                %> 
                <tr>
                    <td>
                        <input class="inputFields" type="text" name="certificados" value="" readOnly> 
                        <button class="borrarTrabajoBtn" type="button" onclick="borraCertificado(this)" disabled>borrar</button>
                        <button class="nuevoTrabajoBtn" type="button" onclick="agregaCertificado()" disabled>otro</button>
                    </td>
                </tr> 
                <%
                } else {
                    for (String certificado : certificados) {
                %> 
                <tr>
                    <td>
                        <input class="inputFields" type="text" name="certificados" value="<%=certificado%>" readOnly> 
                        <button class="borrarTrabajoBtn" type="button" onclick="borraCertificado(this)" disabled>borrar</button>
                        <button class="nuevoTrabajoBtn" type="button" onclick="agregaCertificado()" disabled>otro</button>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <table id="tablaTrabajosAnteriores">
                <tr>
                    <td>Trabajos anteriores</td>                   
                </tr>

                <% if (trabajosAnt.isEmpty()) {
                %> 
                <tr>
                    <td>
                        <input class="inputFields" type="text" name="trabajos" value="" readOnly> 
                        <button class="borrarTrabajoBtn" type="button" onclick="borraTrabajo(this)" disabled>borrar</button>
                        <button class="nuevoTrabajoBtn" type="button" onclick="agregaTrabajo()" disabled>otro</button>
                    </td>
                </tr>
                <%
                } else {
                    for (String trabajo : trabajosAnt) {
                %> 
                <tr>
                    <td>
                        <input class="inputFields" type="text" name="trabajos" value="<%=trabajo%>" readOnly> 
                        <button class="borrarTrabajoBtn" type="button" onclick="borraTrabajo(this)" disabled>borrar</button>
                        <button class="nuevoTrabajoBtn" type="button" onclick="agregaTrabajo()" disabled>otro</button>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <button type="button" id="EditarBtn" onclick="hacerEditable()">Editar</button>
            <input type="submit" id="GuardarBtn" value="Guardar cambios" disabled>
        </form>
        <form action="CandidatosEliminarServlet?id=<%= candidato.getId()%>">        
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

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaTrabajo;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";

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

                var btnAgregar = document.createElement("button");
                btnAgregar.onclick = agregaCertificado;
                btnAgregar.innerHTML = "otro";
                btnAgregar.type = "button";

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

