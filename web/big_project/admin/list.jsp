<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.06.2022
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Panel | FreelanceX</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4 mb-3">
    <div class="d-flex align-items-start w-100">
        <div class="nav flex-column nav-pills me-3 col-2" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link active" id="v-pills-users-tab" data-bs-toggle="pill" data-bs-target="#v-pills-users"
                    type="button" role="tab" aria-controls="v-pills-users" aria-selected="true">
                Users
            </button>
            <button class="nav-link" id="v-pills-posts-tab" data-bs-toggle="pill" data-bs-target="#v-pills-posts"
                    type="button" role="tab" aria-controls="v-pills-posts" aria-selected="false">
                Posts
            </button>
            <button class="nav-link" id="v-pills-fields-tab" data-bs-toggle="pill" data-bs-target="#v-pills-fields"
                    type="button" role="tab" aria-controls="v-pills-fields" aria-selected="false">
                Fields
            </button>
            <button class="nav-link" id="v-pills-comments-tab" data-bs-toggle="pill" data-bs-target="#v-pills-comments"
                    type="button" role="tab" aria-controls="v-pills-comments" aria-selected="false">
                Comments
            </button>
        </div>
        <div class="tab-content col-10" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-users" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <c:choose>
                    <c:when test="${not empty requestScope.users}">
                        <button class="btn btn-success w-100 mb-3" data-bs-toggle="modal" data-bs-target="#addUser">
                            Add New User
                        </button>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Blocked</th>
                                <th>Avatar</th>
                                <th>Details</th>
                                <th>Block/Unblock</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${requestScope.users}">
                                <tr class="justify-content-center">
                                    <td class="fw-bold">${user.getId()}</td>
                                    <td>${user.getUsername()}</td>
                                    <td>${user.getPassword()}</td>
                                    <td>${user.getPhoneNumber()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.getBlocked()}">
                                                <span class="text-danger">Yes</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-success">No</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <img src="${user.getAvatarUrl()}" alt="avatar"
                                             width="50px" height="50px" class="rounded-circle">
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/freelancex/admin?entity=user&id=${user.getId()}"
                                           class="btn btn-primary">
                                            Details
                                        </a>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/freelancex/admin" method="post">
                                            <input type="hidden" name="entity" value="user">
                                            <input type="hidden" name="id" value="${user.getId()}">
                                            <c:if test="${user.getBlocked()}">
                                                <input type="hidden" name="command" value="unblock">
                                            </c:if>
                                            <c:if test="${not user.getBlocked()}">
                                                <input type="hidden" name="command" value="block">
                                            </c:if>
                                            <button class="btn btn-warning">
                                                <c:if test="${user.getBlocked()}">
                                                    Unblock
                                                </c:if>
                                                <c:if test="${not user.getBlocked()}">
                                                    Block
                                                </c:if>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="modal fade" id="addUser"
                             tabindex="-1" aria-labelledby="addUserLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addUserLabel">
                                            Add User
                                        </h5>
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath}/freelancex/admin"
                                              method="post">
                                            <input type="hidden" name="entity" value="user">
                                            <input type="hidden" name="command" value="create">
                                            <div class="input-group mb-3">
                                                <label for="usernameA" class="form-label col-4">Username:</label>
                                                <input type="text" id="usernameA" name="usernameA"
                                                       class="form-control col-8" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="passwordA" class="form-label col-4">Password:</label>
                                                <input type="password" id="passwordA" name="passwordA"
                                                       class="form-control col-8" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="phoneA" class="form-label col-4">Phone:</label>
                                                <input type="text" id="phoneA" name="phoneA"
                                                       class="form-control col-8" required>
                                            </div>
                                            <button class="btn btn-primary w-100" type="submit">Add User</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3 class="h3">Error while loading users</h3>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tab-pane fade" id="v-pills-posts" role="tabpanel" aria-labelledby="v-pills-posts-tab">
                <c:choose>
                    <c:when test="${not empty requestScope.posts}">
                        <button class="btn btn-success w-100 mb-3" data-bs-toggle="modal" data-bs-target="#addPost">
                            Add New Post
                        </button>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Author</th>
                                <th>Title</th>
                                <th>Payment</th>
                                <th>Deadline</th>
                                <th>Field</th>
                                <th>Details</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="post" items="${requestScope.posts}">
                                <tr>
                                    <td class="fw-bold">${post.getId()}</td>
                                    <td>
                                        <img src="${post.getUser().getAvatarUrl()}" alt="author avatar"
                                             width="50px" height="50px" class="rounded-circle">
                                        <span class="ms-3">${post.getUser().getUsername()}</span>
                                    </td>
                                    <td>${post.getTitle()}</td>
                                    <td>$${post.getPayment()}</td>
                                    <td>${post.getSimpleDate(post.getDeadline())}</td>
                                    <td>${post.getField()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/freelancex/admin?entity=post&id=${post.getId()}"
                                           class="btn btn-primary">
                                            Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="modal modal-xl fade" id="addPost"
                             tabindex="-1" aria-labelledby="addPostLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Add New Post</h5>
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath}/freelancex/admin" method="post">
                                            <input type="hidden" name="entity" value="post">
                                            <input type="hidden" name="command" value="create">
                                            <div class="input-group mb-3">
                                                <label for="titleA" class="form-label col-4">Title:</label>
                                                <input type="text" id="titleA" name="titleA" class="form-control col-8" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="deadlineA" class="form-label col-4">Deadline:</label>
                                                <input type="datetime-local" id="deadlineA" name="deadlineA" class="form-control col-8" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="paymentA" class="form-label col-4">Payment ($USD):</label>
                                                <input type="number" id="paymentA" name="paymentA" class="form-control col-8" maxlength="6" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="fieldA" class="form-label col-4">Field:</label>
                                                <select name="fieldA" id="fieldA" required class="form-control">
                                                    <c:forEach var="field" items="${requestScope.fields}">
                                                        <option value="${field.getName()}">${field.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="asUser" class="form-label col-4">Post As:</label>
                                                <select name="asUser" id="asUser" required class="form-control">
                                                    <c:forEach var="user" items="${requestScope.users}">
                                                        <option value="${user.getId()}">${user.getUsername()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="input-group d-block mb-3">
                                                <label for="textareaContentA" class="form-label col-4">Content:</label>
                                                <textarea name="contentA" id="textareaContentA" cols="30" rows="75"
                                                          class="textarea form-control h-auto"></textarea>
                                            </div>
                                            <button class="btn btn-outline-primary w-100" type="submit">Add Order</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3 class="h3">Error while loading posts</h3>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tab-pane fade" id="v-pills-fields" role="tabpanel" aria-labelledby="v-pills-fields-tab">
                <c:choose>
                    <c:when test="${not empty requestScope.fields}">
                        <button class="btn btn-success w-100 mb-3" type="button"
                                data-bs-toggle="modal" data-bs-target="#addField">
                            Add New Field
                        </button>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Orders number</th>
                                <th>Details</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="field" items="${requestScope.fields}">
                                <tr>
                                    <td class="fw-bold">${field.getId()}</td>
                                    <td>${field.getName()}</td>
                                    <td>${field.getTotalOrdersNumber()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/freelancex/admin?entity=field&id=${field.getId()}"
                                           class="btn btn-primary">
                                            Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="modal fade" id="addField"
                             tabindex="-1" aria-labelledby="addFieldLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Add Field</h5>
                                        <button type="button" data-bs-dismiss="modal"
                                                class="btn-close" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath}/freelancex/admin"
                                              method="post">
                                            <input type="hidden" name="entity" value="field">
                                            <input type="hidden" name="command" value="create">
                                            <div class="input-group mb-5">
                                                <label for="nameA" class="form-label col-4">Name:</label>
                                                <input type="text" name="nameA" id="nameA"
                                                       class="form-control col-8" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <button type="submit" class="btn btn-success w-100">
                                                    Add Field
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3 class="h3">Error while loading fields</h3>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tab-pane fade" id="v-pills-comments" role="tabpanel" aria-labelledby="v-pills-comments-tab">
                <c:choose>
                    <c:when test="${not empty requestScope.comments}">
                        <button class="btn btn-success w-100 mb-3" data-bs-toggle="modal" data-bs-target="#addComment">
                            Add New Comment
                        </button>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Author</th>
                                <th>Post ID</th>
                                <th>Publication date</th>
                                <th>Blocked</th>
                                <th>Block/Unblock</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="comment" items="${requestScope.comments}">
                                <tr>
                                    <td class="fw-bold">${comment.getId()}</td>
                                    <td>
                                        <img src="${comment.getUser().getAvatarUrl()}" alt="author avatar"
                                             width="50px" height="50px" class="rounded-circle">
                                        <span class="ms-3">${comment.getUser().getUsername()}</span>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/freelancex?command=show&id=${comment.getPostId()}"
                                           class="link link-dark">
                                            ${comment.getPostId()}
                                        </a>
                                    </td>
                                    <td>${comment.getSimpleDate(comment.getPublicationTime())}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${comment.getBlocked()}">
                                                <span class="text-danger">Yes</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-success">No</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/freelancex/admin" method="post">
                                            <input type="hidden" name="entity" value="comment">
                                            <input type="hidden" name="id" value="${comment.getId()}">
                                            <c:if test="${comment.getBlocked()}">
                                                <input type="hidden" name="command" value="unblock">
                                            </c:if>
                                            <c:if test="${not comment.getBlocked()}">
                                                <input type="hidden" name="command" value="block">
                                            </c:if>
                                            <button class="btn btn-warning">
                                                <c:if test="${comment.getBlocked()}">
                                                    Unblock
                                                </c:if>
                                                <c:if test="${not comment.getBlocked()}">
                                                    Block
                                                </c:if>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="modal fade" id="addComment"
                             tabindex="-1" aria-labelledby="addCommentLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Add Comment</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath}/freelancex/admin"
                                              method="post">
                                            <input type="hidden" name="entity" value="comment">
                                            <input type="hidden" name="command" value="create">
                                            <div class="input-group mb-3">
                                                <label for="contentA" class="form-label col-4">Content:</label>
                                                <textarea name="contentA" id="contentA"
                                                          class="form-control col-8" required></textarea>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="asUserC" class="form-label col-4">Post As:</label>
                                                <select name="asUser" id="asUserC" required class="form-control col-8">
                                                    <c:forEach var="user" items="${requestScope.users}">
                                                        <option value="${user.getId()}">${user.getUsername()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="input-group mb-5">
                                                <label for="postIdA" class="form-label col-4">Post For:</label>
                                                <select name="postIdA" id="postIdA" required class="form-control col-8">
                                                    <c:forEach var="post" items="${requestScope.posts}">
                                                        <option value="${post.getId()}">${post.getTitle()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <button class="btn btn-success w-100" type="submit">Add Comment</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3 class="h3">Error while loading comments</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    </div>
</main>
</body>
</html>
