<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <jsp:include page="./../../../other/front-libs/libs.html"/>

    <style>
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="./include/header.html"/>

<main>
    <div class="container">
        <c:set var="student" value="${requestScope.student}"/>
        <c:choose>
            <c:when test="${not empty student}">
                <div class="contact_info mx-auto" style="width: 300px">
                    <div class="mb-3 row mx-auto">
                        <label for="studentId" class="col-sm col-form-label">ID:</label>
                        <div class="col-sm">
                            <input type="text" readonly class="form-control-plaintext"
                                   id="studentId" value="${student.getStudentId()}">
                        </div>
                    </div>
                    <div class="mb-3 row mx-auto">
                        <label for="studentName" class="col-sm col-form-label">Name:</label>
                        <div class="col-sm">
                            <input type="text" readonly class="form-control-plaintext"
                                   id="studentName" value="${student.getStudentName()}">
                        </div>
                    </div>
                    <div class="mb-3 row mx-auto">
                        <label for="studentSurname" class="col-sm col-form-label">Surname:</label>
                        <div class="col-sm">
                            <input type="text" readonly class="form-control-plaintext"
                                   id="studentSurname" value="${student.getSurname()}">
                        </div>
                    </div>
                    <div class="mb-3 row mx-auto">
                        <label for="studentDate" class="col-sm col-form-label">Birth Date:</label>
                        <div class="col-sm">
                            <input type="date" readonly class="form-control-plaintext"
                                   id="studentDate" value="${student.getBirthDate()}">
                        </div>
                    </div>
                    <div class="mb-3 row mx-auto">
                        <label for="studentCity" class="col-sm col-form-label">City:</label>
                        <div class="col-sm">
                            <input type="text" readonly class="form-control-plaintext"
                                   id="studentCity" value="${student.getCity()}">
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/lec3task1"
                       class="btn btn-secondary w-100">Back to List</a>
                </div>
            </c:when>
            <c:otherwise>
            <div class="mb-3 row mx-auto" style="width: 150px">
                <h3>
                    Invalid request. Try to
                    <a href="${pageContext.request.contextPath}/lec3task1" class="link-primary">reload</a>
                    the page
                </h3>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
