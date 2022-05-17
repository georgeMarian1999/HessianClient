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
    <%
        String server = request.getParameter("server");
    %>

    <a class="corner-button left-corner-button" href="index.jsp">
        Back to index
    </a>
    <div class="form-wrapper">
        <div>
            <h2>Welcome to the BookStore</h2>
        </div>
        <form class="form-wrapper" method="get" action="authors.jsp">
            <%
                out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
            %>
            <input type="submit" value="See authors"/>
        </form>
        <form class="form-wrapper" method="get" action="books.jsp">
            <%
                out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
            %>
            <input type="submit" value="See books"/>
        </form>
        <%
            out.println(ConnectionFactory.getConnection(server).ping());
        %>
    </div>
</div>
</body>
</html>