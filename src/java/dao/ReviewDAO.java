/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.UserReview;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public boolean saveOrUpdateReview(UserReview review) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String checkQuery =
                    "SELECT id FROM reviews WHERE reviewer_id=? AND reviewed_user_id=?";

            PreparedStatement checkPs =
                    con.prepareStatement(checkQuery);

            checkPs.setInt(1, review.getReviewerId());
            checkPs.setInt(2, review.getReviewedUserId());

            ResultSet rs =
                    checkPs.executeQuery();

            if(rs.next()) {

                String updateQuery =
                        "UPDATE reviews SET rating=?, review_text=? WHERE reviewer_id=? AND reviewed_user_id=?";

                PreparedStatement ps =
                        con.prepareStatement(updateQuery);

                ps.setInt(1, review.getRating());
                ps.setString(2, review.getReviewText());
                ps.setInt(3, review.getReviewerId());
                ps.setInt(4, review.getReviewedUserId());

                status = ps.executeUpdate() > 0;

            } else {

                String insertQuery =
                        "INSERT INTO reviews(reviewer_id, reviewed_user_id, rating, review_text) VALUES(?,?,?,?)";

                PreparedStatement ps =
                        con.prepareStatement(insertQuery);

                ps.setInt(1, review.getReviewerId());
                ps.setInt(2, review.getReviewedUserId());
                ps.setInt(3, review.getRating());
                ps.setString(4, review.getReviewText());

                status = ps.executeUpdate() > 0;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<UserReview> getReviewsForUser(int userId) {

        List<UserReview> reviews =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT r.*, u.name " +
                    "FROM reviews r " +
                    "JOIN users u ON r.reviewer_id = u.id " +
                    "WHERE r.reviewed_user_id=? " +
                    "ORDER BY r.id DESC";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                UserReview review =
                        new UserReview();

                review.setId(rs.getInt("id"));
                review.setReviewerId(
                        rs.getInt("reviewer_id"));

                review.setReviewedUserId(
                        rs.getInt("reviewed_user_id"));

                review.setRating(
                        rs.getInt("rating"));

                review.setReviewText(
                        rs.getString("review_text"));

                review.setReviewerName(
                        rs.getString("name"));

                reviews.add(review);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public double getAverageRating(int userId) {

        double average = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT AVG(rating) avg_rating FROM reviews WHERE reviewed_user_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                average =
                        rs.getDouble("avg_rating");
            }
            } catch(Exception e) {
            e.printStackTrace();
        }

        return average;
    }
}