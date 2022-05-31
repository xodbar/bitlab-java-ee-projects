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
        <c:set var="citites" value="${requestScope.cities}"/>
        <c:choose>
            <c:when test="${not empty citites}">
                <c:choose>
                    <c:when test="${not empty student}">
                        <div class="contact_info mx-auto" style="width: 300px">
                            <form action="${pageContext.request.contextPath}/lec4task1"
                                  method="post">
                                <input type="hidden" name="entity" value="student">
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="id" value="${student.getStudentId()}">
                                <div class="mb-3 row mx-auto">
                                    <label for="studentName" class="col-sm col-form-label">Name:</label>
                                    <div class="col-sm">
                                        <input type="text" readonly class="form-control"
                                               id="studentName" name="studentName" value="${student.getStudentName()}"
                                               onchange="checkChanges()">
                                    </div>
                                </div>
                                <div class="mb-3 row mx-auto">
                                    <label for="studentSurname" class="col-sm col-form-label">Surname:</label>
                                    <div class="col-sm">
                                        <input type="text" readonly class="form-control"
                                               id="studentSurname" name="studentSurname" value="${student.getSurname()}"
                                               onchange="checkChanges()">
                                    </div>
                                </div>
                                <div class="mb-3 row mx-auto">
                                    <label for="studentDate" class="col-sm col-form-label">Birth Date:</label>
                                    <div class="col-sm">
                                        <input type="date" readonly class="form-control"
                                               id="studentDate" name="studentDate" value="${student.getBirthDate()}"
                                               onchange="checkChanges()">
                                    </div>
                                </div>
                                <div class="mb-3 row mx-auto">
                                    <label for="studentCity" class="col-sm col-form-label">City:</label>
                                    <div class="col-sm">
                                        <select name="studentCityId" id="studentCity" readonly onchange="checkChanges()">
                                            <option value="${student.getCityId()}" selected>
                                                    ${student.getCityName()}
                                            </option>
                                            <c:forEach var="city" items="${requestScope.cities}">
                                                <option value="${city.getCityId()}">${city.getCityName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <button onclick="makeEditable()" type="button"
                                        class="btn btn-primary w-100 mb-3">Edit Student</button>
                                <button id="saveButton" type="submit"
                                        class="btn btn-warning w-100 mb-3" disabled="disabled">Save Changes</button>
                                <a href="${pageContext.request.contextPath}/lec4task1"
                                   class="btn btn-secondary w-100 mb-3">Back to List</a>
                            </form>
                            <form action="${pageContext.request.contextPath}/lec4task1?entity=student&command=delete&id=${student.getStudentId()}"
                                  method="post">
                                <button type="button" class="btn btn-danger w-100 mt-5"
                                        data-bs-toggle="modal" data-bs-target="#deleteConfirm"
                                >Delete Student</button>

                                <div class="modal fade" id="deleteConfirm" tabindex="-1" aria-labelledby="confirmLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmLabel">Are you sure?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure want to delete this student?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-danger"
                                                        data-bs-dismiss="modal">Delete</button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="mb-3 row mx-auto" style="width: 150px">
                            <h3>
                                Invalid request. Try to
                                <a href="${pageContext.request.contextPath}/lec4task1" class="link-primary">
                                    reload
                                </a>
                                the page
                            </h3>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
            <div class="mb-3 row mx-auto" style="width: 150px">
                <h3>
                    Invalid request. Try to
                    <a href="${pageContext.request.contextPath}/lec4task1" class="link-primary">reload</a>
                    the page
                </h3>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<script>
    function checkChanges() {
        if (
            document.getElementById("studentName").value === '${student.getStudentName()}' &&
            document.getElementById("studentSurname").value === '${student.getSurname()}' &&
            document.getElementById("studentDate").value === '${student.getBirthDate()}' &&
            document.getElementById("studentCity").value === '${student.getCityId()}'
        ) {
            document.getElementById("saveButton").setAttribute('disabled', 'disabled');
        } else {
            document.getElementById("saveButton").removeAttribute('disabled');
        }
    }

    function makeEditable() {
        document.getElementById("studentName").removeAttribute('readonly');
        document.getElementById("studentSurname").removeAttribute('readonly');
        document.getElementById("studentDate").removeAttribute('readonly');
        document.getElementById("studentCity").removeAttribute('readonly');
    }
</script>
</body>
</html>
