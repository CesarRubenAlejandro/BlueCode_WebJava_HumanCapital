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
                <tr>
                    <td>Certificados</td>
                    <td><input type="text" name="certificados"></td>
                </tr>
                <tr id="trabajosRow">
                    <td>Trabajos anteriores</td>
                    <td>
                        <input type="text" name="trabajos"> 
                        <button>borrar</button>
                        <button type="button" onclick="agregaTrabajo()">otro</button>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Guardar">
        </form>
        <script>
            function agregaTrabajo() {
                var nodo = document.createElement("td");
                var linebreak = document.createElement("br");
                
                var inputNodo = document.createElement("input");
                inputNodo.type = "text";
                inputNodo.name="trabajos";
                
                var btnBorrar = document.createElement("BUTTON");
                btnBorrar.onclick=borraTrabajo;
                btnBorrar.innerHTML="borrar";
                btnBorrar.type="button";
                
                var btnAgregar = document.createElement("BUTTON");
                btnAgregar.onclick=agregaTrabajo;
                btnAgregar.innerHTML="otro";
                btnAgregar.type="button";
                
                nodo.appendChild(inputNodo);
                nodo.appendChild(btnBorrar);
                nodo.appendChild(btnAgregar);
                
                document.getElementById("trabajosRow").appendChild(linebreak);
                document.getElementById("trabajosRow").appendChild(nodo);
            }

            function borraTrabajo() {

            }
        </script>
    </body>
</html>