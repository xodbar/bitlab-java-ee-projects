<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 31.05.2022
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Task 2 | Cookies</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <c:if test="${not empty requestScope.cookies_error}">
            <span class="h5 text-danger">Cookie error: ${requestScope.cookie_error}</span>
        </c:if>
        <div class="col-5">
            <form action="${pageContext.request.contextPath}/lec6task2" method="post">
                <input type="hidden" name="command" value="set">
                <div class="mb-3">
                    <label for="draft_name" class="form-label">Name:</label>
                    <input type="text" id="draft_name" class="form-control" name="draft_name" required
                    <c:if test="${not empty requestScope.draft_name}">value="${requestScope.draft_name}"</c:if>>
                </div>
                <div class="mb-3">
                    <label for="draft_surname" class="form-label">Surname:</label>
                    <input type="text" id="draft_surname" class="form-control" name="draft_surname" required
                    <c:if test="${not empty requestScope.draft_surname}">value="${requestScope.draft_surname}"</c:if>>
                </div>
                <div class="mb-3">
                    <label class="form-label">Gender:</label>
                    <div class="form-check">
                        <input type="radio" name="draft_gender" id="draft_gender_m" class="form-check-input"
                               value="male"
                               <c:if test="${requestScope.draft_gender == 'male'}">checked</c:if>>
                        <label for="draft_gender_m">Male</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="draft_gender" id="draft_gender_f" class="form-check-input"
                               value="female"
                        <c:if test="${requestScope.draft_gender == 'female'}">checked</c:if>>
                        <label for="draft_gender_f">Female</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="draft_age" class="form-label">Age:</label>
                    <input type="number" class="form-control" min="16" max="100" id="draft_age" name="draft_age"
                    <c:if test="${not empty requestScope.draft_age}">value="${requestScope.draft_age}"</c:if> required>
                </div>
                <div class="mb-3">
                    <label for="draft_country">Country:</label>
                    <select name="draft_country" id="draft_country" class="form-select" onload="setCountry()" required>
                        <option value="kz">Kazakhstan</option>
                        <option value="usa">USA</option>
                        <option value="rus">Russia</option>
                        <option value="cn">China</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="draft_card">Card Number:</label>
                    <input type="number" class="form-control" id="draft_card" name="draft_card" maxlength="16"
                    <c:if test="${not empty requestScope.draft_card}">value="${requestScope.draft_card}"</c:if>>
                </div>
                <div class="mb-5">
                    <button class="btn btn-secondary text-center w-100">Save to Draft</button>
                </div>
            </form>
            <form action="${pageContext.request.contextPath}/lec6task2" method="post">
                <input type="hidden" name="command" value="delete">
                <button class="btn btn-danger text-center w-100">Delete Draft</button>
            </form>
        </div>
    </div>
</div>
</body>

<script>
    function setCountry() {
        <c:if test="${not empty requestScope.draft_country}">
            document.getElementById("draft_country").value="${requestScope.draft_country}";
        </c:if>
    }
</script>
</html>
