/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

public class UserDAO {

    public boolean registerUser(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO users(name,email,password,city,bio) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getCity());
            ps.setString(5, user.getBio());

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public User loginUser(String email, String password) {

    User user = null;

    try {

        Connection con = DBConnection.getConnection();

        String query = "SELECT * FROM users WHERE email=? AND password=?";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setCity(rs.getString("city"));
            user.setBio(rs.getString("bio"));
            user.setSkills(rs.getString("skills"));
user.setLearning(rs.getString("learning"));

user.setCertificateTitle(
        rs.getString("certificate_title"));

user.setCertificateIssuer(
        rs.getString("certificate_issuer"));

user.setCertificateDescription(
        rs.getString("certificate_description"));

user.setCertificateFile(
        rs.getString("certificate_file"));
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return user;
}
    public boolean updateProfile(User user) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

       String query =
"UPDATE users SET bio=?, skills=?, learning=?, certificate_title=?, certificate_issuer=?, certificate_description=?, certificate_file=? WHERE id=?";
PreparedStatement ps = con.prepareStatement(query);
       ps.setString(1, user.getBio());
ps.setString(2, user.getSkills());
ps.setString(3, user.getLearning());

ps.setString(4, user.getCertificateTitle());
ps.setString(5, user.getCertificateIssuer());
ps.setString(6, user.getCertificateDescription());
ps.setString(7, user.getCertificateFile());

ps.setInt(8, user.getId());
        int rows = ps.executeUpdate();

        if(rows > 0){
            status = true;
        }

    } catch(Exception e){
        e.printStackTrace();
    }

    return status;
}
    public List<User> getAllUsers(){

    List<User> users = new ArrayList<>();

    try{

        Connection con = DBConnection.getConnection();

        String query =
                "SELECT * FROM users";

        PreparedStatement ps =
                con.prepareStatement(query);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            User user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setCity(rs.getString("city"));
            user.setSkills(rs.getString("skills"));
            user.setLearning(rs.getString("learning"));
            user.setBio(rs.getString("bio"));

            users.add(user);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return users;
}
    public User getUserById(int id){

    User user = null;

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
                "SELECT * FROM users WHERE id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, id);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setCity(rs.getString("city"));

            user.setBio(rs.getString("bio"));
            user.setSkills(rs.getString("skills"));
            user.setLearning(rs.getString("learning"));

            user.setCertificateTitle(
                    rs.getString("certificate_title"));

            user.setCertificateIssuer(
                    rs.getString("certificate_issuer"));

            user.setCertificateDescription(
                    rs.getString("certificate_description"));

            user.setCertificateFile(
                    rs.getString("certificate_file"));
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return user;
}
    public List<User> searchUsers(String keyword){

    List<User> users = new ArrayList<>();

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
"SELECT * FROM users WHERE " +
"LOWER(name) LIKE LOWER(?) OR " +
"LOWER(city) LIKE LOWER(?) OR " +
"LOWER(skills) LIKE LOWER(?) OR " +
"LOWER(learning) LIKE LOWER(?)";

        PreparedStatement ps =
                con.prepareStatement(query);

        String search = "%" + keyword + "%";

        ps.setString(1, search);
        ps.setString(2, search);
        ps.setString(3, search);
        ps.setString(4, search);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            User user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setCity(rs.getString("city"));
            user.setSkills(rs.getString("skills"));
            user.setLearning(rs.getString("learning"));
            user.setBio(rs.getString("bio"));

            users.add(user);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return users;
}
}