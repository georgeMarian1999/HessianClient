<%@ page import="org.hessian.model.Author" %>
<%@ page import="org.hessian.connection.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Authors</title>
  <style>
    table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    .left-corner-button {
      width: auto;
      padding: 10px;
      color: white;
      background: cornflowerblue;
      text-decoration: none;
      position: absolute;
      top: 30px;
      left: 20px;
      height: 20px;
    }

    .form-wrapper {
      display: flex;
      width: 100%;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .hidden {
      display: none;
    }

    td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>
</head>
<%
  String keyword = request.getParameter("search-parameter");
  List<Author> authors;
  if (keyword != null) {
    try {
      authors = ConnectionFactory.getConnection().getAuthorsBySearch(keyword);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
  else authors = ConnectionFactory.getConnection().getAllAuthors();

%>
<body>
<>

  <a class="left-corner-button" href="index.jsp">Back home</a>
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
                "<td>" +
                "<td>\n" +
                "                    <form action=\"author-detail.jsp\" method=\"get\">\n" +
                "                        <input type=\"text\" name=\"movieID\" class=\"hidden\" value=\"" + author.getAuthorId() + "\" />\n" +
                "                        <input class=\"list-button\" type=\"submit\" value=\"Show actors\">\n" +
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
