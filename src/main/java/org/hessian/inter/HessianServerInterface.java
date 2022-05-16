package org.hessian.inter;



import org.hessian.model.Author;

import java.awt.print.Book;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.List;

public interface HessianServerInterface {

    public String ping() throws UnknownHostException;

    public List<Author> getAllAuthors();
    public List<Author> getAuthorsBySearch(String keyword) throws SQLException;
    public void addAuthor(String name, Integer age) throws SQLException;

    public List<Book> getAllBooks();
    public List<Book> getBooksBySearch(String keyword) throws SQLException;
    public void addBook(String title, String description, Integer year, Integer authorId) throws SQLException;
}
