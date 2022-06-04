<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Task 7.2 | Step 1</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container">
        <form action="${pageContext.request.contextPath}/lec7task1" method="get">
            <input type="hidden" name="ns" value="3" class="w-100">
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="city" class="form-label">City:</label>
                <select name="city" id="city" class="form-select" required>
                    <c:if test="${not empty sessionScope.current_city}">
                        <option value="${sessionScope.current_city}" selected>
                                ${sessionScope.current_city}
                        </option>
                    </c:if>
                    <option value="Taldykorgan">Taldykorgan</option>
                    <option value="Taraz">Taraz</option>
                    <option value="Almaty">Almaty</option>
                </select>
            </div>
            <div class="input-groups d-flex justify-content-between mb-3">
                <label for="address" class="form-label">Address:</label>
                <input type="text" class="form-control" id="address"
                       name="address" required
                <c:if test="${not empty sessionScope.current_address}">
                       value="${sessionScope.current_address}"
                </c:if>
                >
            </div>
            <div class="input-groups d-flex justify-content-between mb-5">
                <label for="phone" class="form-label">Phone:</label>
                <input type="text" class="form-control" id="phone"
                       name="phone" required
                       <c:if test="${not empty sessionScope.current_phone}">value="${sessionScope.current_age}"</c:if>>
            </div>
            <button type="submit" class="btn btn-success w-100">
                Next
            </button>
        </form>
    </div>
</main>
</body>
</html>
