<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Home | Task 7.3</title>
  <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container mt-3">
        <div class="row">
            <div class="col-4 mx-auto">
                <c:if test="${not empty requestScope.login_error}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Login Error:</strong> ${requestScope.login_error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/lec7task3" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="input-group mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" id="username" name="username" class="form-control w-25"
                            <c:if test="${not empty sessionScope.current_user}">
                               value="${sessionScope.current_user.getUsername()}"
                            </c:if>>
                    </div>
                    <div class="input-group mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" id="password" name="password" class="form-control w-25"
                        <c:if test="${not empty sessionScope.current_user}">
                               value="${sessionScope.current_user.getPassword()}"
                        </c:if>>
                    </div>
                    <button class="btn btn-primary w-100" type="submit">Log In</button>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>
