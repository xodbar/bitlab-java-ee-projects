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
                    data-bs-target="#addPubModal">Add New Publication</button>
            <c:choose>
                <c:when test="${not empty requestScope.publications}">
                    <table class="table table-hover  table-responsive-md">
                        <thead>
                        <tr class="bg-dark text-light">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Rating</th>
                            <th>Details</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="publication" items="${requestScope.publications}">
                            <tr>
                                <td>${publication.getPublicationId()}</td>
                                <td>${publication.getPublicationName()}</td>
                                <td>${publication.getDescription()}</td>
                                <td>${publication.getRating()}</td>
                                <td>
                                    <a type="button" class="btn btn-warning" href="${pageContext.request.contextPath}/sprint2_admin?entity=publication&command=details&id=${publication.getPublicationId()}">
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
                                    <h5 class="modal-title" id="addPubModalLabel">Add Publication</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                                        <input type="hidden" name="entity" value="publication">
                                        <input type="hidden" name="command" value="create">
                                        <div class="input-group">
                                            <label for="pName" class="form-label col">Publication name:</label>
                                            <input type="text" id="pName" name="pName" class="form-control col"
                                                   required>
                                        </div>
                                        <div class="input-group">
                                            <label for="pDesc" class="form-label col">Description:</label>
                                            <textarea name="pDesc" id="pDesc" cols="30" rows="10">

                                            </textarea>
                                        </div>
                                        <div class="input-group">
                                            <label for="pRating" class="form-label col">Publication rating:</label>
                                            <input type="number" id="pRating" name="pRating" class="form-control col" maxlength="2" min="0.0" max="9.9" step="0.1"
                                                    required>
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
