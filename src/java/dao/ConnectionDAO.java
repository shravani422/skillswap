/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ConnectionDAO {

    public void createConnection(int user1, int user2){

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO connections(user1_id, user2_id) VALUES(?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, user1);
            ps.setInt(2, user2);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}