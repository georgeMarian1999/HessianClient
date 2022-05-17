<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookStore</title>
    <link rel="stylesheet" href="styles/main.css"/>
</head>
<body>
<div>

    <div class="form-wrapper">
        <form class="form-wrapper" method="get" action="home.jsp" >
            <input type="text" name="server" value="Java" class="hidden"/>
            <input type="submit" value="Java Server"/>
        </form>
        <form class="form-wrapper" method="get" action="home.jsp" >
            <input type="text" name="server" value="Php" class="hidden"/>
            <input type="submit" value="Php Server"/>
        </form>
    </div>
</div>
</body>
</html>