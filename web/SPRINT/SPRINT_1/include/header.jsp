<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
    function signUpValidation() {
        let email = document.getElementById("signup_email").value;
        let password = document.getElementById("signup_password").value;
        let repeat = document.getElementById("signup_password_repeat").value;
        let fullName = document.getElementById("signup_fullName").value;

        emailIsValid(email);
        passwordIsValid(password);
        passwordMatchingIsCorrect(password, repeat);
        fullNameIsValid(fullName);

        if (emailIsValid(email) && passwordIsValid(password)
            && passwordMatchingIsCorrect(password, repeat) && fullNameIsValid(fullName))
            document.getElementById("signInButton").removeAttribute("disabled");
    }

    function emailIsValid(input) {
        let regex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
        if (!regex.test(input)) {
            document.getElementById("emailHelp").innerText = "Invalid email, try again";
            return false;
        } else {
            document.getElementById("emailHelp").innerText = "";
            return true;
        }
    }

    function passwordIsValid(input) {
        let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!regex.test(input)) {
            document.getElementById("passwordHelp").innerText = "Invalid password, try again";
            return false;
        } else {
            document.getElementById("passwordHelp").innerText = "";
            return true;
        }
    }

    function passwordMatchingIsCorrect(input, repeat) {
        if (input !== repeat) {
            document.getElementById("passwordRepeatHelp").innerText = "Passwords are not same, try again";
            return false;
        } else {
            document.getElementById("passwordRepeatHelp").innerText = "";
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

<c:set var="currentUserEmail" value="${sessionScope.current_user.getEmail()}"/>
<header class="header bg-primary">
    <div class="container">
        <nav class="navbar navbar-expand-md navbar-dark">
            <a href="${pageContext.request.contextPath}/sprint1" class="navbar-brand text-decoration-none text-light">
                <img src="https://icon-library.com/images/white-shopping-cart-icon-png/white-shopping-cart-icon-png-17.jpg"
                     width="30px"
                     alt="eshop logo">
                WebCommerce Shop
            </a>
            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/sprint1" class="nav-link">All Items</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <c:choose>
                        <c:when test="${not empty currentUserEmail}">
                            <a href="${pageContext.request.contextPath}/sprint1_profile?command=details"
                               class="nav-link p-1 text-light" id="profileLink">
                                <i class="fa-solid fa-user-gear"></i> ${currentUserEmail}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#auth" class="nav-link btn btn-light text-primary fw-bold p-2" id="authLink"
                               data-bs-toggle="modal" role="button">
                                Sign In/Up
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
    </div>


    <div class="modal fade" id="auth" aria-hidden="true" aria-labelledby="authLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="authLabel">Log In</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/sprint1_auth?command=login" method="get"
                          id="loginForm">
                        <div class="row align-items-center mb-3">
                            <div class="col-sm-4">
                                <label for="email" class="col-form-label">Email:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="email" id="email" class="form-control"
                                       name="email" required>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3" >
                            <div class="col-sm-4">
                                <label for="password" class="col-form-label">Password:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="password" id="password" class="form-control"
                                name="password"
                                required>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3 justify-content-around">
                            <button class="btn btn-secondary col-sm-4" type="reset">Reset</button>
                            <button class="btn btn-success col-sm-4"
                            type="submit" id="loginButton">Sign In</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer text-end">
                    Don't have an account? <a class="link-primary" data-bs-target="#signup"
                            data-bs-toggle="modal" data-bs-dismiss="modal">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="signup" aria-hidden="true" aria-labelledby="signupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupLabel">Sign Up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/sprint1_auth?command=1" method="post"
                          id="signUpForm">
                        <div class="row align-items-center mb-3">
                            <div class="col-sm-4">
                                <label for="signup_email" class="col-form-label">Email:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="email" id="signup_email" class="form-control"
                                       name="new_user_email" required
                                       onchange="signUpValidation()"
                                       aria-describedby="emailHelp">
                                <div id="emailHelp" class="form-text text-danger">
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3" >
                            <div class="col-sm-4">
                                <label for="signup_password" class="col-form-label">Password:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="password" id="signup_password" class="form-control"
                                       name="new_user_password" aria-describedby="passwordHelp"
                                       onchange="signUpValidation()"
                                       required>
                                <div id="passwordHelp" class="form-text text-danger">
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3" >
                            <div class="col-sm-4">
                                <label for="signup_password_repeat" class="col-form-label">Repeat Password:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="password" id="signup_password_repeat" class="form-control"
                                       aria-describedby="passwordRepeatHelp" required
                                       onchange="signUpValidation()">
                                <div id="passwordRepeatHelp" class="form-text text-danger">
                            </div>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3">
                            <div class="col-sm-4">
                                <label for="signup_fullName" class="col-form-label">Full Name:</label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" id="signup_fullName" class="form-control"
                                       name="new_user_fullName" required aria-describedby="fullNameHelp"
                                       onchange="signUpValidation()">
                                <div id="fullNameHelp" class="form-text text-danger">
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center mb-3 justify-content-around">
                            <button class="btn btn-secondary col-sm-4" type="reset">Reset</button>
                            <button class="btn btn-primary col-sm-4"
                                    type="submit" id="signInButton" disabled>Sign Up</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    Already have an account? <a class="link-primary" data-bs-target="#auth"
                            data-bs-toggle="modal" data-bs-dismiss="modal" style="cursor:pointer;">Log In</a>
                </div>
            </div>
        </div>
    </div>
</header>