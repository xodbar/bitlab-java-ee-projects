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
    <title>Task 1.3 | Java EE</title>
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

        form > div  {
            margin-top: 15px;
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
        <form action="${pageContext.request.contextPath}/lec1task3" method="post">
            <div class="form-group row">
                <label for="footballer_name" class="col-sm-2 col-form-label">NAME:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="footballer_name"
                           placeholder="Insert Name" name="newFootballerName">
                </div>
            </div>
            <div class="form-group row">
                <label for="footballer_surname" class="col-sm-2 col-form-label">SURNAME:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="footballer_surname"
                           placeholder="Insert Name" name="newFootballerSurname">
                </div>
            </div>
            <div class="form-group row">
                <label for="footballer_club" class="col-sm-2 col-form-label">CLUB:</label>
                <div class="col-sm-10">
                    <select name="newFootballerClub" id="footballer_club">
                        <option value="Real Madrid CF">Real Madrid CF</option>
                        <option value="FC Barcelona">FC Barcelona</option>
                        <option value="Arsenal">Arsenal</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="footballer_salary" class="col-sm-2 col-form-label">SALARY:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="footballer_salary"
                           placeholder="Insert Salary" name="newFootballerSalary"
                    min="30000" max="999999999999" step="5000">
                </div>
            </div>
            <div class="form-group row">
                <label for="footballer_transfer_price" class="col-sm-2 col-form-label">TRANSFER PRICE:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="footballer_transfer_price"
                           placeholder="Insert Salary" name="newFootballerTransferPrice"
                           min="3000000" max="999999999999" step="50000">
                </div>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Confirm</button>
        </form>
    </div>
</main>
</body>
</html>
