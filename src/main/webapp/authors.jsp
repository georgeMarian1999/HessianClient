<%@ page import="org.hessian.model.Author" %>
<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Authors</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<%
  String keyword = request.getParameter("search-parameter");
  String server = request.getParameter("server");
  List<Author> authors;
  Gson gson = new Gson();
  if (keyword != null) {
      authors = ConnectionFactory.getConnection(server).getAuthorsBySearch(keyword);
  }
  else authors = ConnectionFactory.getConnection(server).getAllAuthors();

%>
<body>
<form class="form-wrapper" method="get" action="home.jsp">
  <%
    out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
  %>
  <input type="submit" class="left-corner-button corner-button" value="Back home"/>
</form>
<form class="form-wrapper" method="get" action="author-add.jsp">
  <%
    out.println("<input class=\"hidden\" type=\"text\" name=\"server\" value=\"" + server+ "\" />");
  %>
  <input type="submit" value="Add author" class="right-corner-button corner-button"/>
</form>
  <div class="form-wrapper">
    <h2>Search all authors with the name</h2>
    <form method="get" action="authors.jsp" target="_parent">
      <input type="text" name="search-parameter"/>
      <input type="text" name="server" value="<%=server%>" class="hidden"/>
      <input type="submit"/>
    </form>
    <form method="get" action="authors.jsp" target="_parent">
      <input type="text" name="server" value="<%=server%>" class="hidden"/>
      <input type="submit" value="Reset"/>
    </form>
  </div>


  <table>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Age</th>
    </tr>
    <%
      if (authors == null) {
        authors = new ArrayList<>();
      }
      for (int i = 0; i < authors.size(); i++
           ) {
        // For the PHP server connection
        // arrays in PHP convert the objects in them to HashMap
        String authorJson = gson.toJson(authors.get(i));
        Author author = gson.fromJson(authorJson, Author.class);
        out.println("<tr>" +
                "<td>\n" +
                "                    <form action=\"author-detail.jsp\" method=\"get\">\n" +
                "                        <input type=\"text\" name=\"authorId\" class=\"hidden\" value=\"" + author.getAuthorId() + "\" />\n" +
                "                        <input type=\"submit\" value=\"" + author.getAuthorId() + "\">\n" +
                "                        <input type=\"text\" name=\"server\" class=\"hidden\" value=\"" + server + "\" />\n" +
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


</body>
</html>
