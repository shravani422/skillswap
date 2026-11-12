/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet; // use your package

import dao.ConnectionDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import model.ConnectionRequest;
import dao.ConnectionRequestDAO;
import util.DBConnection;

@WebServlet("/RequestActionServlet")
public class RequestActionServlet
        extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int requestId =
                Integer.parseInt(
                        request.getParameter("requestId"));

        String action =
                request.getParameter("action");
        ConnectionRequestDAO requestDAO = new ConnectionRequestDAO();
ConnectionDAO connectionDAO = new ConnectionDAO();

// get full request details
ConnectionRequest req = requestDAO.getRequestById(requestId);

int senderId = req.getSenderId();
int receiverId = req.getReceiverId();

if(action.equals("ACCEPTED")){

    requestDAO.updateRequestStatus(requestId, "ACCEPTED");

    // CREATE CONNECTION
    connectionDAO.createConnection(senderId, receiverId);

}else if(action.equals("REJECTED")){

    requestDAO.updateRequestStatus(requestId, "REJECTED");
}

      

        response.sendRedirect(
                "requests.jsp");
    }
    public ConnectionRequest getRequestById(int requestId){

    ConnectionRequest req = null;

    try{

        Connection con =DBConnection.getConnection();

        String query =
        "SELECT * FROM connection_requests WHERE request_id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, requestId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            req = new ConnectionRequest();

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
}