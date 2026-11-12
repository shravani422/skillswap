/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;
 // CHANGE THIS TO YOUR ACTUAL PACKAGE

import dao.ConnectionRequestDAO;
import model.ConnectionRequest;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SendRequestServlet")
public class SendRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            User currentUser =
                    (User) request.getSession()
                                  .getAttribute("currentUser");

            if(currentUser == null){
                response.sendRedirect("login.jsp");
                return;
            }

            int receiverId =
                    Integer.parseInt(
                            request.getParameter("receiverId"));

            ConnectionRequest connectionRequest =
                    new ConnectionRequest();

            connectionRequest.setSenderId(
                    currentUser.getId());

            connectionRequest.setReceiverId(
                    receiverId);

            ConnectionRequestDAO dao =
                    new ConnectionRequestDAO();

            boolean status =
                    dao.sendRequest(connectionRequest);

            if(status){
                response.sendRedirect(
                        "viewProfile.jsp?id=" + receiverId);
            }else{
                response.getWriter().println(
                        "Failed to send request");
            }

        } catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage());
        }
    }
}