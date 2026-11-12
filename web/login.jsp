<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>SkillSwap Login</title>

    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body{
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #EEF2FF, #F8F9FF);
        }

        .container{
            width: 900px;
            height: 550px;
            background: white;
            border-radius: 28px;
            display: flex;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.08);
        }

        /* LEFT PANEL */

        .left-panel{
            width: 45%;
            background: linear-gradient(135deg, #6C63FF, #8B84FF);
            color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .brand{
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 25px;
        }

        .logo{
            width: 65px;
            height: 65px;
            border-radius: 18px;
            background: rgba(255,255,255,0.18);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            font-weight: bold;
            border: 1px solid rgba(255,255,255,0.2);
        }

        .brand h1{
            font-size: 34px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .left-panel h2{
            font-size: 38px;
            line-height: 1.2;
            margin-bottom: 18px;
        }

        .left-panel p{
            color: rgba(255,255,255,0.88);
            line-height: 1.7;
            font-size: 15px;
        }

        /* RIGHT PANEL */

        .right-panel{
            width: 55%;
            padding: 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-title{
            font-size: 36px;
            font-weight: 700;
            color: #2A2A2A;
            margin-top: 21px;
            margin-bottom: 10px;
            letter-spacing: -1px;
            line-height: 1.1;
        }

        .form-subtitle{
            color: #8A8A9E;
            margin-bottom: 35px;
            font-size: 15px;
            line-height: 1.5;
        }

        input{
            width: 100%;
            padding: 15px;
            margin-bottom: 16px;
            border: 1px solid #E2E5F1;
            border-radius: 14px;
            font-size: 15px;
            background-color: #F8F9FF;
            transition: 0.3s;
            color: #222;
        }

        input::placeholder{
            color: #8A8A9E;
        }

        input:focus{
            outline: none;
            border-color: #6C63FF;
            background: white;
            box-shadow: 0 0 0 4px rgba(108,99,255,0.12);
        }

        button{
            width: 100%;
            padding: 16px;
            background: #6C63FF;
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
            letter-spacing: 0.5px;
        }

        button:hover{
            background: #574BDB;
            transform: translateY(-2px);
        }

        .bottom-text{
            text-align: center;
            margin-top: 24px;
            font-size: 14px;
            color: #4B4B5C;
            font-weight: 500;
            letter-spacing: 0.2px;
        }

       .bottom-text a{
    color: #6C63FF;
    font-weight: 700;
    text-decoration: none;
    transition: 0.3s;
}

.bottom-text a:hover{
    color: #574BDB;
}
    </style>

</head>

<body>

<div class="container">

    <div class="left-panel">

        <div class="brand">

            <div class="logo">
                ✦
            </div>

            <h1>SkillSwap</h1>

        </div>

        <h2>
            Welcome Back.
            <br>
            Continue Learning.
        </h2>

        <p>
            Connect with learners, share your skills,
            and continue building meaningful collaborations.
        </p>

    </div>

    <div class="right-panel">

        <h2 class="form-title">Login</h2>

        <p class="form-subtitle">
            Access your SkillSwap account.
        </p>

        <form action="LoginServlet" method="post">

            <input type="email"
                   name="email"
                   placeholder="Email Address"
                   required>

            <input type="password"
                   name="password"
                   placeholder="Password"
                   required>

            <button type="submit">
                Login
            </button>

        </form>

        <p class="bottom-text">
    Don’t have an account?
    <a href="signup.jsp">Sign Up</a>
</p>
    </div>

</div>

</body>

</html>