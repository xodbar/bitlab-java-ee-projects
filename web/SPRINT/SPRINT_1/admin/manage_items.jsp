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
    <div class="container mt-4">
        <a class="w-100 btn btn-primary mb-3" data-bs-target="#addItem" data-bs-toggle="modal" data-bs-dismiss="modal">
            Add New Item
        </a>
        <table class="table table-hover">
            <thead class="table-header table-primary">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>DESCRIPTION</th>
                <th>PRICE</th>
                <th>COUNTRY</th>
                <th class="text-center"><i class="fa-solid fa-user-gear"></i></th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty requestScope.items}">
                    <c:forEach var="item" items="${requestScope.items}">
                        <tr>
                            <td>${item.getItemId()}</td>
                            <td>${item.getItemName()}</td>
                            <td>${item.getDescription()}</td>
                            <td>${item.getPrice()}</td>
                            <td>${item.getBrandName()}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=items&command=details&id=${item.getItemId()}"
                                        class="btn btn-primary">
                                    Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">
                            <h3 class="h3">An error was occurred while loading the page.
                                <a href="${pageContext.request.contextPath}/sprint1_admin?entity=users"
                                class="link-primary"> Try again</a>?
                            </h3>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <c:set var="brandsList" value="${requestScope.brands_list}"/>
    <c:choose>
        <c:when test="${not empty brandsList}">
            <div class="modal fade" id="addItem" aria-hidden="true" aria-labelledby="addItemLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addItemLabel">Add new item</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/sprint1_admin?entity=item&command=1"
                              method="post" id="addItemForm">
                            <div class="row align-items-center mb-3">
                                <div class="col-sm-4">
                                    <label for="newItemName" class="col-form-label">Name:</label>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" id="newItemName" class="form-control"
                                           name="new_item_name" required>
                                </div>
                            </div>
                            <div class="row align-items-center mb-3">
                                <div class="col-sm-4">
                                    <label for="newItemPrice" class="col-form-label">Name:</label>
                                </div>
                                <div class="col-sm-8">
                                    <input type="number" id="newItemPrice" class="form-control"
                                           min="0.99" max="999999.99" step="1.01"
                                           name="new_item_price" required>
                                </div>
                            </div>
                            <div class="row align-items-center mb-3">
                                <div class="col-sm-4">
                                    <label for="newItemBrand" class="col-form-label">Brand:</label>
                                </div>
                                <div class="col-sm-8">
                                    <select name="new_item_brand_id" id="newItemBrand" required>
                                        <c:forEach var="brand" items="${brandsList}">
                                            <option value="${brand.getBrandId()}">${brand.getBrandName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row align-items-center mb-4">
                                <div class="col-sm-4">
                                    <label for="newItemDescription" class="col-form-label">Name:</label>
                                </div>
                                <div class="col-sm-8">
                                    <textarea type="text" id="newItemDescription" class="form-control"
                                              name="new_item_description" required></textarea>
                                </div>
                            </div>
                            <div class="row align-items-center mb-3 justify-content-around">
                                <button class="btn btn-secondary col-sm-4" type="reset">Reset</button>
                                <button class="btn btn-primary col-sm-4"
                                        type="submit" id="newItemAddButton">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <h1>An error occurred while loading brands</h1>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
