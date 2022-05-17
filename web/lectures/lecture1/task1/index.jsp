<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 17.05.2022
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task 1.1 | Java EE</title>
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
                <li><a href="../task2/index.jsp">Next Task <i class="fa-solid fa-forward-step"></i></a></li>
            </ul>
        </nav>
    </div>
</header>
<main>
    <div class="wrapper">
        <section class="item">
            <form action="${pageContext.request.contextPath}/lec1task1">
                <div class="form-group">
                    <label for="user_name">NAME:</label>
                    <input type="text" class="form-control" id="user_name" placeholder="Insert name" name="user_name">
                </div>
                <div class="form-group">
                    <label for="user_surname">SURNAME:</label>
                    <input type="text" class="form-control" id="user_surname" placeholder="Insert surname" name="user_surname">
                </div>
                <div class="form-group">
                    <label for="user_preferredFood">FOOD</label>
                    <select id="user_preferredFood" class="form-control" name="user_preferredFood">
                        <option selected>Choose one</option>
                        <option value="burger">Burger - 2000 KZT</option>
                        <option value="hamburger">Hamburger - 5000 KZT</option>
                        <option value="cheeseburger">Cheeseburger - 3500 KZT</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">ORDER FOOD</button>
            </form>
        </section>
    </div>
</main>
</body>
</html>
