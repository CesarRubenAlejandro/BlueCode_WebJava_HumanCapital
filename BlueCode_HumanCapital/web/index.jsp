<%-- 
    Document   : index.jsp
    Created on : Oct 29, 2015, 3:08:42 PM
    Author     : Lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HumanCapital home</title>
    </head>
    <body>
        <jsp:useBean id = "datos" scope= "session"
        class = "database.DatabaseConnector" />
        <h1>Bienvenido</h1>
        <a href="CandidatosIndexServlet">Candidatos</a>
    </body>
</html>
