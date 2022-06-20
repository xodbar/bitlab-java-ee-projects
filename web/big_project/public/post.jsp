<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.06.2022
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="post" value="${requestScope.post}"/>
<c:set var="currentUser" value="${sessionScope.currentUser}"/>
<html>
<head>
    <title><c:if test="${not empty post}">post.getTitle()</c:if> | FreelanceX</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4">
        <c:choose>
            <c:when test="${not empty post}">
                <h2>${post.getTitle()}</h2>
                <h3>Payment: ${post.getPayment()}</h3>
                <h3>Deadline: ${post.getSimpleDate(post.getDeadline())}</h3>
                <h4>From: ${post.getUser().getUsername()} at ${post.getSimpleDate(post.getPublicationTime())}</h4>
                <h4>Contacts: <a href="tel:${post.getUser().getPhoneNumber()}">${post.getUser().getPhoneNumber()}</a></h4>
                <div class="mb-5 w-100 justify-content-center">${post.getContent()}</div>
                <div>
                    <h5 class="fw-semibold border-top pt-3 pb-2">Comments:</h5>
                    <c:set var="comments" value="${requestScope.comments}"/>
                    <c:choose>
                        <c:when test="${not empty currentUser}">
                                <div class="card w-100 mb-4">
                                    <div class="card-header">
                                        <span class="d-flex align-items-center col-12">
                                            <img src="${currentUser.getAvatarUrl()}" class="rounded" alt="avatar"
                                                 width="50px" height="50px">
                                            <span class="ms-3 fw-bold">${currentUser.getUsername()}</span>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${currentUser.getBlocked() != true}">
                                                <form action="${pageContext.request.contextPath}/freelancex/comments"
                                                      method="post">
                                                    <input type="hidden" name="postId" value="${post.getId()}">
                                                    <input type="hidden" name="command" value="add">
                                                    <div class="input-group">
                                                        <label for="textareaC"></label>
                                                        <textarea name="content" id="textareaC" cols="30" rows="3"
                                                                  class="form-control w-100 mb-2"
                                                                  placeholder="Leave your comment!"
                                                                  maxlength="350"></textarea>
                                                        <button class="btn btn-primary w-100" type="submit">
                                                            Leave a comment
                                                        </button>
                                                    </div>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="card-text text-danger">Your account is blocked</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                        </c:when>
                        <c:otherwise>
                            <h5>You aren't authorized. Authorize to leave a comment.</h5>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty comments}">
                            <c:forEach var="comment" items="${comments}">
                                <div class="card w-100 mb-3">
                                    <div class="card-header">
                                        <span class="d-flex align-items-center col-12">
                                            <img src="${comment.getUser().getAvatarUrl()}" class="rounded"
                                                 alt="avatar" width="50px" height="50px">
                                            <span class="ms-2"><span class="fw-bold">
                                                    ${comment.getUser().getUsername()} </span>
                                                at ${comment.getSimpleDate(comment.getPublicationTime())}</span>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${comment.getBlocked() != true}">
                                                <p class="card-text">${comment.getContent()}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="card-text text-secondary fst-italic">
                                                    This comment was blocked
                                                </p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </c:when>
            <c:otherwise>
                <h3>An error was occurred while loading the page. <a class="link-info" href="${pageContext.request.contextPath}/freelancex">Back to main</a>?</h3>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
