<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.06.2022
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile | FreelanceX</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4 mb-3">
        <div class="row">
            <c:choose>
                <c:when test="${not empty sessionScope.currentUser}">
                    <form action="${pageContext.request.contextPath}/freelancex/profile" method="post">
                        <div class="input-group mb-3">
                            <label for="currentUsername" class="col-4 form-label">Username:</label>
                            <input type="text" class="form-control col-8" id="currentUsername"
                                   name="newUsername" value="${sessionScope.currentUser.getUsername()}"
                                   readonly>
                        </div>
                        <div class="input-group mb-3">
                            <label for="currentPassword" class="col-4 form-label">Password:</label>
                            <input type="text" class="form-control col-8" id="currentPassword"
                                   name="newPassword" value="${sessionScope.currentUser.getPassword()}"
                                   readonly>
                        </div>
                        <div class="input-group mb-3">
                            <label for="currentPhone" class="col-4 form-label">Phone number:</label>
                            <input type="text" class="form-control col-8" id="currentPhone"
                                   name="newPhone" value="${sessionScope.currentUser.getPhoneNumber()}"
                                   readonly>
                        </div>
                        <div class="input-group mb-3 d-flex align-items-center">
                            <label for="currentAvatar" class="col-4 form-label">Avatar URL:</label>
                            <input type="text" class="form-control col-5" id="currentAvatar"
                                   name="newAvatar" value="${sessionScope.currentUser.getAvatarUrl()}"
                                   onchange="avatarPreview(this.value)" readonly>
                            <span class="ms-auto">
                                <img src="${sessionScope.currentUser.getAvatarUrl()}" alt="avatar"
                                     class="rounded-circle ms-2" id="currentAvatarPreview" width="50px" height="50px">
                            </span>
                        </div>
                        <div class="input-group mb-3">
                            <button class="btn btn-primary w-100" id="editButton"
                                    type="button" onclick="editProfile()">
                                Edit Profile Data
                            </button>
                        </div>
                        <div class="input-group mb-5">
                            <button class="btn btn-success w-100" id="saveButton" type="submit" disabled>
                                Save Changes
                            </button>
                        </div>
                        <div class="input-group mb-5">
                            <button class="btn btn-secondary w-100" id="resetButton"
                                    type="button" onclick="resetData()" disabled>
                                Reset Changes
                            </button>
                        </div>
                    </form>
                </c:when>
            </c:choose>
        </div>
    </div>
</main>
<script>
    <c:if test="${not empty sessionScope.currentUser}">
    function editProfile() {
        document.getElementById("editButton").setAttribute("disabled", "disabled");
        document.getElementById("saveButton").removeAttribute("disabled");
        document.getElementById("resetButton").removeAttribute("disabled");

        document.getElementById("currentUsername").removeAttribute("readonly");
        document.getElementById("currentPassword").removeAttribute("readonly");
        document.getElementById("currentPhone").removeAttribute("readonly");
        document.getElementById("currentAvatar").removeAttribute("readonly");
    }

    function resetData() {
        document.getElementById("currentUsername").setAttribute("value", '${sessionScope.currentUser.getUsername()}');
        document.getElementById("currentPassword").setAttribute("value", '${sessionScope.currentUser.getPassword()}');
        document.getElementById("currentPhone").setAttribute("value", '${sessionScope.currentUser.getPhoneNumber()}');
        document.getElementById("currentAvatar").setAttribute("value", '${sessionScope.currentUser.getAvatarUrl()}');

        document.getElementById("currentUsername").setAttribute("readonly", "readonly");
        document.getElementById("currentPassword").setAttribute("readonly", "readonly");
        document.getElementById("currentPhone").setAttribute("readonly", "readonly");
        document.getElementById("currentAvatar").setAttribute("readonly", "readonly");

        document.getElementById("editButton").removeAttribute("disabled");
        document.getElementById("saveButton").setAttribute("disabled", "disabled");
        document.getElementById("resetButton").setAttribute("disabled", "disabled");
    }

    function avatarPreview(value) {
        document.getElementById("currentAvatarPreview").setAttribute("src", value);
    }
    </c:if>
</script>
</body>
</html>
