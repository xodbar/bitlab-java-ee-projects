<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04.06.2022
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home | Task 7.2</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <c:set var="items" value="${requestScope.items}"/>
    <div class="container mt-4">
        <c:choose>
            <c:when test="${not empty items}">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                        <c:forEach var="item" items="${items}">
                            <div class="col mt-3">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">${item.getItemName()}</h4>
                                    <h5 class="card-subtitle">${item.getPrice()}</h5>
                                    <p class="card-text">${item.getItemDescription()}</p>
                                    <form action="${pageContext.request.contextPath}/lec7task2" method="post">
                                        <input type="hidden" name="command" value="add">
                                        <input type="hidden" name="id" value="${item.getItemId()}">
                                        <button class="btn btn-success w-100">Add to Card</button>
                                    </form>
                                </div>
                            </div>
                            </div>
                        </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <h3>An error was occurred while loading the page.
                        <a href="${pageContext.request.contextPath}/lec7task2" class="link-primary">Try again</a>?
                    </h3>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>