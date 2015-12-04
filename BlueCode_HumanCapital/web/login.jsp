<%-- 
    Document   : login
    Created on : 2/12/2015, 10:58:09 PM
    Author     : Ricky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <jsp:include page="head.html"></jsp:include>
    <body style="background-color: #2c3e50;">
        <jsp:useBean id = "datos" scope= "session" class = "database.DatabaseConnector" />
        <div class="container">
        <h2 class="text-center" style="color: #1abc9c;">Capital Humano</h2>
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default" style="border: none;">
                    <div class="panel-heading" style="background-color: #1abc9c;">
                        <h3 class="panel-title">Favor de iniciar sesión</h3>
                    </div>
                    <div class="panel-body" style="background-color: #ecf0f1;">
                    <form action="LoginServlet" method="post">
                        <p>
                        <label for="usernameTextField">Usuario</label><br />
                        <input class="form-control" id="usernameTextField" type="text" name="username" />
                        </p>
                        <p>
                        <label for="passwordTextField">Contraseña</label><br />
                        <input class="form-control" id="passwordTextField" type="password" name="password" />
                        </p>
                        <%= request.getAttribute("login_success") == null ? "" : "<p>Usuario o contraseña incorrecta</p>" %>
                        <input class="btn btn-block btn-primary" type="submit" value="Ingresar" />
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
