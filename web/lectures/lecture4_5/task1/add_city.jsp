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
            <input type="hidden" name="entity" value="city">
            <div class="form-group">
                <label for="city_name">City Name:</label>
                <input required class="form-control" type="text"
                       id="city_name" name="city_name" onchange="checkAvailability()">
            </div>
            <div class="form-group">
                <label for="city_code">City Code (Max. 3 characters):</label>
                <input required class="form-control" type="text" id="city_code"
                       name="city_code" maxlength="3" onchange="checkAvailability()">
            </div>
            <div class="form-group" style="display:flex; justify-content: space-between; flex-wrap: wrap">
                <button type="submit" class="btn btn-primary col-sm" id="addButton" disabled>Add</button>
                <a href="${pageContext.request.contextPath}/lec4task1" class="btn btn-secondary col-sm">Back to List</a>
            </div>
        </form>
    </div>
</main>
</body>
<script>
    <c:set var="cities" value="${requestScope.cities}"/>
    <c:choose>
    <c:when test="${not empty cities}">

    function checkAvailability() {
        let flag = false;

        let names = [];
        let codes = [];

        <c:forEach var="city" items="${cities}">
        names.push('${city.getCityName()}');
        codes.push('${city.getCode()}')
        </c:forEach>

        for (let i = 0; i < names.length; i++) {
            if (names[i] === document.getElementById("city_name").value ||
                codes[i] === document.getElementById("city_code").value)
            {
                flag = true;
                break;
            }
        }

        if (flag) {
            alert('City with this name or code is already exists!');
            document.getElementById("addButton").setAttribute('disabled', 'disabled');
        }
        else document.getElementById("addButton").removeAttribute('disabled');
    }
    </c:when>
    </c:choose>
</script>
</html>
