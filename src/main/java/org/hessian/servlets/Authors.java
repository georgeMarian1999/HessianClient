package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;
import org.hessian.model.Author;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "authors", value = "/authors")
public class Authors extends HttpServlet {

    private List<Author> authors;

    @Override
    public void init() throws ServletException {
        authors = ConnectionFactory.getConnection().getAllAuthors();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        System.out.println(authors);
        out.println("\n" +
                "<html>\n" +
                "<head>\n" +
                "    <title>Authors</title>\n" +
                "  <style>\n" +
                "    table {\n" +
                "      font-family: arial, sans-serif;\n" +
                "      border-collapse: collapse;\n" +
                "      width: 100%;\n" +
                "    }\n" +
                "\n" +
                "    td, th {\n" +
                "      border: 1px solid #dddddd;\n" +
                "      text-align: left;\n" +
                "      padding: 8px;\n" +
                "    }\n" +
                "\n" +
                "    tr:nth-child(even) {\n" +
                "      background-color: #dddddd;\n" +
                "    }\n" +
                "  </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "<div>\n" +
                "  <table>\n" +
                "    <tr>\n" +
                "      <th>ID</th>\n" +
                "      <th>Name</th>\n" +
                "      <th>Age</th>\n");
        for (Author author: authors
             ) {
            out.println("<tr>" +
                    "<td>" +
                    author.getAuthorId() +
                    "</td>" +
                    "<td>" +
                    author.getName() +
                    "</td>" +
                    "<td>" +
                    author.getAge() +
                    "</td>" +
                    "</tr>");
        }



        out.println(
                "    </tr>\n" +
                "  </table>\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>\n");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
