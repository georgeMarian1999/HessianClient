package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addBook", value = "/add-book")
public class AddBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        Integer year = Integer.parseInt(request.getParameter("year"));
        String description = request.getParameter("description");
        Integer authorId = Integer.parseInt(request.getParameter("authorId"));
        String server = request.getParameter("server");

        ConnectionFactory.getConnection(server).addBook(title, description, year, authorId);

        request.getRequestDispatcher("books.jsp").forward(request, response);
    }
}
