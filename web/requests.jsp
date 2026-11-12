<%-- 
    Document   : requests
    Created on : 05-Jun-2026, 8:23:34?pm
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
        dao.getPendingRequests(
                currentUser.getId());
%>

<!DOCTYPE html>
<html>

<head>

<title>Incoming Requests - SkillSwap</title>

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

.navbar{
    background:white;
    padding:20px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.05);
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:#6C63FF;
}

.back-btn{
    text-decoration:none;
    background:#6C63FF;
    color:white;
    padding:12px 22px;
    border-radius:12px;
    font-weight:600;
}

.back-btn:hover{
    background:#574BDB;
}

.container{
    padding:50px 60px;
}

.title{
    font-size:38px;
    color:#2A2A2A;
    margin-bottom:35px;
}

.request-card{
    background:white;
    border-radius:24px;
    padding:30px;
    margin-bottom:30px;
    border-left:6px solid #6C63FF;
    box-shadow:0 10px 25px rgba(0,0,0,0.06);
    transition:0.3s;
}

.request-card:hover{
    transform:translateY(-4px);
}

.request-card h2{
    color:#2A2A2A;
    margin-bottom:15px;
}

.info{
    color:#555;
    line-height:1.6;
    margin-bottom:12px;
}

.section-title{
    color:#6C63FF;
    font-weight:700;
    margin-top:15px;
    margin-bottom:8px;
}

.btn-group{
    display:flex;
    align-items:center;
    gap:15px;
    margin-top:25px;
}

.btn-group form{
    display:flex;
    gap:10px;
}

.profile-btn{
    text-decoration:none;
    background:#F0F2FF;
    color:#6C63FF;
    padding:12px 20px;
    border-radius:12px;
    font-weight:600;
}

.accept-btn{
    background:#6C63FF;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:12px;
    cursor:pointer;
    font-weight:600;
}

.accept-btn:hover{
    background:#574BDB;
}

.reject-btn{
    background:#FF4D6D;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:12px;
    cursor:pointer;
    font-weight:600;
}

.reject-btn:hover{
    background:#E63C5C;
}

.empty{
    background:white;
    padding:50px;
    border-radius:20px;
    text-align:center;
    color:#777;
    font-size:20px;
}

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        SkillSwap
    </div>

    <a href="dashboard.jsp"
       class="back-btn">
        Dashboard
    </a>

</div>

<div class="container">

<h1 class="title">
    Incoming Requests
</h1>

<%
boolean found = false;

while(rs.next()){

    found = true;
%>

<div class="request-card">

    <h2>
        <%= rs.getString("name") %>
    </h2>

    <div class="info">
        city:<%= rs.getString("city") %>
    </div>

    <div class="section-title">
        Bio
    </div>

    <div class="info">
        <%= rs.getString("bio") == null ?
                "No bio added" :
                rs.getString("bio") %>
    </div>

    <div class="section-title">
        Skills They Teach
    </div>

    <div class="info">
        <%= rs.getString("skills") == null ?
                "Not specified" :
                rs.getString("skills") %>
    </div>

    <div class="section-title">
        Skills They Want To Learn
    </div>

    <div class="info">
        <%= rs.getString("learning") == null ?
                "Not specified" :
                rs.getString("learning") %>
    </div>

    <div class="section-title">
        Certification
    </div>

    <div class="info">
        <%= rs.getString("certificate_title") == null ?
                "No certification added" :
                rs.getString("certificate_title") %>

        <% if(rs.getString("certificate_issuer") != null){ %>

            - <%= rs.getString("certificate_issuer") %>

        <% } %>
        
        </div>

    <div class="btn-group">

        <a href="viewProfile.jsp?id=<%= rs.getInt("id") %>"
           class="profile-btn">

            View Full Profile

        </a>

        <form action="RequestActionServlet"
              method="post">

            <input type="hidden"
                   name="requestId"
                   value="<%= rs.getInt("request_id") %>">

            <button type="submit"
                    name="action"
                    value="ACCEPTED"
                    class="accept-btn">

                Accept

            </button>

            <button type="submit"
                    name="action"
                    value="REJECTED"
                    class="reject-btn">

                Reject

            </button>

        </form>

    </div>

</div>

<%
}

if(!found){
%>

<div class="empty">
    No pending requests yet.
</div>

<%
}
%>

</div>

</body>

</html>