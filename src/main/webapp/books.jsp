<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hessian.model.Book" %>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<%
  String keyword = request.getParameter("search-parameter");
  List<Book> books;
  if (keyword != null) {
      books = ConnectionFactory.getConnection().getBooksBySearch(keyword);
  }
  else books = ConnectionFactory.getConnection().getAllBooks();

%>
<body>
  <a class="left-corner-button corner-button" href="index.jsp">Back home</a>
  <a class="right-corner-button corner-button" href="book-add.jsp">Add book</a>
  <div class="form-wrapper">
    <h2>Search all books with the name</h2>
    <form method="get" action="books.jsp" target="_parent">
      <input type="text" name="search-parameter"/>
      <input type="submit"/>
    </form>
  </div>

<form method = "get" action = "book-detail.jsp">

  <table>
    <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Year</th>
    </tr>
    <%
      for (Book book: books
           ) {
        out.println("<tr>" +
                "<td>\n" +
                "                    <form action=\"book-detail.jsp\" method=\"get\">\n" +
                "                        <input type=\"text\" name=\"bookId\" class=\"hidden\" value=\"" + book.getBookId() + "\" />\n" +
                "                        <input type=\"submit\" value=\"" + book.getBookId() + "\">\n" +
                "                    </form>\n" +
                "                </td>" +
                "<td>" +
                book.getTitle() +
                "</td>" +
                "<td>" +
                book.getYear() +
                "</td>" +
                "</tr>");
      }
    %>
  </table>
</form>

</div>
</body>
</html>
