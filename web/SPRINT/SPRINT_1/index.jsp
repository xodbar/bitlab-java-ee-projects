<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="../../other/front-libs/libs.html"/>
    <link rel="stylesheet" href="./styles/general.css">
    <title>Home | WebCommerce</title>
</head>
<body>
<jsp:include page="./include/header.jsp"/>

<c:choose>
    <c:when test="${not empty sessionScope.loginError}">
        <div class="alert alert-danger alert-dismissible fade show container mx-auto mt-2" role="alert">
            <h4 class="alert-heading">Sign In/Up Error</h4>
            ${sessionScope.loginError}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:when>
</c:choose>

<main>
    <div class="container mt-4" style="text-align: center">
        <h1>Welcome to WebCommerce E-Shop</h1>
        <h3 class="fw-light text-dark">Electronic devices with high quality and service</h3>
        <c:set var="items" value="${requestScope.items}"/>
        <c:choose>
            <c:when test="${not empty items}">
            <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
                    <c:forEach var="item" items="${items}">
                        <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">${item.getItemName()}</h4>
                            </div>
                            <div class="card-body">
                                <h4 class="text-success size">$${item.getPrice()}</h4>
                                <p class="card-text">${item.getDescription()}</p>
                                <small class="small text-primary mb-2">${item.getBrandName()}</small>
                                <button class="btn btn-success w-100 mt-2">Buy Now</button>
                            </div>
                        </div>
                        </div>
                    </c:forEach>
            </div>
            </c:when>
            <c:otherwise>
                <h2>An error was occurred while loading the page. Try to
                    <a href="${pageContext.request.contextPath}/sprint1" class="link-danger">reload</a> the page.
                </h2>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
