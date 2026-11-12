<%-- 
    Document   : notes
    Created on : 06-Jun-2026, 11:28:53 pm
    Author     : shrav
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.ConnectionNote" %>
<%@ page import="dao.ConnectionNoteDAO" %>
<%@ page import="dao.UserDAO" %>

<%
User currentUser =
        (User)session.getAttribute("currentUser");

if(currentUser == null){
    response.sendRedirect("login.jsp");
    return;
}

int otherUserId =
Integer.parseInt(
        request.getParameter("userId"));

UserDAO userDAO =
        new UserDAO();

User otherUser =
        userDAO.getUserById(otherUserId);

ConnectionNoteDAO noteDAO =
        new ConnectionNoteDAO();

List<ConnectionNote> notes =
        noteDAO.getNotesBetweenUsers(
                currentUser.getId(),
                otherUserId);
%>

<!DOCTYPE html>
<html>

<head>

<title>Skill Swap Notes</title>

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

.header-bar{
    background:linear-gradient(135deg,#6C63FF,#8B84FF);
    padding:25px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 25px rgba(108,99,255,0.25);
}

.page-title{
    color:white;
    font-size:30px;
    font-weight:700;
}

.back-btn{
    text-decoration:none;
    background:white;
    color:#6C63FF;
    padding:12px 22px;
    border-radius:12px;
    font-weight:700;
    transition:0.3s;
}

.back-btn:hover{
    transform:translateY(-2px);
}

.container{
    width:85%;
    max-width:1000px;
    margin:40px auto;
}

.header{
    background:white;
    padding:30px;
    border-radius:24px;
    margin-bottom:25px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
}

.header h2{
    color:#2A2A2A;
}

.notes-box{
    background:white;
    padding:30px;
    border-radius:24px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
}

.note{
    padding:18px;
    margin-bottom:18px;
    border-radius:16px;
    background:#F3F4FF;
    border-left:5px solid #6C63FF;
}

.sender{
    font-weight:700;
    color:#6C63FF;
    margin-bottom:8px;
}

.note-text{
    color:#444;
    line-height:1.7;
}

.time{
    font-size:12px;
    color:#777;
    margin-top:10px;
}

.empty{
    text-align:center;
    padding:25px;
    color:#777;
    font-size:18px;
}

.form-title{
    margin-top:25px;
    margin-bottom:12px;
    color:#2A2A2A;
}

textarea{
    width:100%;
    min-height:140px;
    border:1px solid #ddd;
    border-radius:15px;
    padding:15px;
    resize:vertical;
    font-size:15px;
    outline:none;
}

textarea:focus{
    border-color:#6C63FF;
}

button{
    background:#6C63FF;
    color:white;
    border:none;
    padding:14px 28px;
    border-radius:12px;
    margin-top:15px;
    cursor:pointer;
    font-weight:600;
    transition:0.3s;
}

button:hover{
    background:#574BDB;
}

</style>

</head>

<body>

<div class="header-bar">

    <div class="page-title">
        📝 Skill Swap Notes
    </div>

    <a href="connections.jsp"
       class="back-btn">

        ← My Connections

    </a>

</div>

<div class="container">

<div class="header">

    <h2>
        Notes with <%= otherUser.getName() %>
    </h2>

    <p style="margin-top:10px;color:#666;">
        Share learning resources, practice tasks,
        meeting plans and progress updates.
    </p>

</div>

<div class="notes-box">

<%
if(notes.isEmpty()){
%>

<div class="empty">

    No notes yet. Start the conversation by posting the first note.

</div>

<%
}
%>

<%
for(ConnectionNote note : notes){
%>

<div class="note">

    <div class="sender">

    <%
    if(note.getSenderId()
            == currentUser.getId()){
    %>

        You

    <%
    }else{
    %>

        <%= otherUser.getName() %>

    <%
    }
    %>

    </div>

    <div class="note-text">

        <%= note.getNoteText() %>

    </div>

    <div class="time">

        <%= note.getCreatedAt() %>

    </div>

</div>

<%
}
%>

<h3 class="form-title">
    Add New Note
</h3>

<form action="AddNoteServlet"
      method="post">

    <input type="hidden"
           name="receiverId"
           value="<%= otherUserId %>">

    <textarea
        name="noteText"
        placeholder="Share a learning resource, ask a question, suggest a practice task, or leave an update..."></textarea>

    <br>

    <button type="submit">

        Post Note

    </button>

</form>

</div>

</div>

</body>

</html>