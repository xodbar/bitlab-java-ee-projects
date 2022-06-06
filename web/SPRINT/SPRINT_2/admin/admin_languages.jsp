<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 06.06.2022
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Panel | Sprint 2</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header_a.jsp"/>

<main>
    <div class="container mt-3">
        <div class="row">
            <button type="button" class="btn btn-primary fs-6 w-100 mb-3" data-bs-toggle="modal"
                    data-bs-target="#addPubModal">Add New Language</button>
            <c:choose>
                <c:when test="${not empty requestScope.languages}">
                    <table class="table table-hover table-responsive-md">
                        <thead>
                        <tr class="bg-dark text-light">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Code</th>
                            <th>Details</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="language" items="${requestScope.languages}">
                            <tr>
                                <td>${language.getLanguageId()}</td>
                                <td>${language.getLanguageName()}</td>
                                <td>${language.getCode()}</td>
                                <td>
                                    <a type="button" class="btn btn-warning" href="${pageContext.request.contextPath}/sprint2_admin?entity=language&command=details&id=${language.getLanguageId()}">
                                        Edit
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="modal fade" id="addPubModal" tabindex="-1" aria-labelledby="addPubModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addPubModalLabel">Add Language</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                                        <input type="hidden" name="entity" value="language">
                                        <input type="hidden" name="command" value="create">
                                        <div class="input-group">
                                            <label for="lName" class="form-label col">Language name:</label>
                                            <input type="text" id="lName" name="lName" class="form-control col"
                                                   required>
                                        </div>
                                        <div class="input-group">
                                            <label for="lCode" class="form-label col">Code:</label>
                                            <input type="text" name="lCode" id="lCode" class="form-control col"
                                                    maxlength="3" required>
                                        </div>
                                        <div class="input-group mb-3 justify-content-around">
                                            <button type="submit" class="btn btn-primary col-5">Create</button>
                                            <button type="reset" class="btn btn-secondary col-5">Reset</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</main>
</body>
</html>
