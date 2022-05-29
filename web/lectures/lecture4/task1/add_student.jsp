<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22.05.2022
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Add Student</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="include/header.html"/>

<main>
    <div class="container" style="display: flex; flex-direction: column; align-items: center">
        <form action="${pageContext.request.contextPath}/lec4task1" method="post" style="width: 250px;">
            <input type="hidden" name="command" value="add">
            <input type="hidden" name="entity" value="student">
            <div class="form-group">
                <label for="student_name">Name:</label>
                <input required class="form-control" type="text" id="student_name" name="student_name">
            </div>
            <div class="form-group">
                <label for="student_surname">Surname:</label>
                <input required class="form-control" type="text" id="student_surname" name="student_surname">
            </div>
            <div class="form-group">
                <label for="student_birth_date">Birth Date:</label>
                <input required class="form-control" type="date" id="student_birth_date" name="student_birth_date">
            </div>
            <div class="form-group">
                <label for="student_city_id">City:</label>
                <select class="form-select" id="student_city_id" name="student_city_id" required>
                    <c:set var="cities" value="${requestScope.cities}"/>
                    <c:choose>
                        <c:when test="${not empty cities}">
                            <c:forEach var="city" items="${cities}">
                                <option value="${city.getCityId()}">${city.getCityName()}</option>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <option value="-1" disabled>An error was occurred while loading cities</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div class="form-group" style="display:flex; justify-content: space-between; flex-wrap: wrap">
                <button type="submit" class="btn btn-primary col-sm">Add</button>
                <a href="${pageContext.request.contextPath}/lec4task1" class="btn btn-secondary col-sm">Back to List</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>
