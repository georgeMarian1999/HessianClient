<%@ page import="org.hessian.model.Author" %>
<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: georgemarianmihailescu
  Date: 16.05.2022
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add book</title>
    <link rel="stylesheet" href="styles/main.css"/>
</head>
<body>
<div class="form-wrapper">
    <a href="books.jsp" class="corner-button left-corner-button">Back to authors</a>
    <form id="add-book-form" class="form" method="post" action="add-book">
        <label for="title" >Title</label>
        <input id="title" type="text" name="title" />

        <label for="year" >Year</label>
        <input id="year" type="text" name="year" />

        <label for="description" >Description</label>
        <input id="description" type="text" name="description" />

        <label for="authors">Author</label>
        <select id="authors" form="add-book-form" name="authorId">

        <%
            List<Author> authors = ConnectionFactory.getConnection().getAllAuthors();
            for (Author author: authors) {
                out.println("<option value = \"" + author.getAuthorId() + "\">"+ author.getName() + "</option>");
            }
        %>

        </select>

        <input type="submit" value="Add book"/>
    </form>
</div>
</body>
</html>
