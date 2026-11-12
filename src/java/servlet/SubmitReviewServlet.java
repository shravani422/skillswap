/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.ReviewDAO;
import model.User;
import model.UserReview;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        User currentUser =
                (User) session.getAttribute("currentUser");

        if(currentUser == null){

            response.sendRedirect("login.jsp");
            return;
        }

        int reviewedUserId =
                Integer.parseInt(
                        request.getParameter("reviewedUserId"));

        if(currentUser.getId() == reviewedUserId){

            response.sendRedirect(
                    "viewProfile.jsp?id=" +
                    reviewedUserId);

            return;
        }

        int rating =
                Integer.parseInt(
                        request.getParameter("rating"));

        String reviewText =
                request.getParameter("reviewText");

        UserReview review =
                new UserReview();

        review.setReviewerId(
                currentUser.getId());

        review.setReviewedUserId(
                reviewedUserId);

        review.setRating(rating);

        review.setReviewText(
                reviewText);

        ReviewDAO dao =
                new ReviewDAO();

        dao.saveOrUpdateReview(review);

        response.sendRedirect(
                "viewProfile.jsp?id=" +
                reviewedUserId);
    }
}