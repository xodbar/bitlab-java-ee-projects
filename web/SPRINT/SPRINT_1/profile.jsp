<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile | WebCommerce</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="include/header.jsp"/>

<main>
    <div class="container text-center mt-4">
        <c:set var="currentUserObject" value="${sessionScope.current_user}"/>
        <c:choose>
            <c:when test="${not empty currentUserObject}">
                <h1 class="h1">Hello, ${currentUserObject.getFullName()}</h1>
                <h3 class="fw-light text-dark mb-4">This is your profile's page</h3>
                <div class="mx-auto" style="width: 375px;">
                    <form action="${pageContext.request.contextPath}/sprint1" method="post">
                        <input type="hidden" name="command" value="2" style="display: none"/>
                        <input type="hidden" name="edit_user_id" value="${currentUserObject.getUserId()}"
                               style="display: none"/>
                        <input type="hidden" name="current_id" value="${currentUserObject.getUserId()}"
                               style="display: none"/>
                        <div class="input-group mb-1">
                            <span class="input-group-text w-25 m-0" id="addon1">Full Name</span>
                            <input type="text" class="form-control w-50 m-0" aria-label="Full Name"
                                   aria-describedby="addon1" value="${currentUserObject.getFullName()}"
                                   id="edit_user_fullName" name="edit_user_fullName"
                                   onchange="editUserValidation()"
                                   readonly>
                            <button class="btn btn-light w-25 m-0" type="button"
                                onclick="allowEditing('edit_user_fullName')">
                                Edit
                            </button>
                        </div>
                        <div id="fullNameEditHelp" class="form-text text-danger mb-3">
                        </div>
                        <div class="input-group mb-1">
                            <span class="input-group-text w-25 m-0" id="addon2">Email</span>
                            <input type="email" class="form-control w-50 m-0" aria-label="Email"
                                   aria-describedby="addon2" value="${currentUserObject.getEmail()}"
                                   id="edit_user_email" name="edit_user_email"
                                   onchange="editUserValidation()"
                                   readonly>
                            <button class="btn btn-light w-25 m-0" type="button"
                                    onclick="allowEditing('edit_user_email')">
                                Edit
                            </button>
                        </div>
                        <div id="emailEditHelp" class="form-text text-danger mb-3">
                        </div>
                        <div class="input-group mb-1">
                            <span class="input-group-text w-25 m-0" id="addon3">Password</span>
                            <input type="password" class="form-control w-50 m-0" aria-label="Password"
                                   aria-describedby="addon3" value="${currentUserObject.getPassword()}"
                                   id="edit_user_password" name="edit_user_password"
                                   onchange="editUserValidation()"
                                   readonly>
                            <button class="btn btn-light w-25 m-0" type="button"
                                    onclick="allowEditing('edit_user_password')">
                                Edit
                            </button>
                        </div>
                        <div id="passwordEditHelp" class="form-text text-danger mb-3">
                        </div>
                        <div class="input-group mb-3">
                            <button type="submit" class="btn btn-light w-100" disabled id="editSaveButton">
                                Save Changes
                            </button>
                        </div>
                    </form>
                    <div class="input-group mb-5">
                        <a class="btn btn-secondary w-100"
                           href="${pageContext.request.contextPath}/sprint1_auth?command=logout">
                            Log Out <i class="fa-solid fa-right-from-bracket" style="margin-left: 5px"></i>
                        </a>
                    </div>
                    <div class="input-group mb-5">
                        <form action="${pageContext.request.contextPath}/sprint1" method="post" class="w-100">
                            <input type="hidden" name="command" value="3" style="display: none"/>
                            <input type="hidden" name="current_id" value="${currentUserObject.getUserId()}"
                                   style="display: none"/>
                            <input type="hidden" name="delete_user_id" value="${currentUserObject.getUserId()}"
                                   style="display: none"/>

                            <button type="button" class="btn btn-danger w-100" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal">
                                Delete My Account <i class="fa-solid fa-trash-can" style="margin-left: 5px"></i>
                            </button>

                            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="label"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="label">Confirm action</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            You're going to delete your account forever. Are you sure?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-danger">
                                                Delete the account
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <c:choose>
                        <c:when test="${currentUserObject.getUserId() == 1}">
                            <div class="input-group mb-3">
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=users"
                                   class="btn btn-warning w-100">
                                    Manage Users
                                </a>
                            </div>
                            <div class="input-group mb-5">
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=items"
                                   class="btn btn-warning w-100">
                                    Manage Items
                                </a>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </c:when>
            <c:otherwise>
                <h1 class="display-5">
                    An error was occurred while loading the profile page, try later.
                    <a class="link-primary" href="${pageContext.request.contextPath}/sprint1">Home Page</a>
                </h1>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<script>
    function allowEditing(elementId) {
        document.getElementById(elementId).removeAttribute('readonly');
    }

    function editUserValidation() {
        let email = document.getElementById("edit_user_email").value;
        let password = document.getElementById("edit_user_password").value;
        let fullName = document.getElementById("edit_user_fullName").value;

        emailIsValid(email);
        passwordIsValid(password);
        fullNameIsValid(fullName);

        if (emailIsValid(email) && passwordIsValid(password) && fullNameIsValid(fullName))
            document.getElementById("editSaveButton").removeAttribute("disabled");
    }

    function emailIsValid(input) {
        let regex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
        if (!regex.test(input)) {
            document.getElementById("emailEditHelp").innerText = "Invalid email, try again";
            return false;
        } else {
            document.getElementById("emailEditHelp").innerText = "";
            return true;
        }
    }

    function passwordIsValid(input) {
        let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!regex.test(input)) {
            document.getElementById("passwordEditHelp").innerText = "Invalid password, try again";
            return false;
        } else {
            document.getElementById("passwordEditHelp").innerText = "";
            return true;
        }
    }

    function fullNameIsValid(input) {
        let regex = /^[a-zA-Z]+ [a-zA-Z]+$/;
        if (!regex.test(input)) {
            document.getElementById("fullNameEditHelp").innerText = "Invalid full name, try again";
            return false;
        } else {
            document.getElementById("fullNameEditHelp").innerText = "";
            return true;
        }
    }
</script>
</body>
</html>
