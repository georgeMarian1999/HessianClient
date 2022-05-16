package org.hessian.servlets;

import org.hessian.connection.ConnectionFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editAuthor", value = "/edit-author")
public class EditAuthor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("authorId"));
        String name = request.getParameter("name");
        Integer age = Integer.parseInt(request.getParameter("age"));

        ConnectionFactory.getConnection().editAuthor(id, name, age);

        response.sendRedirect(request.getContextPath() + "/author-edit-confirmation.jsp");
    }
}
