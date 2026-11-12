<%-- 
    Document   : explore.jsp
    Created on : 03-Jun-2026, 7:14:39 pm
    Author     : shrav
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>

<%
    User currentUser =
            (User) session.getAttribute("currentUser");

    if(currentUser == null){
        response.sendRedirect("login.jsp");
        return;
    }

   UserDAO dao = new UserDAO();

String search =
        request.getParameter("search");

List<User> users;

if(search != null &&
   !search.trim().isEmpty()){

    users =
        dao.searchUsers(search);

}else{

    users =
        dao.getAllUsers();
}
%>

<!DOCTYPE html>
<html>

<head>

    <title>Explore Users - SkillSwap</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI', sans-serif;
        }

        body{
            background:#F5F7FF;
        }

        .navbar{
            width:100%;
            background:white;
            padding:20px 60px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            box-shadow:0 4px 15px rgba(0,0,0,0.05);
        }

        .logo{
            display:flex;
            align-items:center;
            gap:12px;
        }

        .logo-box{
            width:50px;
            height:50px;
            background:#6C63FF;
            border-radius:14px;
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
            font-size:24px;
            font-weight:bold;
        }

        .logo h1{
            color:#2A2A2A;
            font-size:28px;
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
            font-size:36px;
            color:#2A2A2A;
            margin-bottom:30px;
        }

        .users-grid{
            display:flex;
            flex-wrap:wrap;
            gap:25px;
        }

        .user-card{
            background:white;
            width:300px;
            padding:25px;
            border-radius:20px;
            box-shadow:0 8px 20px rgba(0,0,0,0.06);
            transition:0.3s;
            display:flex;
            flex-direction:column;
        }

        .user-card:hover{
            transform:translateY(-5px);
        }

        .user-card h2{
            color:#2A2A2A;
            margin-bottom:12px;
        }

        .user-card p{
            color:#666;
            margin-bottom:10px;
            line-height:1.5;
        }

        .profile-btn{
            display:inline-block;
            margin-top:auto;
            text-decoration:none;
            background:#6C63FF;
            color:white;
            padding:10px 18px;
            border-radius:10px;
            font-weight:600;
            width:140px;
            text-align:center;
        }

        .profile-btn:hover{
            background:#574BDB;
        }
       .nav-links{
    display:flex;
    gap:30px;
    align-items:center;
}

.nav-links a{
    text-decoration:none;
    color:#6C63FF;
    font-weight:600;
    font-size:20px;
    transition:0.3s;
}

.nav-links a:hover{
    color:#574BDB;
}
    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">

        <div class="logo-box">
            ✦
        </div>

        <h1>SkillSwap</h1>

    </div>

   

    <div class="nav-links">

    <a href="dashboard.jsp">
        Dashboard
    </a>

    

</div>
</div>

</div>
<div class="container">
    <form action="explore.jsp"
      method="get"
      style="
      display:flex;
      gap:10px;
      margin-bottom:30px;">

    <input
        type="text"
        name="search"
        placeholder="Search skills, city or users..."
        value="<%= request.getParameter("search") == null ? "" : request.getParameter("search") %>"
        style="
        flex:1;
        padding:14px 18px;
        border:1px solid #ddd;
        border-radius:12px;
        font-size:16px;">

    <button
        type="submit"
        style="
        background:#6C63FF;
        color:white;
        border:none;
        padding:14px 22px;
        border-radius:12px;
        cursor:pointer;
        font-weight:600;">

        Search

    </button>

</form>
           <%
if(users.isEmpty()){
%>

<div class="card">
    <h2>No matching users found.</h2>
</div>

<%
}
%>

    <h1 class="title">
        Explore Users
    </h1>

    <div class="users-grid">

        <% for(User u : users){ %>

            <% if(u.getId() != currentUser.getId()){ %>

                <div class="user-card">

                    <h2>
                        <%= u.getName() %>
                    </h2>

                    <p>
                        📍 <%= u.getCity() %>
                    </p>

                    <p>
                        <strong>Teaches:</strong><br>
                        <%= u.getSkills() == null ? "Not Added" : u.getSkills() %>
                    </p>

                    <p>
                        <strong>Learning:</strong><br>
                        <%= u.getLearning() == null ? "Not Added" : u.getLearning() %>
                    </p>
                    <a href="viewProfile.jsp?id=<%= u.getId() %>"
                       class="profile-btn">
                        View Profile
                    </a>

                </div>

            <% } %>

        <% } %>

    </div>

</div>

</body>

</html>