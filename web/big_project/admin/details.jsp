<%@ page import="big_project.entities.User" %>
<%@ page import="big_project.db.DBManager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 20.06.2022
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Details | Admin Panel</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4 mb-3">
        <c:choose>
            <c:when test="${not empty requestScope.user}">
                <jsp:useBean id="user" class="big_project.entities.User" scope="request"/>
                <div class="row mb-3">
                    <h2>Edit User Page</h2>
                </div>
                <form action="${pageContext.request.contextPath}/freelancex/admin"
                      method="post">
                    <input type="hidden" name="entity" value="user">
                    <input type="hidden" name="command" value="update">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="input-group mb-3">
                        <label for="newUsername" class="form-label col-4">Username:</label>
                        <input type="text" value="${user.username}" class="form-control col-8"
                               id="newUsername" name="newUsername">
                    </div>
                    <div class="input-group mb-3">
                        <label for="newPassword" class="form-label col-4">Password:</label>
                        <input type="password" value="${user.password}" class="form-control col-8"
                               id="newPassword" name="newPassword">
                    </div>
                    <div class="input-group mb-3">
                        <label for="newPhoneNumber" class="form-label col-4">Phone:</label>
                        <input type="text" value="${user.phoneNumber}" class="form-control col-8"
                               id="newPhoneNumber" name="newPhoneNumber">
                    </div>
                    <div class="input-group mb-4">
                        <label for="newAvatar" class="col-4 form-label">Avatar URL:</label>
                        <input type="text" class="form-control col-5" id="newAvatar"
                               name="newAvatar" value="${user.avatarUrl}"
                               onchange="avatarPreview(this.value)">
                        <span class="ms-auto">
                            <img src="${user.avatarUrl}" alt="avatar"
                                 class="rounded-circle ms-2" id="currentAvatarPreview" width="50px" height="50px">
                        </span>
                    </div>
                    <div class="form-check d-flex flex-wrap justify-content-between px-0 mb-5">
                        <div class="col-5 mb-1">
                            <input type="radio" name="isBlocked" id="isBlockedFalse" class="btn-check"
                                   value="false" required>
                            <label for="isBlockedFalse" class="btn btn-outline-success w-100">Unblocked</label>
                        </div>
                        <div class="col-5 mb-1">
                            <input type="radio" name="isBlocked" id="isBlockedTrue" class="btn-check"
                                   value="true">
                            <label for="isBlockedTrue" class="btn btn-outline-danger w-100">Blocked</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-success w-100" type="submit">
                            Save Changes
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <a class="btn btn-outline-secondary w-100"
                           href="${pageContext.request.contextPath}/freelancex/admin">
                            Back to List
                        </a>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty requestScope.post}">
                <jsp:useBean id="post" scope="request" class="big_project.entities.Post"/>
                <div class="row mb-2">
                    <h2>Edit Post Page</h2>
                </div>
                <form action="${pageContext.request.contextPath}/freelancex/admin"
                      method="post">
                    <input type="hidden" name="entity" value="post">
                    <input type="hidden" name="command" value="update">
                    <input type="hidden" name="id" value="${post.id}">
                    <div class="input-group mb-3">
                        <label for="newPostUserA" class="form-label col-4">Posted by:</label>
                        <select name="newPostUserA" id="newPostUserA" class="form-control col-8" required>
                            <%
                                for(User u : DBManager.getAllUsers()) {
                            %>
                                    <option value="<%=u.getId()%>"
                                        <%if (post.getUser().getId().equals(u.getId())) {%>selected="selected"<%}%>>
                                        <%=u.getUsername()%>
                                    </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label for="newPaymentA" class="form-label col-4">Payment ($USD):</label>
                        <input type="number" name="newPaymentA" id="newPaymentA" class="form-control col-8"
                               min="0.01" max="1000000.01" step="0.01" value="${post.payment}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="newDeadlineA" class="form-label col-4">Deadline:</label>
                        <input type="datetime-local" name="newDeadlineA" required
                               value="<%=post.getDeadline().toLocalDateTime()%>"
                               id="newDeadlineA" class="form-control col-8">
                    </div>
                    <div class="input-group mb-3">
                        <label for="newTitleA" class="form-label col-4">Title:</label>
                        <input type="text" name="newTitleA" id="newTitleA" value="${post.title}"
                               class="form-control col-8" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="newContentA" class="form-label col-12 mb-1">Content:</label>
                        <textarea name="newContentA" id="newContentA"
                                  class="form-control col-12 textarea mt-1"
                                  rows="20" required>${post.content}</textarea>
                    </div>
                    <div class="input-group mb-5">
                        <label for="newFieldA" class="form-label col-4">Field:</label>
                        <select name="newFieldA" id="newFieldA" class="form-control col-8">
                            <c:forEach var="field" items="${requestScope.fields}">
                                <option value="${field.getName()}"
                                        <c:if test="${field.getName().equals(post.field)}">selected="selected"</c:if>>
                                        ${field.getName()}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-success w-100" type="submit">
                            Save Changes
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <a href="${pageContext.request.contextPath}/freelancex/admin"
                           class="btn btn-outline-secondary w-100">
                            Back to List
                        </a>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty requestScope.field}">
                <jsp:useBean id="field" class="big_project.entities.Field" scope="request"/>
                <div class="row mb-2">
                    <h2>Edit Field Page</h2>
                </div>
                <form action="${pageContext.request.contextPath}/freelancex/admin"
                      method="post">
                    <input type="hidden" name="entity" value="field">
                    <input type="hidden" name="command" value="update">
                    <input type="hidden" name="id" value="${field.id}">
                    <div class="input-group mb-3">
                        <label for="newNameA" class="form-label col-4">Field Name:</label>
                        <input type="text" name="newNameA" id="newNameA"
                               value="${field.name}" class="form-control col-8">
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-success w-100" type="submit">Save Changes</button>
                    </div>
                    <div class="input-group mb-3">
                        <a href="${pageContext.request.contextPath}/freelancex/admin"
                           class="btn btn-outline-secondary w-100">
                            Back to List
                        </a>
                    </div>
                </form>
            </c:when>
        </c:choose>
    </div>
</main>

<script>
    <c:if test="${not empty requestScope.user}">
    function avatarPreview(value) {
        document.getElementById("currentAvatarPreview").setAttribute("src", value);
    }
    </c:if>
</script>
</body>
</html>
