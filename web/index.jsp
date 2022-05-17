<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 17.05.2022
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main | Java EE</title>
    <script src="https://kit.fontawesome.com/145e892520.js" crossorigin="anonymous"></script>

    <style>
        body, html {
            margin: 0;
            padding: 0;
            background-color: #19259b;
        }

        header {
            width: 100%;
            background-color: #2234ee;
            color: white;
        }

        .header {
            width: 90%;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            align-items: center;
        }

        nav {
            margin-left: auto;
        }

        .nav_links {
            list-style-type: none;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
        }

        .nav_links li {
            margin-left: 25px;
        }

        .nav_links li a {
            text-decoration: none;
            color: white;
        }

        .wrapper {
            width: 90%;
            background-color: white;
            border-radius: 25px;
            min-height: 150px;
            margin: auto;
            padding: 15px;
        }
    </style>
</head>
<body>
<header>
    <div class="header">
        <div class="logo">
            <h1>Java EE Projects</h1>
        </div>
        <nav>
            <ul class="nav_links">
                <li><a href="#">Navigation <i class="fa-solid fa-map-location-dot"></i></a></li>
                <li><a href="#">GitHub <i class="fa-brands fa-github"></i></a></li>
                <li><a href="#">Next Task <i class="fa-solid fa-forward-step"></i></a></li>
            </ul>
        </nav>
    </div>
</header>
<main>
    <div class="wrapper">
        <section class="item">
            <h2>Navigation</h2>
            <ul>
                <li><a href="lectures/lecture1/task1/index.jsp">Lecture #1</a></li>
                <li><a href="#">Lecture #2</a></li>
                <li><a href="#">Lecture #3</a></li>
            </ul>
        </section>
    </div>
</main>
</body>
</html>
