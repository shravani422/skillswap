<%-- 
    Document   : sentRequests
    Created on : 07-Jun-2026, 11:39:26?pm
    Author     : shrav
--%>

<%@ page import="model.User" %>
<%@ page import="dao.ConnectionRequestDAO" %>
<%@ page import="java.sql.ResultSet" %>

<%
User currentUser =
        (User) session.getAttribute("currentUser");

if(currentUser == null){
    response.sendRedirect("login.jsp");
    return;
}

ConnectionRequestDAO dao =
        new ConnectionRequestDAO();

ResultSet rs =
        dao.getSentRequests(
                currentUser.getId());
%>

<!DOCTYPE html>
<html>

<head>

<title>Sent Requests - SkillSwap</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#F5F7FF;
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

.back-btn:hover{
    background:#574BDB;
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
    border-left:6px solid #6C63FF;
}

.card:hover{
    transform:translateY(-5px);
}

.card h2{
    color:#2A2A2A;
    margin-bottom:12px;
}

.info{
    color:#555;
    margin-bottom:10px;
    line-height:1.6;
}

.status{
    margin-top:15px;
    font-weight:700;
}

.pending{
    color:#FF9800;
}

.accepted{
    color:#28A745;
}

.rejected{
    color:#FF4D6D;
}

.profile-btn{
    display:inline-block;
    margin-top:18px;
    text-decoration:none;
    background:#6C63FF;
    color:white;
    padding:12px 18px;
    border-radius:12px;
    font-weight:600;
}

.empty{
    background:white;
    width:100%;
    padding:50px;
    border-radius:20px;
    text-align:center;
    font-size:20px;
    color:#777;
}

</style>

</head>

<body>

<div class="header">

    <h1> Sent Requests</h1>

    <a href="dashboard.jsp"
       class="back-btn">

        Dashboard

    </a>

</div>

<div class="container">

<%
boolean found = false;

while(rs != null && rs.next()){

    found = true;

    String status =
            rs.getString("status");

    String statusClass = "";

    if(status.equals("PENDING")){
        statusClass = "pending";
    }
    else if(status.equals("ACCEPTED")){
        statusClass = "accepted";
    }
    else{
        statusClass = "rejected";
    }
%>

<div class="card">

    <h2>
        <%= rs.getString("name") %>
    </h2>

    <div class="info">
        City:
        <%= rs.getString("city") %>
    </div>

    <div class="info">
        <strong>Skills:</strong>
        <%= rs.getString("skills") %>
    </div>

    <div class="status <%= statusClass %>">

        Status:
        <%= status %>

    </div>

    <a href="viewProfile.jsp?id=<%= rs.getInt("id") %>"
       class="profile-btn">

        View Profile

    </a>

</div>

<%
}

if(!found){
%>

<div class="empty">

    You haven't sent any requests yet.

</div>

<%
}
%>

</div>

</body>

</html>