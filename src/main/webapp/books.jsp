<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hessian.model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<%
  String keyword = request.getParameter("search-parameter");
  String server = request.getParameter("server");
  List<Book> books;
  Gson gson = new Gson();
  if (keyword != null) {
      books = ConnectionFactory.getConnection(server).getBooksBySearch(keyword);
  }
  else books = ConnectionFactory.getConnection(server).getAllBooks();

%>
<body>
<form class="form-wrapper" method="get" action="home.jsp">
  <%
    out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
  %>
  <input type="submit" class="left-corner-button corner-button" value="Back home"/>
</form>
<form class="form-wrapper" method="get" action="book-add.jsp">
  <%
    out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
  %>
  <input type="submit" value="Add book" class="right-corner-button corner-button"/>
</form>
  <div class="form-wrapper">
    <h2>Search all books with the name</h2>
    <form method="get" action="books.jsp" target="_parent">
      <input type="text" name="search-parameter"/>
      <input type="text" name="server" value="<%=server%>" class="hidden"/>
      <input type="submit"/>
    </form>

    <form method="get" action="books.jsp" target="_parent">
      <input type="text" name="server" value="<%=server%>" class="hidden"/>
      <input type="submit" value="Reset"/>
    </form>
  </div>


  <table>
    <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Year</th>
    </tr>
    <%
      if (books == null) {
        books = new ArrayList<>();
      }
      for (int i = 0; i < books.size(); i++
      ) {
        // For the PHP server connection
        // arrays in PHP convert the objects in them to HashMap
        String bookJson = gson.toJson(books.get(i));
        Book book = gson.fromJson(bookJson, Book.class);
        out.println("<tr>" +
                "<td>\n" +
                "                    <form action=\"book-detail.jsp\" method=\"get\">\n" +
                "                        <input type=\"text\" name=\"bookId\" class=\"hidden\" value=\"" + book.getBookId() + "\" />\n" +
                "                        <input type=\"submit\" value=\"" + book.getBookId() + "\">\n" +
                "                        <input type=\"text\" name=\"server\" class=\"hidden\" value=\"" + server + "\" />\n" +

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

</body>
</html>
