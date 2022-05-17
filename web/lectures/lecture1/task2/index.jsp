<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 17.05.2022
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task 1.2 | Java EE</title>
    <link rel="stylesheet" href="../../../css/general.css">
    <script src="https://kit.fontawesome.com/145e892520.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        form {
            width: 30%;
            margin: auto;
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
                <li><a href="../task3/index.jsp">Next Task <i class="fa-solid fa-forward-step"></i></a></li>
            </ul>
        </nav>
    </div>
</header>
<main>
    <div class="wrapper">
        <form action="${pageContext.request.contextPath}/lec1task2" method="get">
            <div class="form-group">
                <label for="full_name">Full Name:</label>
                <input type="text" class="form-control" id="full_name" placeholder="Insert full name" name="fullName">
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" class="form-control" id="age" min="0" max="100"
                       placeholder="Insert age" name="age">
            </div>
            Gender:
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                <label class="form-check-label" for="male">
                    Male
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                <label class="form-check-label" for="female">
                    Female
                </label>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Confirm</button>
        </form>
    </div>
</main>
</body>
</html>
