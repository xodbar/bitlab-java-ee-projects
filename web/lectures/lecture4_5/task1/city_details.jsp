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
        <c:set var="city" value="${requestScope.city}"/>
        <c:choose>
            <c:when test="${not empty city}">
                        <div class="contact_info mx-auto" style="width: 300px">
                            <form action="${pageContext.request.contextPath}/lec4task1"
                                  method="post">
                                <input type="hidden" name="entity" value="city">
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="id" value="${city.getCityId()}">
                                <div class="mb-3 row mx-auto">
                                    <label for="city_name" class="col-sm col-form-label">Name:</label>
                                    <div class="col-sm">
                                        <input type="text" readonly class="form-control"
                                               id="city_name" name="city_name" value="${city.getCityName()}"
                                               onchange="checkChanges()">
                                    </div>
                                </div>
                                <div class="mb-3 row mx-auto">
                                    <label for="city_code" class="col-sm col-form-label">Surname:</label>
                                    <div class="col-sm">
                                        <input type="text" readonly class="form-control"
                                               id="city_code" name="city_code" value="${city.getCode()}"
                                               onchange="checkChanges()">
                                    </div>
                                </div>
                                <button onclick="makeEditable()" type="button"
                                        class="btn btn-primary w-100 mb-3">Edit City</button>
                                <button id="saveButton" type="submit"
                                        class="btn btn-warning w-100 mb-3" disabled="disabled">Save Changes</button>
                                <a href="${pageContext.request.contextPath}/lec4task1?entity=city&command=list"
                                   class="btn btn-secondary w-100 mb-3">Back to List</a>
                            </form>
                            <form action="${pageContext.request.contextPath}/lec4task1?entity=city&command=delete&id=${city.getCityId()}"
                                  method="post">
                                <button type="button" class="btn btn-danger w-100 mt-5"
                                        data-bs-toggle="modal" data-bs-target="#deleteConfirm"
                                >Delete City</button>

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
                                                Are you sure want to delete this city?
                                                <span class="text-danger">
                                                    ALL STUDENTS FROM THIS CITY WILL BE DELETED
                                                </span>
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
                    <a href="${pageContext.request.contextPath}/lec4task1" class="link-primary">reload</a>
                    the page
                </h3>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<script>
    <c:set var="cities" value="${requestScope.cities}"/>
    <c:choose>
    <c:when test="${not empty cities}">

    function checkAvailability() {

    }

    function checkChanges() {
        if (
            document.getElementById("city_name").value === '${city.getCityName()}' &&
            document.getElementById("city_code").value === '${city.getCode()}'
        ) {
            document.getElementById("saveButton").setAttribute('disabled', 'disabled');
        } else {
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
                document.getElementById("saveButton").setAttribute('disabled', 'disabled');
            }
            else document.getElementById("saveButton").removeAttribute('disabled');
        }
    }

    function makeEditable() {
        document.getElementById("city_name").removeAttribute('readonly');
        document.getElementById("city_code").removeAttribute('readonly');
    }
    </c:when>
    </c:choose>
</script>
</body>
</html>
