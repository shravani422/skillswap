/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.ConnectionNote;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConnectionNoteDAO {

    public boolean addNote(ConnectionNote note){

        boolean status = false;

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
            "INSERT INTO connection_notes(sender_id,receiver_id,note_text) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, note.getSenderId());
            ps.setInt(2, note.getReceiverId());
            ps.setString(3, note.getNoteText());

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

    public List<ConnectionNote> getNotesBetweenUsers(
            int user1,
            int user2){

        List<ConnectionNote> notes =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
            "SELECT * FROM connection_notes " +
            "WHERE (sender_id=? AND receiver_id=?) " +
            "OR (sender_id=? AND receiver_id=?) " +
            "ORDER BY created_at ASC";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, user1);
            ps.setInt(2, user2);
            ps.setInt(3, user2);
            ps.setInt(4, user1);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                ConnectionNote note =
                        new ConnectionNote();

                note.setNoteId(
                        rs.getInt("note_id"));

                note.setSenderId(
                        rs.getInt("sender_id"));

                note.setReceiverId(
                        rs.getInt("receiver_id"));

                note.setNoteText(
                        rs.getString("note_text"));

                note.setCreatedAt(
                        rs.getString("created_at"));

                notes.add(note);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return notes;
    }
}