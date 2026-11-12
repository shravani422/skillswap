/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.UserDAO;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig

public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User currentUser =
                (User) session.getAttribute("currentUser");

        String bio = request.getParameter("bio");
        String skills = request.getParameter("skills");
        String learning = request.getParameter("learning");
        String certificateTitle =
        request.getParameter("certificateTitle");

String certificateIssuer =
        request.getParameter("certificateIssuer");

String certificateDescription =
        request.getParameter("certificateDescription");
Part filePart = request.getPart("certificateFile");

String fileName = filePart.getSubmittedFileName();
      

        currentUser.setBio(bio);
        currentUser.setSkills(skills);
        currentUser.setLearning(learning);
        currentUser.setCertificateTitle(certificateTitle);
currentUser.setCertificateIssuer(certificateIssuer);
currentUser.setCertificateDescription(certificateDescription);

if(fileName != null && !fileName.isEmpty()){

    currentUser.setCertificateFile(fileName);

    String uploadPath =
            getServletContext().getRealPath("") +
            "uploads";

    java.io.File uploadDir =
            new java.io.File(uploadPath);

    if(!uploadDir.exists()){
        uploadDir.mkdir();
    }

    filePart.write(
            uploadPath +
            java.io.File.separator +
            fileName
    );
}
        UserDAO dao = new UserDAO();

        boolean status = dao.updateProfile(currentUser);

        if(status){

            session.setAttribute("currentUser", currentUser);

            response.sendRedirect("dashboard.jsp");

        } else {

            response.sendRedirect("editProfile.jsp");

        }

    }
}