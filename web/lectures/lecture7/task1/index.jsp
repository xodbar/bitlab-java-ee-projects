<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.06.2022
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Task 7.1 | Step 1</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container">
        <form action="${pageContext.request.contextPath}/lec7task1" method="get">
            <input type="hidden" name="ns" value="2" class="w-100">
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name"
                       name="name" required
                       <c:if test="${not empty sessionScope.current_name}">value="${sessionScope.current_name}"</c:if>
                >
            </div>
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="surname" class="form-label">Surname:</label>
                <input type="text" class="form-control" id="surname"
                       name="surname" required
                <c:if test="${not empty sessionScope.current_surname}">
                        value="${sessionScope.current_surname}"
                </c:if>
                >
            </div>
            <div class="input-groups d-flex justify-content-between mb-5">
                <label for="age" class="form-label">Age:</label>
                <input type="number" class="form-control" id="age"
                       name="age" required
                       <c:if test="${not empty sessionScope.current_age}">value="${sessionScope.current_age}"</c:if>>
            </div>
            <button type="submit" class="btn btn-success w-100">
                Next
            </button>
        </form>
    </div>
</main>
</body>
</html>
