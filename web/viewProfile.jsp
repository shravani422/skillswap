<%-- 
    Document   : viewProfile.jsp
    Created on : 03-Jun-2026, 7:58:01 pm
    Author     : shrav
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.ReviewDAO" %>
<%@ page import="model.UserReview" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ConnectionRequestDAO" %>

<%
    User currentUser =
            (User) session.getAttribute("currentUser");

    if(currentUser == null){
        response.sendRedirect("login.jsp");
        return;
    }

    int userId =
            Integer.parseInt(request.getParameter("id"));

    UserDAO dao = new UserDAO();

    User user =
            dao.getUserById(userId);
ReviewDAO reviewDAO =
        new ReviewDAO();

double averageRating =
        reviewDAO.getAverageRating(userId);

List<UserReview> reviews =
        reviewDAO.getReviewsForUser(userId);
    if(user == null){
        response.sendRedirect("explore.jsp");
        return;
    }
    ConnectionRequestDAO requestDAO =
        new ConnectionRequestDAO();

String requestStatus =
        requestDAO.getRequestStatus(
                currentUser.getId(),
                user.getId());
System.out.println("request status="+requestStatus);
%>

<!DOCTYPE html>
<html>

<head>

    <title><%= user.getName() %> - SkillSwap</title>

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

        .nav-links{
            display:flex;
            gap:30px;
            align-items:center;
        }

        .nav-links a{
            text-decoration:none;
            color:#6C63FF;
            font-weight:600;
            transition:0.3s;
        }

        .nav-links a:hover{
            color:#574BDB;
        }

        .container{
            max-width:1000px;
            margin:auto;
            padding:50px 30px;
        }

        .profile-header{
            background:linear-gradient(135deg,#6C63FF,#8B84FF);
            color:white;
            padding:40px;
            border-radius:24px;
            margin-bottom:30px;
            box-shadow:0 10px 30px rgba(108,99,255,0.2);
        }

        .profile-header h1{
            font-size:40px;
            margin-bottom:10px;
        }

        .profile-header p{
            font-size:19px;
        }

        .cards{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
            gap:25px;
        }

        .card{
            background:white;
            padding:25px;
            border-radius:20px;
            box-shadow:0 8px 20px rgba(0,0,0,0.06);
        }

        .card h2{
            color:#2A2A2A;
            margin-bottom:15px;
            font-size:22px;
        }

        .card p{
            color:#666;
            line-height:1.7;
            font-size:18px;
        }
.certificate-btn{
    display:inline-block;
    margin-top:15px;
    padding:10px 18px;
    background:#6C63FF;
    color:white;
    text-decoration:none;
    border-radius:10px;
    font-weight:600;
}
.request-btn{

    width:100%;
    margin-top:20px;

    padding:15px;

    border:none;
    border-radius:14px;

    background:white;
    color:#6C63FF;

    font-size:16px;
    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.request-btn:hover{

    transform:translateY(-2px);

    background:#F5F5FF;

    box-shadow:0 8px 20px rgba(0,0,0,0.15);
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

        <a href="explore.jsp">
            Explore Users
        </a>

        <a href="dashboard.jsp">
            Dashboard
        </a>

        <a href="login.jsp">
            Logout
        </a>

    </div>

</div>

<div class="container">

    <div class="profile-header">

    <h1>
        <%= user.getName() %>
    </h1>

    <p>
        📍 <%= user.getCity() %>
    </p>

    <p>
        ✉ <%= user.getEmail() %>
    </p>
<p>
    ⭐ Rating:
    <%= String.format("%.1f", averageRating) %>/5
</p>
<%
if(requestStatus == null){
%>

<form action="SendRequestServlet" method="post">

    <input type="hidden"
           name="receiverId"
           value="<%= user.getId() %>">

    <button class="request-btn" type="submit">
        🤝 Request Skill Swap
    </button>

</form>

<%
}else if(requestStatus.equals("PENDING")){
%>

<button class="request-btn" disabled>
    ⏳ Request Sent
</button>

<%
}else if(requestStatus.equals("ACCEPT")
      || requestStatus.equals("ACCEPTED")){
%>

<button class="request-btn" disabled>
    ✅ Request Accepted
</button>

<%
}else if(requestStatus.equals("REJECT")
      || requestStatus.equals("REJECTED")){
%>

<button class="request-btn" disabled>
    ❌ Request Rejected
</button>

<%
}
%>


</div>

    <div class="cards">

        <div class="card">

            <h2>About Me</h2>

            <p>
                <%= user.getBio() == null ? "Not Added" : user.getBio() %>
            </p>

        </div>

        <div class="card">

            <h2>Skills I Teach</h2>

            <p>
                <%= user.getSkills() == null ? "Not Added" : user.getSkills() %>
            </p>

        </div>
            <div class="card">

            <h2>Skills I Want To Learn</h2>

            <p>
                <%= user.getLearning() == null ? "Not Added" : user.getLearning() %>
            </p>

        </div>

       <div class="card">

    <h2>🏅 Certification</h2>

    <p>
        <strong>
            <%= user.getCertificateTitle() == null ?
                "Not Added" :
                user.getCertificateTitle() %>
        </strong>
    </p>

    <br>

    <p>
        <strong>Issued By:</strong>
        <%= user.getCertificateIssuer() == null ?
            "Not Added" :
            user.getCertificateIssuer() %>
    </p>

    <br>

    <p>
        <%= user.getCertificateDescription() == null ?
            "No Description" :
            user.getCertificateDescription() %>
    </p>

    <%
    if(user.getCertificateFile() != null &&
       !user.getCertificateFile().isEmpty()){
    %>

    <a href="uploads/<%= user.getCertificateFile() %>"
       target="_blank"
       class="certificate-btn">

       View Certificate

    </a>

    <%
    }
    %>

</div>
    

    </div>
    <div class="card"
     style="margin-top:30px;">

    <h2>⭐ Reviews</h2>

    <%
    if(reviews.isEmpty()){
    %>

        <p>No reviews yet.</p>

    <%
    } else {

        for(UserReview review : reviews){
    %>

        <div style="
            border-bottom:1px solid #eee;
            padding:15px 0;">

            <h3>
                <%= review.getReviewerName() %>
            </h3>

            <p>

                <%
                for(int i=0;
                    i<review.getRating();
                    i++){
                %>

                    ⭐

                <%
                }
                %>

            </p>

            <p>
                <%= review.getReviewText() %>
            </p>

        </div>

    <%
        }
    }
    %>

</div>
    <%
if(currentUser.getId() != user.getId()){
%>

<div class="card"
     style="margin-top:30px;">

    <h2>Leave a Review</h2>

    <form action="SubmitReviewServlet"
          method="post">

        <input type="hidden"
               name="reviewedUserId"
               value="<%= user.getId() %>">

        <label>
            Rating
        </label>

        <select name="rating"
                required>

            <option value="5">5 Stars</option>
            <option value="4">4 Stars</option>
            <option value="3">3 Stars</option>
            <option value="2">2 Stars</option>
            <option value="1">1 Star</option>

        </select>

        <br><br>

        <textarea
            name="reviewText"
            rows="4"
            style="width:100%;"
            required></textarea>

        <br><br>

        <button type="submit">
            Submit Review
        </button>

    </form>

</div>

<%
}
%>

</div>
</body>

</html>