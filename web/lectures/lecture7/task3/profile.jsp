<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile | Task 7.3</title>
  <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container mt-3">
        <div class="row">
            <div class="col-4">
                <c:if test="${not empty requestScope.login_error}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Login Error:</strong> ${requestScope.login_error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
            <c:choose>
                <c:when test="${not empty sessionScope.current_user}">
                    <div class="col-4">
                        Username: ${sessionScope.current_user.getUsername()}
                        Password: ${sessionScope.current_user.getPassword()}
                        <form action="${pageContext.request.contextPath}/lec7task3" method="post">
                            <input type="hidden" name="action" value="logout">
                            <button class="btn btn-danger w-100 p-1" type="submit">Log Out</button>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-4">
                        <h3>You haven't authorized yet.
                            <a href="${pageContext.request.contextPath}/lec7task3" class="link-primary">Login</a>
                        </h3>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>
</body>
</html>
