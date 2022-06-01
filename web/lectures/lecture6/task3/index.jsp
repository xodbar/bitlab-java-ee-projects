<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.06.2022
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Task 3 Lec 6</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
    <c:set var="locale" value="${requestScope.locale}"/>
</head>
<body>
<main>
    <div class="container">
        <div class="d-flex justify-content-around bg-dark w-100 p-3">
            <a href="${pageContext.request.contextPath}/lec6task3?locale=en" class="link-light">English</a>
            <a href="${pageContext.request.contextPath}/lec6task3?locale=ru" class="link-light">Русский</a>
        </div>
        <c:choose>
            <c:when test="${not empty locale}">
                <div class="row justify-content-center align-items-center">
                    <div class="col-4 mt-3">
                        <form action="${pageContext.request.contextPath}/lec6task3" method="post" class="mb-5">
                            <input type="hidden" name="c" value="sd">
                            <div class="input-group d-flex justify-content-between mb-3">
                                <label for="insurance_name" class="form-label col-4">${locale.get("lfi1")}</label>
                                <input type="text" id="insurance_name" name="dn" class="form-control col-4"
                                       <c:if test="${not empty requestScope.dn}">value="${requestScope.dn}"</c:if>>
                            </div>
                            <div class="input-group d-flex justify-content-between mb-3">
                                <label for="age" class="form-label col-4">${locale.get("lfi2")}</label>
                                <input type="number" id="age" name="da" class="form-control col-4" min="0" max="100"
                                    <c:if test="${not empty requestScope.da}">value="${requestScope.da}"</c:if>>
                            </div>
                            <div class="input-group d-flex justify-content-between mb-3">
                                <label for="country" class="form-label col-4">${locale.get("lfi3")}</label>
                                <select name="dc" id="country" class="col-4">
                                    <option value="KZ" <c:if test="${requestScope.dc == 'KZ'}">selected</c:if>>
                                        Kazakhstan
                                    </option>
                                    <option value="RU" <c:if test="${requestScope.dc == 'RU'}">selected</c:if>>
                                        Russian
                                    </option>
                                    <option value="CN" <c:if test="${requestScope.dc == 'CN'}">selected</c:if>>
                                        China
                                    </option>
                                </select>
                            </div>
                            <div class="input-group d-flex justify-content-between mb-3">
                                    ${locale.get("lfi4")}:
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input col-4" type="radio" name="dg"
                                           id="gender_male" value="male"
                                        <c:if test="${not empty requestScope.dg && requestScope.dg == 'male'}">
                                           checked
                                        </c:if>>>
                                    <label class="form-check-label col-4" for="gender_male">Male</label>
                                </div>
                                <div class="form-check form-check-inline mb-3">
                                    <input class="form-check-input col-4" type="radio" name="dg"
                                           id="gender_female" value="female"
                                        <c:if test="${not empty requestScope.dg && requestScope.dg == 'female'}">
                                            checked
                                        </c:if>>
                                    <label class="form-check-label col-4" for="gender_female">Female</label>
                                </div>
                            </div>
                            <div class="input-group d-flex justify-content-between mb-3">
                                <label for="insurance_number" class="form-label col-4">${locale.get("lfi5")}</label>
                                <input type="text" class="form-control col-4" placeholder="545 344 234 124"
                                       id="insurance_number" maxlength="12" name="di"
                                    <c:if test="${not empty requestScope.di}">value="${requestScope.di}"</c:if>>
                            </div>
                            <div class="w-100">
                                <button class="btn btn-primary w-100 mb-3" type="submit">Save to Draft</button>
                                <button class="btn btn-secondary w-100" type="reset">Reset</button>
                            </div>
                        </form>
                        <form action="${pageContext.request.contextPath}/lec6task3" method="post">
                            <input type="hidden" name="c" value="dd">
                            <button class="btn btn-danger w-100">
                                Delete from draft
                            </button>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center text-warning">
                    <h5 class="h5">This language is unsupported. Try to choose another one.</h5>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
