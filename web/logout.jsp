<%-- 
    Document   : logout
    Created on : 12 mars 2019, 10:52:20
    Author     : mvincent
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp"); 

        %>
    </body>
</html>
