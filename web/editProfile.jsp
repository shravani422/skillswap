<%-- 
    Document   : editProfile
    Created on : 28-May-2026, 3:20:50 pm
    Author     : shrav
--%>

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

    <title>Edit Profile</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI', sans-serif;
        }

        body{
            background:#F5F7FF;
            display:flex;
            justify-content:center;
            align-items:center;
            min-height:100vh;
        }

        .container{
            width:700px;
            background:white;
            padding:40px;
            border-radius:24px;
            box-shadow:0 10px 30px rgba(0,0,0,0.08);
        }

        h1{
            color:#2A2A2A;
            margin-bottom:10px;
        }

        .subtitle{
            color:#777;
            margin-bottom:30px;
        }

        input, textarea{
            width:100%;
            padding:15px;
            margin-bottom:18px;
            border:1px solid #E2E5F1;
            border-radius:14px;
            background:#F8F9FF;
            font-size:15px;
        }

        textarea{
            resize:none;
            height:100px;
        }

        input:focus,
        textarea:focus{
            outline:none;
            border-color:#6C63FF;
            box-shadow:0 0 0 4px rgba(108,99,255,0.12);
            background:white;
        }

        button{
            width:100%;
            padding:16px;
            background:#6C63FF;
            color:white;
            border:none;
            border-radius:14px;
            font-size:16px;
            font-weight:600;
            cursor:pointer;
            transition:0.3s;
        }

        button:hover{
            background:#574BDB;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Your Profile</h1>

    <p class="subtitle">
        Add your skills, certifications and interests.
    </p>

<form action="UpdateProfileServlet"
      method="post"
      enctype="multipart/form-data">

    <textarea name="bio"
              placeholder="Your Bio"><%= user.getBio() == null ? "" : user.getBio() %></textarea>

    <textarea name="skills"
              placeholder="Skills You Can Teach"><%= user.getSkills() == null ? "" : user.getSkills() %></textarea>

    <textarea name="learning"
              placeholder="Skills You Want To Learn"><%= user.getLearning() == null ? "" : user.getLearning() %></textarea>

    <input type="text"
           name="certificateTitle"
           value="<%= user.getCertificateTitle() == null ? "" : user.getCertificateTitle() %>"
           placeholder="Certificate Title">

    <input type="text"
           name="certificateIssuer"
           value="<%= user.getCertificateIssuer() == null ? "" : user.getCertificateIssuer() %>"
           placeholder="Issued By">

    <textarea name="certificateDescription"
              placeholder="Describe what this certification demonstrates"><%= user.getCertificateDescription() == null ? "" : user.getCertificateDescription() %></textarea>

    <label style="font-weight:600;
                  color:#444;
                  display:block;
                  margin-bottom:10px;">

        Upload Certificate

    </label>
         <p style="margin-top:8px;color:#666;font-size:14px;">

Current Certificate:

<%= user.getCertificateFile() == null
    ? " No file uploaded"
    : " " + user.getCertificateFile() %>

</p>

    <input type="file"
           name="certificateFile"
           accept=".pdf,.jpg,.jpeg,.png">

    <button type="submit">
        Save Profile
    </button>

</form>

</div>

</body>

</html>