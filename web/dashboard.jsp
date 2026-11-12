<%-- 
    Document   : dashboard
    Created on : 28-May-2026, 2:02:17 pm
    Author     : shrav
--%>

<%@page import="dao.ConnectionRequestDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("currentUser");

    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>SkillSwap Dashboard</title>
    <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body{
            background: #F5F7FF;
        }

        .navbar{
            width: 100%;
            background: white;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .logo{
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-box{
            width: 50px;
            height: 50px;
            background: #6C63FF;
            border-radius: 14px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .logo h1{
            color: #2A2A2A;
            font-size: 28px;
        }

        .logout-btn{
            text-decoration: none;
            background: #6C63FF;
            color: white;
            padding: 12px 22px;
            border-radius: 12px;
            transition: 0.3s;
            font-weight: 600;
        }

        .logout-btn:hover{
            background: #574BDB;
        }

        .main{
            padding: 50px 60px;
        }

        .welcome-card{
            background: linear-gradient(135deg, #6C63FF, #8B84FF);
            color: white;
            padding: 40px;
            border-radius: 24px;
            margin-bottom: 35px;
            box-shadow: 0 10px 30px rgba(108,99,255,0.2);
        }

        .welcome-card h2{
            font-size: 38px;
            margin-bottom: 10px;
        }

        .welcome-card p{
            font-size: 16px;
            opacity: 0.95;
        }

        .cards{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 25px;
}
        .card{
            background: white;
            width:100%;
            padding: 30px;
            border-radius: 22px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            transition: 0.3s;
            min-height:180px;
        }

        .card:hover{
            transform: translateY(-5px);
        }

        .card h3{
            color: #2A2A2A;
            margin-bottom: 12px;
        }

        .card p{
            color: #777;
            line-height: 1.6;
            font-size: 14px;
        }
       .nav-buttons{
    display:flex;
    gap:15px;
    align-items:center;
}

.nav-btn{
    text-decoration:none;
    background:#6C63FF;
    color:white;
    padding:12px 22px;
    border-radius:12px;
    font-weight:600;
    transition:0.3s;
}

.nav-btn:hover{
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
.notification{
    position:relative;
}

.bell{
    position:relative;
    text-decoration:none;
    color:#6C63FF;
    font-size:28px;
}

.count{
    position:absolute;
    top:-10px;
    right:-10px;

    color:#6C63FF;
    font-size:14px;
    font-weight:bold;
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
      
      <%
ConnectionRequestDAO dao = new ConnectionRequestDAO();
int count = dao.getNotificationCount(user.getId());
%>

<div class="notification">

    <a href="requests.jsp" class="bell">

        <i class="fa-regular fa-bell"></i>

        <% if(count > 0){ %>

        <span class="count">
            <%= count %>
        </span>

        <% } %>

    </a>

</div>
       <a href="sentRequests.jsp">
    <i class="fa-solid fa-paper-plane"></i>
</a>
    <a href="explore.jsp">
        Explore Users
    </a>

    <a href="login.jsp">
        Logout
    </a>

</div>
</div>

<div class="main">

    <div class="welcome-card">

        <h2>
            Welcome, <%= user.getName() %> 👋
        </h2>

        <p>
            Ready to learn something new today?
        </p>

    </div>

    

<div class="cards">

    <div class="card">

        <h3>About Me</h3>

        <p>
            <%= user.getBio() %>
        </p>

    </div>

    <div class="card">

        <h3>Skills I Teach</h3>

        <p>
            <%= user.getSkills() %>
        </p>

    </div>

    <div class="card">

        <h3>Skills I Want To Learn</h3>

        <p>
            <%= user.getLearning() %>
        </p>

    </div>

  <div class="card">

    <h3>🏅 Certification</h3>

    <h4 style="margin:10px 0;color:#333;">
    <%= user.getCertificateTitle() %>
</h4>

<p>
    Issued by <%= user.getCertificateIssuer() %>
</p>
</div>
<a href="connections.jsp"
   style="text-decoration:none;">

    <div class="card">

        <h3>🤝 My Connections</h3>

        <p>
            View all accepted skill swap partners
            and manage your connections.
        </p>

    </div>

</a>
    <a href="editProfile.jsp"
       style="text-decoration:none;">

        <div class="card">

            <h3>Edit Profile</h3>

            <p>
                Update your profile details,
                certifications and skills.
            </p>

        </div>

    </a>

</div>

</body>

</html>