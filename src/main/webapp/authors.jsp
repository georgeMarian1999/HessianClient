<%@ page import="org.hessian.model.Author" %>
<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Authors</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<%
  String keyword = request.getParameter("search-parameter");
  List<Author> authors;
  if (keyword != null) {
      authors = ConnectionFactory.getConnection().getAuthorsBySearch(keyword);
  }
  else authors = ConnectionFactory.getConnection().getAllAuthors();

%>
<body>
  <a class="left-corner-button corner-button" href="index.jsp">Back home</a>
  <a class="right-corner-button corner-button" href="author-add.jsp">Add author</a>
  <div class="form-wrapper">
    <h2>Search all authors with the name</h2>
    <form method="get" action="authors.jsp" target="_parent">
      <input type="text" name="search-parameter"/>
      <input type="submit"/>
    </form>
  </div>

<form method = "get" action = "author-detail.jsp">

  <table>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Age</th>
    </tr>
    <%
      for (Author author: authors
           ) {
        out.println("<tr>" +
                "<td>\n" +
                "                    <form action=\"author-detail.jsp\" method=\"get\">\n" +
                "                        <input type=\"text\" name=\"authorId\" class=\"hidden\" value=\"" + author.getAuthorId() + "\" />\n" +
                "                        <input type=\"submit\" value=\"" + author.getAuthorId() + "\">\n" +
                "                    </form>\n" +
                "                </td>" +
                "<td>" +
                author.getName() +
                "</td>" +
                "<td>" +
                author.getAge() +
                "</td>" +
                "</tr>");
      }
    %>
  </table>
</form>

</div>
</body>
</html>
