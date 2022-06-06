<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 06.06.2022
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Home | SPRINT 2</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body style="background-color: #f5f5f5">
<jsp:include page="./parts/header.jsp"/>

<c:set var="news" value="${requestScope.news}"/>
<main>
    <div class="container d-flex flex-wrap mt-4 justify-content-between">
        <div class="row">
            <c:if test="${not empty requestScope.login_error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Log In Error:</strong> ${requestScope.login_error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.article_error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Article Error:</strong> ${requestScope.article_error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        <c:choose>
            <c:when test="${not empty news}">
                <c:forEach var="news_item" items="${news}">
                        <div class="<c:choose>
                            <c:when test="${not empty requestScope.filter_pub}">col</c:when>
                            <c:otherwise>col-10 mx-auto</c:otherwise>
                        </c:choose>">
                            <div class="card mb-4">
                                <div class="card-header bg-dark">
                                    <a class="card-title h4 link-light text-decoration-none"
                                       href="${pageContext.request.contextPath}/sprint2_article?article=${news_item.getNewsId()}">
                                            ${news_item.getNewsTitle()}
                                    </a>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">
                                            ${news_item.getShortContent()}
                                                <a href="${pageContext.request.contextPath}/sprint2_article?article=${news_item.getNewsId()}"
                                                   class="link-primary">Read more</a>
                                    </p>
                                    <img src="${news_item.getPictureUrl()}" alt="news picture"
                                         class="card-img img-fluid" style="max-height: 550px">
                                    <p class="card-text pt-3 text-end">
                                        <small class="text-muted">
                                            Post date: ${news_item.getSimplePostDate()}
                                            <br>
                                            Publisher: <a class="link-primary text-decoration-none"
                                                          href="${pageContext.request.contextPath}/sprint2?filter=pub&pub=${news_item.getPublicationName()}">
                                                ${news_item.getPublicationName()}</a>
                                        </small>
                                    </p>
                                </div>
                            </div>
                        </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <h3>Error while loading the page.
                    <a href="${pageContext.request.contextPath}/sprint2" class="link-primary">Try again</a>?
                </h3>
            </c:otherwise>
        </c:choose>
            <c:if test="${not empty requestScope.filter_pub}">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark col-3 text-end">
                <div class="d-flex align-items-center ms-auto mb-3 mb-md-0 md-auto text-white text-decoration-none">
                    <div class="fs-3 text-light fw-bold text-end">${requestScope.filter_pub.getPublicationName()}</div>
                </div>
                    <hr>
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                                ${requestScope.filter_pub.getDescription()}
                        </li>
                        <li class="mt-5">
                        <span class="fs-5">
                            Rating: <span class="fw-bold text-light">${requestScope.filter_pub.getRating()}</span>
                        </span>
                        </li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</main>
</body>
</html>
