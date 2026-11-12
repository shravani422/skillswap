/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.ConnectionRequest;
import util.DBConnection;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ConnectionRequestDAO {

    public boolean sendRequest(ConnectionRequest request){

        boolean status = false;

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
            "INSERT INTO connection_requests(sender_id, receiver_id, status) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, request.getSenderId());
            ps.setInt(2, request.getReceiverId());
            ps.setString(3, "PENDING");

            int rows =
                    ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public String getRequestStatus(int senderId,
                               int receiverId)
{
    String status = null;

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
"SELECT status FROM connection_requests WHERE sender_id=? AND receiver_id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, senderId);
        ps.setInt(2, receiverId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){
            status =
                    rs.getString("status");
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return status;
}
    public ResultSet getPendingRequests(int receiverId){

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
"SELECT cr.request_id, " +
"u.id, u.name, u.city, u.bio, " +
"u.skills, u.learning, " +
"u.certificate_title, " +
"u.certificate_issuer " +
"FROM connection_requests cr " +
"JOIN users u ON cr.sender_id = u.id " +
"WHERE cr.receiver_id=? " +
"AND cr.status='PENDING'";
        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, receiverId);

        return ps.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return null;
}
    public void updateRequestStatus(
        int requestId,
        String status){

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
"UPDATE connection_requests SET status=? WHERE request_id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setString(1, status);
        ps.setInt(2, requestId);

        ps.executeUpdate();

    }catch(Exception e){
        e.printStackTrace();
    }
}
    public ConnectionRequest getRequestById(int requestId){

    ConnectionRequest req = null;

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT * FROM connection_requests WHERE request_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, requestId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            req = new ConnectionRequest();

            req.setRequestId(
                    rs.getInt("request_id"));

            req.setSenderId(
                    rs.getInt("sender_id"));

            req.setReceiverId(
                    rs.getInt("receiver_id"));

            req.setStatus(
                    rs.getString("status"));
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return req;
}
    public int getNotificationCount(int userId){

    int count = 0;

    try{

        Connection con = DBConnection.getConnection();

        String sql =
        "SELECT COUNT(*) FROM connection_requests WHERE receiver_id=? AND status='PENDING'";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            count = rs.getInt(1);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return count;
}
    public ResultSet getSentRequests(int senderId){

    try{

        Connection con =
                DBConnection.getConnection();

        String query =
        "SELECT cr.request_id, cr.status, " +
        "u.id, u.name, u.city, u.skills " +
        "FROM connection_requests cr " +
        "JOIN users u ON cr.receiver_id = u.id " +
        "WHERE cr.sender_id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, senderId);

        return ps.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return null;
}
}