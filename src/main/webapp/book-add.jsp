<%@ page import="org.hessian.model.Author" %>
<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: georgemarianmihailescu
  Date: 16.05.2022
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%
        String server = request.getParameter("server");
    %>
    <title>Add book</title>
    <link rel="stylesheet" href="styles/main.css"/>
</head>
<body>
<div class="form-wrapper">
    <form method="get" action="books.jsp" >
        <input type="text" name="server" value="<%=server%>" class="hidden"/>
        <input class="corner-button left-corner-button" type="submit" value="Back to books table"/>
    </form>
    <form id="add-book-form" class="form" method="post" action="add-book">
        <label for="title" >Title</label>
        <input id="title" type="text" name="title" />

        <label for="year" >Year</label>
        <input id="year" type="text" name="year" />

        <label for="description" >Description</label>
        <input id="description" type="text" name="description" />
        <%

            out.println( "<input type=\"text\" name=\"server\" class=\"hidden\" value=\"" + server + "\" />\n");
        %>
        <label for="authors">Author</label>
        <select id="authors" form="add-book-form" name="authorId">

        <%

            Gson gson = new Gson();
            List<Author> authors = ConnectionFactory.getConnection(server).getAllAuthors();
            for (int i = 0;  i < authors.size();i++) {
                String bookJson = gson.toJson(authors.get(i));
                Author author = gson.fromJson(bookJson, Author.class);
                out.println("<option value = \"" + author.getAuthorId() + "\">"+ author.getName() + "</option>");
            }
        %>

        </select>

        <input type="submit" value="Add book"/>
    </form>
</div>
</body>
</html>
