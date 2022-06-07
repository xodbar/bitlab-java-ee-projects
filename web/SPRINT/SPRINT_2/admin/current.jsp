<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 06.06.2022
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit | Sprint 2</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./parts/header_a.jsp"/>

<main>
    <div class="container mt-3">
        <c:choose>
            <c:when test="${requestScope.entity == 'user' && not empty requestScope.editObj}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="user">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getUserId()}">
                    <div class="input-group mb-3">
                        <label for="username" class="form-label col-3">Username:</label>
                        <input type="text" id="username" name="username" class="form-control col-9"
                               value="${requestScope.editObj.getUsername()}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="password" class="form-label col-3">Password:</label>
                        <input type="text" id="password" name="password" class="form-control col-9"
                               value="${requestScope.editObj.getPassword()}" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2 mb-3">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="user">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getUserId()}">
                    <button class="btn btn-danger text-center w-100 mb-5">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'language' && not empty requestScope.editObj}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="language">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getLanguageId()}">
                    <div class="input-group mb-3">
                        <label for="lName" class="form-label col-3">Language name:</label>
                        <input type="text" id="lName" name="lName" class="form-control col-9"
                               value="${requestScope.editObj.getLanguageName()}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="lCode" class="form-label col">Code:</label>
                        <input type="text" id="lCode" name="lCode" class="form-control col"
                               value="${requestScope.editObj.getCode()}" maxlength="3" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2 mb-3">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="language">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getLanguageId()}">
                    <button class="btn btn-danger text-center w-100 mb-3">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'publication' && not empty requestScope.editObj}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="publication">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getPublicationId()}">
                    <div class="input-group mb-3">
                        <label for="pName" class="form-label col-3">Publication name:</label>
                        <input type="text" id="pName" name="pName" class="form-control col-9"
                               value="${requestScope.editObj.getPublicationName()}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="pDesc" class="form-label col-3">Description:</label>
                        <textarea name="pDesc" id="pDesc" cols="30" rows="10" class="form-control col-9">${requestScope.editObj.getDescription()}</textarea>
                    </div>
                    <div class="input-group mb-3">
                        <label for="pRating" class="form-label col-3">Publication rating:</label>
                        <input type="number" id="pRating" name="pRating" class="form-control col-9" maxlength="2" min="0.0" max="9.9" step="0.1"
                               value="${requestScope.editObj.getRating()}" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2 mb-3">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="publication">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getPublicationId()}">
                    <button class="btn btn-danger text-center w-100 mb-3">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'news' && not empty requestScope.editObj}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="news">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getNewsId()}">
                    <div class="input-group mb-3">
                        <label for="nTitle" class="form-label col-3">News title:</label>
                        <input type="text" id="nTitle" name="nTitle" class="form-control col-9"
                               value="${requestScope.editObj.getNewsTitle()}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="nShort" class="form-label col-3">Short content:</label>
                        <textarea name="nShort" cols="30" rows="10" id="nShort" class="form-control col-9">${requestScope.editObj.getShortContent()}</textarea>
                    </div>
                    <div class="input-group mb-3">
                        <label for="textarea" class="form-label col">Content:</label>
                        <textarea name="nContent" cols="80" rows="25" id="textarea">${requestScope.editObj.getContent()}</textarea>
                    </div>
                    <div class="input-group mb-3">
                        <label for="nPicUrl" class="form-label col-3">Picture URL:</label>
                        <input type="text" id="nPicUrl" name="nPicUrl" class="form-control col-9"
                               value="${requestScope.editObj.getPictureUrl()}" required>
                    </div>
                    <div class="input-group mb-3">
                        <label for="nLang" class="form-label col-3">Language:</label>
                        <select name="nLang" id="nLang" required class="form-control col-9">
                            <c:forEach var="language" items="${requestScope.languages}">
                                <option value="${language.getLanguageId()}">${language.getLanguageName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label for="nPub" class="form-label col-3">Publication:</label>
                        <select name="nPub" id="nPub" required class="form-control col-9">
                            <c:forEach var="publication" items="${requestScope.publications}">
                                <option value="${publication.getPublicationId()}">${publication.getPublicationName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2 mb-3">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="news">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getNewsId()}">
                    <button class="btn btn-danger text-center w-100 mb-3">Delete</button>
                </form>
            </c:when>
            <c:otherwise>
                <h3>Error while showing details of ${requestScope.entity}</h3>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
