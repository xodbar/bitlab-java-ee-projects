<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24.05.2022
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Manage Users | WebCommerce</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4">
        <a class="btn btn-primary w-100 mb-3 py-2 fw-bold text-center" data-bs-target="#addUser"
           data-bs-toggle="modal" data-bs-dismiss="modal">Add New User</a>
        <table class="table table-hover">
            <thead class="table-header table-primary">
            <tr>
                <th>ID</th>
                <th>EMAIL</th>
                <th>FULL NAME</th>
                <th>PASSWORD</th>
                <th class="text-center"><i class="fa-solid fa-user-gear"></i></th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty requestScope.users}">
                    <c:forEach var="user" items="${requestScope.users}">
                        <tr>
                            <td>${user.getUserId()}</td>
                            <td>${user.getEmail()}</td>
                            <td>${user.getPassword()}</td>
                            <td>${user.getFullName()}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=users&command=details&id=${user.getUserId()}"
                                   class="btn btn-primary">
                                    Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">
                            <h3 class="h3">
                                An error was occurred while loading users table.
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=users"> Try again</a>?
                            </h3>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>

            <div class="modal fade" id="addUser" aria-hidden="true" aria-labelledby="addUserLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addUserLabel">Add new user</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/sprint1_admin?entity=user&command=1"
                                  method="post"
                                  id="addUserForm">
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-4">
                                        <label for="newUserEmail" class="col-form-label">Email:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="email" id="newUserEmail" class="form-control"
                                               name="new_user_email" required
                                               onchange="newSignUpValidation()"
                                               aria-describedby="newUserEmailHelp">
                                        <div id="newUserEmailHelp" class="form-text text-danger">
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3" >
                                    <div class="col-sm-4">
                                        <label for="newUserPassword" class="col-form-label">Password:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="password" id="newUserPassword" class="form-control"
                                               name="new_user_password" aria-describedby="newUserPasswordHelp"
                                               onchange="newSignUpValidation()"
                                               required>
                                        <div id="newUserPasswordHelp" class="form-text text-danger">
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3" >
                                    <div class="col-sm-4">
                                        <label for="newUserPasswordRepeat" class="col-form-label">Repeat Password:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="password" id="newUserPasswordRepeat" class="form-control"
                                               aria-describedby="newUserPasswordRepeatHelp" required
                                               onchange="newSignUpValidation()">
                                        <div id="newUserPasswordRepeatHelp" class="form-text text-danger">
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-4">
                                        <label for="newUserFullName" class="col-form-label">Full Name:</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" id="newUserFullName" class="form-control"
                                               name="new_user_fullName" required aria-describedby="newUserFullNameHelp"
                                               onchange="newSignUpValidation()">
                                        <div id="newUserFullNameHelp" class="form-text text-danger">
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3 justify-content-around">
                                    <button class="btn btn-secondary col-sm-4" type="reset">Reset</button>
                                    <button class="btn btn-primary col-sm-4"
                                            type="submit" id="newUserSignInButton" disabled>Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</main>
</body>

<script>
    function newSignUpValidation() {
        let email = document.getElementById("newUserEmail").value;
        let password = document.getElementById("newUserPassword").value;
        let repeat = document.getElementById("newUserPasswordRepeat").value;
        let fullName = document.getElementById("newUserFullName").value;

        emailIsValid(email);
        passwordIsValid(password);
        passwordMatchingIsCorrect(password, repeat);
        fullNameIsValid(fullName);

        if (emailIsValid(email) && passwordIsValid(password)
            && passwordMatchingIsCorrect(password, repeat) && fullNameIsValid(fullName))
            document.getElementById("newUserSignInButton").removeAttribute("disabled");
    }

    function emailIsValid(input) {
        let regex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
        if (!regex.test(input)) {
            document.getElementById("newUserEmailHelp").innerText = "Invalid email, try again";
            return false;
        } else {
            document.getElementById("newUserEmailHelp").innerText = "";
            return true;
        }
    }

    function passwordIsValid(input) {
        let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!regex.test(input)) {
            document.getElementById("newUserPasswordHelp").innerText = "Invalid password, try again";
            return false;
        } else {
            document.getElementById("newUserPasswordHelp").innerText = "";
            return true;
        }
    }

    function passwordMatchingIsCorrect(input, repeat) {
        if (input !== repeat) {
            document.getElementById("newUserPasswordRepeat").innerText = "Passwords are not same, try again";
            return false;
        } else {
            document.getElementById("newUserPasswordRepeatHelp").innerText = "";
            return true;
        }
    }

    function fullNameIsValid(input) {
        let regex = /^[a-zA-Z]+ [a-zA-Z]+$/;
        if (!regex.test(input)) {
            document.getElementById("fullNameHelp").innerText = "Invalid full name, try again";
            return false;
        } else {
            document.getElementById("fullNameHelp").innerText = "";
            return true;
        }
    }
</script>
</html>
