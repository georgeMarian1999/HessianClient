package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "deleteAuthor", value = "/delete-author")
public class DeleteAuthor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("authorId"));
        ConnectionFactory.getConnection().deleteAuthor(id);

        response.sendRedirect(request.getContextPath() + "/author-delete-confirmation.jsp");
    }
}
