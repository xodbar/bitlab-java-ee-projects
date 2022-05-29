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
                <td>ID</td>
                <td>Name</td>
                <td>Surname</td>
                <td>Birth Date</td>
                <td>City</td>
            </tr>
            </thead>
            <tbody>
            <c:set var="students" value="${requestScope.students}"/>
            <c:choose>
                <c:when test="${not empty students}">
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.getStudentId()}</td>
                            <td>${student.getStudentName()}</td>
                            <td>${student.getSurname()}</td>
                            <td>${student.getBirthDate()}</td>
                            <td>${student.getCityName()}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}
                                /lec4task1?command=details&entity=student&id=${student.getStudentId()}"
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
            <%--Using scriptlets (!!!have to initialize students!!!)<%
                for (Student student : students) {
            %>
            <tr>
                <td><%=student.getStudentId()%></td>
                <td><%=student.getStudentName()%></td>
                <td><%=student.getSurname()%></td>
                <td><%=student.getBirthDate()%></td>
                <td><%=student.getCity()%></td>
            </tr>
            <%
                }
            %>--%>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
