<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 31.05.2022
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="siteName" value="${requestScope.site_name}"/>
<c:set var="cookieError" value="${requestScope.cookie_error}"/>
<html>
<head>
    <jsp:include page="../../../other/front-libs/libs.html"/>
    <title>
        <c:choose>
            <c:when test="${not empty siteName}">${siteName}</c:when>
            <c:otherwise>Default Site Name</c:otherwise>
        </c:choose>
    </title>
</head>
<body>
<main>
    <div class="container mt-3" style="width: 100vh">
        <div class="row justify-content-center">
            <div class="col-8">
                <form action="${pageContext.request.contextPath}/lec6task1" method="post">
                    <input type="hidden" name="command" value="set">
                    <div class="mb-3">
                        <label for="site_name_field" class="form-label">Site Name:</label>
                        <input type="text" class="form-control w-100" id="site_name_field"
                        name="new_site_name">
                    </div>
                    <div class="mb-3">
                        Bugs & Errors:
                        <c:choose>
                            <c:when test="${not empty cookieError}">
                                <span class="text-danger">${cookieError}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-success">OK</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="mb-5">
                        <button class="btn btn-success w-100 text-center" type="submit">Set Name</button>
                    </div>
                </form>
                <form action="${pageContext.request.contextPath}/lec6task1" method="post">
                    <input type="hidden" name="command" value="delete">
                    <button class="btn btn-danger w-100 text-center">Delete Current</button>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>
