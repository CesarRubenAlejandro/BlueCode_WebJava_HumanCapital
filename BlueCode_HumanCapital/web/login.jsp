<%-- 
    Document   : login
    Created on : 2/12/2015, 10:58:09 PM
    Author     : Ricky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Capital Humano</h1>
        <form action="LoginServlet" method="post">
            <p>
            <label for="usernameTextField">Usuario</label><br />
            <input id="usernameTextField" type="text" name="username" />
            </p>
            <p>
            <label for="passwordTextField">Contraseña</label><br />
            <input id="passwordTextField" type="password" name="password" />
            </p>
            <%= request.getAttribute("login_success") == null ? "" : "<p>Usuario o contraseña incorrecta</p>" %>
            <input type="submit" value="Ingresar" />
        </form>
    </body>
</html>
