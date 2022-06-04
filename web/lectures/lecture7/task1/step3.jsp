<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.06.2022
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Step 3 | Task 7.1</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container">
        <form action="${pageContext.request.contextPath}/lec7task1" method="get">
            <input type="hidden" name="ns" value="4" class="d-flex w-100">
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="university" class="form-label">City:</label>
                <input type="text" class="form-control" id="university"
                       name="university" required
                <c:if test="${not empty sessionScope.current_university}">
                       value="${sessionScope.current_university}"
                </c:if>
                >
            </div>
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="faculty" class="form-label">Faculty:</label>
                <input type="text" class="form-control" id="faculty"
                       name="faculty" required
                <c:if test="${not empty sessionScope.current_faculty}">
                       value="${sessionScope.current_faculty}"
                </c:if>
                >
            </div>
            <div class="input-groups d-flex justify-content-between mb-5">
                <label for="group" class="form-label">Group:</label>
                <input type="text" class="form-control" id="group"
                       name="group" required
                <c:if test="${not empty sessionScope.current_group}">
                       value="${sessionScope.current_group}"
                </c:if>
                >
            </div>
            <button type="submit" class="btn btn-success w-100">
                Next
            </button>
        </form>
    </div>
</main>
</body>
</html>
