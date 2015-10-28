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
        <title>Crear candidato</title>
    </head>
    <body>
        <h1>Nuevo Candidato</h1>
        <form action="CandidatosServlet">
            <table>
                <tr>
                    <td>Nombre de pila</td>
                    <td><input type="text" name="nombreDePila"></td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td><input type="text" name="apellidos"></td>
                </tr>
                <tr>
                    <td>Expectativas economicas</td>
                    <td><input type="text" name="expectativasEconomicas"></td>
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
                    <td>Email</td>
                    <td><input type="text" name="email"></td>
                </tr>
            </table>
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
