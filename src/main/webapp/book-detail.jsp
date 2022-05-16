<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="org.hessian.model.Book" %>
<%@ page import="org.hessian.model.Book" %><%--
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
            String title = ConnectionFactory.getConnection().getBookById(Integer.parseInt(request.getParameter("bookId"))).getTitle();
            out.println(title);
        %>
    </title>
    <link rel="stylesheet" href="styles/main.css">

</head>
<body>
    <div class="form-wrapper">
        <a class="corner-button left-corner-button" href="books.jsp">Back to books table</a>
        <div>
            <h2>Edit book details or delete the book</h2>
        </div>
        <form class="form" method="post" action="edit-book">

            <%

                Book book = ConnectionFactory.getConnection().getBookById(Integer.parseInt(request.getParameter("bookId")));
                out.println("<input type=\"text\" name=\"bookId\" class=\"hidden\" value=\"" + book.getBookId() + "\"/>\n");
                out.println("<label for=\"title\">Name</label>" +
                        "<input type=\"text\" name=\"title\" value=\"" + book.getTitle() + "\"/>\n");
                out.println("<label for=\"year\">Age</label>" +
                        "<input type=\"text\" name=\"year\" value=\"" + book.getYear() + "\"/>\n");

                out.println("<label for=\"description\">Description</label>" +
                        "<input type=\"text\" name=\"description\" value=\"" + book.getDescription() + "\"/>\n");

                out.println("<label for=\"authorId\">Author</label>" +
                        "<input type=\"text\" name=\"authorId\" value=\"" + ConnectionFactory.getConnection().getAuthorById(book.getAuthorId()).getName() + "\"/>\n");

            %>
            <input type="submit" value="Edit book"/>
        </form>

        <form method="post" action="delete-book">
            <%
            out.println("<input type=\"text\" name=\"bookId\" class=\"hidden\" value=\"" + request.getParameter("bookId") + "\"/>\n");
            %>
            <input type="submit" value="Delete book"/>
        </form>
    </div>

</body>
</html>
