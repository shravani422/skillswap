<%-- 
    Document   : connections
    Created on : 06-Jun-2026, 9:34:13?pm
    Author     : shrav
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@ page import="util.DBConnection" %>

<%
User currentUser =
        (User) session.getAttribute("currentUser");

if(currentUser == null){
    response.sendRedirect("login.jsp");
    return;
}

Connection con = DBConnection.getConnection();

String sql =
"SELECT u.* FROM connections c " +
"JOIN users u ON (u.id = c.user1_id OR u.id = c.user2_id) " +
"WHERE (c.user1_id=? OR c.user2_id=?) AND u.id != ?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setInt(1, currentUser.getId());
ps.setInt(2, currentUser.getId());
ps.setInt(3, currentUser.getId());

ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>

<title>My Connections</title>

<style>

body{
    font-family:'Segoe UI',sans-serif;
    background:#F5F7FF;
    margin:0;
}

.header{
    background:white;
    padding:25px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.05);
}

.header h1{
    color:#6C63FF;
}

.back-btn{
    text-decoration:none;
    background:#6C63FF;
    color:white;
    padding:12px 20px;
    border-radius:12px;
    font-weight:600;
}

.container{
    padding:40px;
    display:flex;
    flex-wrap:wrap;
    gap:25px;
}

.card{
    background:white;
    width:380px;
    padding:25px;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.card h2{
    color:#2A2A2A;
    margin-bottom:12px;
}

.city{
    color:#666;
    margin-bottom:10px;
}

.skills{
    color:#555;
    line-height:1.6;
    min-height:60px;
}

.btn-group{
    display:flex;
    gap:12px;
    margin-top:20px;
}

.profile-btn,
.notes-btn{

    text-decoration:none;
    color:white;
    padding:12px 18px;
    border-radius:12px;
    font-weight:600;
}

.profile-btn{
    background:#6C63FF;
}

.notes-btn{
    background:#8B84FF;
}
</style>

</head>

<body>

<div class="header">

    <h1>🤝 My Connections</h1>

    <a href="dashboard.jsp"
       class="back-btn">

        Dashboard

    </a>

</div>

<div class="container">

<%
while(rs.next()){
%>

<div class="card">

    <h2>
        <%= rs.getString("name") %>
    </h2>

    <div class="city">
        City: <%= rs.getString("city") %>
    </div>

    <div class="skills">
        <strong>Skills:</strong>
        <%= rs.getString("skills") %>
    </div>

    <div class="btn-group">

        <a href="viewProfile.jsp?id=<%= rs.getInt("id") %>"
           class="profile-btn">

            View Profile

        </a>

        <a href="notes.jsp?userId=<%= rs.getInt("id") %>"
           class="notes-btn">

            📝 View Notes

        </a>

    </div>

</div>

<%
}
%>

</div>
</body>
</html>