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
    <title>Result | Task 7.1</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<div class="container">
    <c:choose>
        <c:when test="${not empty sessionScope.current_group}">
            <div class="row mt-3">
                <h2>Results:</h2>
                <c:if test="${not empty sessionScope.current_name}">
                    <h3>Name: <span class="fw-normal">${sessionScope.current_name}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_surname}">
                    <h3>Surname: <span class="fw-normal">${sessionScope.current_surname}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_age}">
                    <h3>Age: <span class="fw-normal">${sessionScope.current_age}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_city}">
                    <h3>City: <span class="fw-normal">${sessionScope.current_city}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_address}">
                    <h3>Address: <span class="fw-normal">${sessionScope.current_address}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_phone}">
                    <h3>Phone: <span class="fw-normal">${sessionScope.current_phone}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_university}">
                    <h3>University: <span class="fw-normal">${sessionScope.current_university}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_faculty}">
                    <h3>Faculty: <span class="fw-normal">${sessionScope.current_faculty}</span></h3>
                </c:if>
                <c:if test="${not empty sessionScope.current_group}">
                    <h3>Group: <span class="fw-normal">${sessionScope.current_group}</span></h3>
                </c:if>

                <form action="${pageContext.request.contextPath}/lec7task1" method="post">
                    <input type="hidden" name="action" value="clear">
                    <button class="btn btn-danger w-100 p-2" type="submit">Clear data</button>
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <h3 class="text-danger">Error</h3>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
