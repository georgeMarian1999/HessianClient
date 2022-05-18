<%--
  Created by IntelliJ IDEA.
  User: georgemarianmihailescu
  Date: 16.05.2022
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add author</title>
    <link rel="stylesheet" href="styles/main.css"/>
    <%
        String server = request.getParameter("server");
    %>
</head>
<body>
<div class="form-wrapper">
    <form method="get" action="authors.jsp" >
        <input type="text" name="server" value="<%=server%>" class="hidden"/>
        <input class="corner-button left-corner-button" type="submit" value="Back to authors table"/>
    </form>
    <form class="form" method="post" action="add-author">
        <label for="name" >Name</label>
        <input id="name" type="text" name="name" />
        <label for="age" >Age</label>
        <input id="age" type="text" name="age" />
        <%

            out.println( "<input type=\"text\" name=\"server\" class=\"hidden\" value=\"" + server + "\" />\n");
        %>
        <input type="submit" value="Add author"/>
    </form>
</div>
</body>
</html>
