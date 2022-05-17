package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addAuthor", value = "/add-author")
public class AddAuthor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Integer age = Integer.parseInt(request.getParameter("age"));
        String server = request.getParameter("server");

        ConnectionFactory.getConnection(server).addAuthor(name, age);

        request.getRequestDispatcher("/authors.jsp").forward(request, response);
    }
}
