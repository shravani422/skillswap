/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.ConnectionNoteDAO;
import model.ConnectionNote;
import model.User;


import java.io.IOException;

@WebServlet("/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        User currentUser =
        (User) request.getSession()
                      .getAttribute("currentUser");

        int receiverId =
        Integer.parseInt(
                request.getParameter("receiverId"));

        String noteText =
                request.getParameter("noteText");

        ConnectionNote note =
                new ConnectionNote();

        note.setSenderId(
                currentUser.getId());

        note.setReceiverId(
                receiverId);

        note.setNoteText(
                noteText);

        ConnectionNoteDAO dao =
                new ConnectionNoteDAO();

        dao.addNote(note);

        response.sendRedirect(
        "notes.jsp?userId=" + receiverId);
    }
}