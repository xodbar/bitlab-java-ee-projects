<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24.05.2022
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Manage Items | WebCommerce</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
    <div class="container">
        <table class="table table-hover">
            <thead class="table-header table-primary">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>DESCRIPTION</th>
                <th>PRICE</th>
                <th class="text-center"><i class="fa-solid fa-user-gear"></i></th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty pageContext.getAttribute('items')}">
                    <c:forEach var="item" items="items">
                        <tr>
                            <td>${item.getItemId()}</td>
                            <td>${item.getItemName()}</td>
                            <td>${item.getDescription()}</td>
                            <td>${item.getPrice()}</td>
                            <td><a href="" class="btn btn-primary">Edit</a></td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
