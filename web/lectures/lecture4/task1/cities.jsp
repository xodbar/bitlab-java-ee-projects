<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Students App</title>
    <jsp:include page="./../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./include/header.html"/>

<main>
    <div class="container">
        <table class="table table-hover">
            <thead style="font-weight: bold">
            <tr>
                <th>ID</th>
                <th>City Name</th>
                <th>City Code</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="cities" value="${requestScope.cities}"/>
            <c:choose>
                <c:when test="${not empty cities}">
                    <c:forEach var="city" items="${cities}">
                        <tr>
                            <td>${city.getCityId()}</td>
                            <td>${city.getCityName()}</td>
                            <td>${city.getCode()}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}
                                /lec4task1?command=details&entity=city&id=${city.getCityId()}"
                                   class="btn btn-primary">
                                    Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">
                            Error while connecting to the DB. Try to
                            <a class="link-primary" href="${pageContext.request.contextPath}/lec4task1">reload</a>
                            the page.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
