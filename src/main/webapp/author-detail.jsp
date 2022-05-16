<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="org.hessian.model.Author" %><%--
  Created by IntelliJ IDEA.
  User: georgemihailescu
  Date: 5/15/2022
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <%
            String name = ConnectionFactory.getConnection().getAuthorById(Integer.parseInt(request.getParameter("authorId"))).getName();
            out.println(name);
        %>
    </title>
    <link rel="stylesheet" href="styles/main.css">

</head>
<body>
    <div class="form-wrapper">
        <a class="corner-button left-corner-button" href="authors.jsp">Back to authors table</a>
        <div>
            <h2>Edit author details or delete the author</h2>
        </div>
        <form class="form" method="post" action="edit-author">

            <%

                Author author = ConnectionFactory.getConnection().getAuthorById(Integer.parseInt(request.getParameter("authorId")));
                out.println("<input type=\"text\" name=\"authorId\" class=\"hidden\" value=\"" + author.getAuthorId() + "\"/>\n");
                out.println("<label for=\"name\">Name</label>" +
                        "<input type=\"text\" name=\"name\" value=\"" + author.getName() + "\"/>\n");
                out.println("<label for=\"age\">Age</label>" +
                        "<input type=\"text\" name=\"age\" value=\"" + author.getAge() + "\"/>\n");

            %>
            <input type="submit" value="Edit author"/>
        </form>

        <form method="post" action="delete-author">
            <%
            out.println("<input type=\"text\" name=\"authorId\" class=\"hidden\" value=\"" + request.getParameter("authorId") + "\"/>\n");
            %>
            <input type="submit" value="Delete author"/>
        </form>
    </div>

</body>
</html>
