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
                    data-bs-target="#addPubModal">Add New News</button>
            <c:choose>
                <c:when test="${not empty requestScope.news}">
                    <table class="table table-hover table-responsive-md">
                        <thead>
                        <tr class="bg-dark text-light">
                            <th>ID</th>
                            <th>Title</th>
                            <th>Post Date</th>
                            <th>Publisher</th>
                            <th>Language</th>
                            <th>Details</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="news" items="${requestScope.news}">
                            <tr>
                                <td>${news.getNewsId()}</td>
                                <td>${news.getNewsTitle()}</td>
                                <td>${news.getSimplePostDate()}</td>
                                <td>${news.getPublicationName()}</td>
                                <td>${news.getLanguageCode()}</td>
                                <td>
                                    <a type="button" class="btn btn-warning" href="${pageContext.request.contextPath}/sprint2_admin?entity=news&command=details&id=${news.getNewsId()}">
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
                                    <h5 class="modal-title" id="addPubModalLabel">Add News</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                                        <input type="hidden" name="entity" value="news">
                                        <input type="hidden" name="command" value="create">
                                        <input type="hidden" name="id" value="${requestScope.editObj.getNewsId()()}">
                                        <div class="input-group">
                                            <label for="nTitle" class="form-label col">News title:</label>
                                            <input type="text" id="nTitle" name="nTitle" class="form-control col"
                                                   required>
                                        </div>
                                        <div class="input-group">
                                            <label for="nShort" class="form-label col">Short content:</label>
                                            <textarea name="nShort" cols="30" rows="10" id="nShort">
                                            </textarea>
                                        </div>
                                        <div class="input-group">
                                            <label for="textarea" class="form-label col">Content:</label>
                                            <textarea name="nContent" cols="30" rows="10" id="textarea">
                                            </textarea>
                                        </div>
                                        <div class="input-group">
                                            <label for="nPicUrl" class="form-label col">Picture URL:</label>
                                            <input type="text" id="nPicUrl" name="nPicUrl" class="form-control col"
                                                    required>
                                        </div>
                                        <div class="input-group">
                                            <label for="nLang" class="form-label col">Language:</label>
                                            <select name="nLang" id="nLang" required class="form-control col">
                                                <c:forEach var="language" items="${requestScope.languages}">
                                                    <option value="${language.getLanguageId()}">${language.getLanguageName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <label for="nPub" class="form-label col">Language:</label>
                                            <select name="nPub" id="nPub" required class="form-control col">
                                                <c:forEach var="publication" items="${requestScope.publications}">
                                                    <option value="${publication.getPublicationId()}">${publication.getPublicationName()}</option>
                                                </c:forEach>
                                            </select>
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
