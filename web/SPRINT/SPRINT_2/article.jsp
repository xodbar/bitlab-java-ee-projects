<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<c:set var="article" value="${requestScope.article}"/>
<head>
    <title><c:if test="${not empty article}">${article.getNewsTitle()}</c:if> | World News</title>
    <jsp:include page="../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container">
        <c:choose>
            <c:when test="${not empty article}">
                <div class="row mt-3">
                    <div class="col">
                        <h5>
                            <a href="${pageContext.request.contextPath}/sprint2" class="link-primary">
                                <i class="fa-solid fa-arrow-left"></i> Back to news
                            </a>
                        </h5>
                        <h2 class="mt-3">${article.getNewsTitle()}</h2>
                        <p class="mt-2">
                            ${article.getShortContent()}
                        </p>
                        <img src="${article.getPictureUrl()}" alt="article picture" class="img-fluid"
                             style="max-height: 550px; width: 100%">
                        <div class="mt-2">
                            ${article.getContent()}
                        </div>
                        <div class="pt-4 pb-4">
                            <small class="text-muted text-end pt-4 pb-4">
                                Post date: ${article.getSimplePostDate()}<br>
                                Posted by: ${article.getPublicationName()}
                            </small>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h3 class="mt-3">
                    Incorrect query.
                    <a href="${pageContext.request.contextPath}/sprint2" class="link-primary"> Back to news</a>?
                </h3>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
