<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.06.2022
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home | FreelanceX</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body class="bg-light">
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container mt-4 mb-3">
        <c:if test="${not empty sessionScope.postError}">
            <div class="alert alert-warning alert-dismissible fade show mb-3" role="alert">
                <strong class="text-uppercase">Post Error:</strong> ${sessionScope.postError}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.loginError}">
            <div class="alert alert-warning alert-dismissible fade show mb-3" role="alert">
                <strong class="text-uppercase">Login Error:</strong> ${sessionScope.loginError}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.commentError}">
            <div class="alert alert-warning alert-dismissible fade show mb-4" role="alert">
                <strong class="text-uppercase">Comment Error:</strong> ${sessionScope.commentError}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${not empty param.search && not empty requestScope.posts}">
            <h4 class="mb-4 fw-light">For the query <span class="fw-bold">'${param.search}'</span> found
                <span class="fw-bold">${requestScope.posts.size()}</span> results:</h4>
        </c:if>
        <c:set var="posts" value="${requestScope.posts}"/>
        <c:choose>
            <c:when test="${not empty posts}">
                <c:forEach var="post" items="${posts}">
                    <div class="card w-100 mb-4" style="width: 18rem;">
                        <div class="card-body">
                            <h3 class="card-title">${post.getTitle()}</h3>
                            <p class="card-text">
                                ${fn:substring(post.getContent(), 0, 50)}
                                    <a href="${pageContext.request.contextPath}/freelancex?command=show&id=${post.getId()}"> Show more...</a>
                            </p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Payment: <span class="text-success">$${post.getPayment()}</span></li>
                            <li class="list-group-item">Deadline: <span class="text-danger">${post.getSimpleDate(post.getDeadline())}</span></li>
                            <li class="list-group-item">Field:
                                <span>
                                    <a class="link-primary text-decoration-none"
                                    href="${pageContext.request.contextPath}/freelancex?command=filter&field=${post.getField()}">
                                        ${post.getField()}
                                    </a>
                                </span>
                            </li>
                        </ul>
                        <div class="card-footer">
                            <span class="d-flex align-items-center col-12">
                                <img src="${post.getUser().getAvatarUrl()}" class="rounded" alt="avatar" width="50px" height="50px">
                                <span class="ms-2">${post.getUser().getUsername()} at ${post.getSimpleDate(post.getPublicationTime())}</span>
                            </span>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${not empty param.search}">
                        <h4 class="text-secondary">No results found for query ${param.search}.</h4>
                        <span> <a href="${pageContext.request.contextPath}/freelancex"
                                  class="link-info">Back to main</a></span>
                    </c:when>
                    <c:otherwise>
                        <h4 class="text-secondary">Error while loading posts.</h4>
                        <span> <a href="${pageContext.request.contextPath}/freelancex"
                                  class="link-info">Back to main</a></span>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
