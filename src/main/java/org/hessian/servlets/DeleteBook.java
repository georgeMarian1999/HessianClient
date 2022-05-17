package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteBook", value = "/delete-book")
public class DeleteBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("bookId"));
        String server = request.getParameter("server");
        ConnectionFactory.getConnection(server).deleteBook(id);

        request.getRequestDispatcher("books.jsp").forward(request, response);
    }
}
