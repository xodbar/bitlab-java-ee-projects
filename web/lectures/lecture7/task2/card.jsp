<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 05.06.2022
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Card | Task 7.2</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header.jsp"/>

<main>
    <div class="container mt-3">
        <c:set var="card" value="${sessionScope.card}"/>
        <c:choose>
            <c:when test="${not empty card}">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach var="cardItem" items="${card.getCard()}">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${cardItem.getItemName()}</h4>
                                <h5 class="card-subtitle">${cardItem.getPrice()}</h5>
                                <p class="card-text">${cardItem.getItemDescription()}</p>
                                <h3 class="card-footer">Quantity: ${cardItem.getQuantity()}</h3>
                                <form action="${pageContext.request.contextPath}/lec7task2" method="post">
                                    <input type="hidden" name="command" value="del">
                                    <input type="hidden" name="id" value="${cardItem.getItemId()}">
                                    <button class="btn btn-danger w-100">Remove</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </c:when>
            <c:otherwise>
                <h3>No items in card or unexpected error.
                    <a href="${pageContext.request.contextPath}/lec7task2?card=show" class="link-primary">Try again</a>?
                </h3>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
