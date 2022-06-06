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
                    <div class="input-group">
                        <label for="username" class="form-label col">Username:</label>
                        <input type="text" id="username" name="username" class="form-control col"
                               value="${requestScope.editObj.getUsername()}" required>
                    </div>
                    <div class="input-group">
                        <label for="password" class="form-label col">Password:</label>
                        <input type="text" id="password" name="password" class="form-control col"
                               value="${requestScope.editObj.getPassword()}" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="user">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getUserId()}">
                    <button class="btn btn-danger text-center w-100">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'language' && not empty requestScope.language}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="language">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getLanguageId()}">
                    <div class="input-group">
                        <label for="lName" class="form-label col">Language name:</label>
                        <input type="text" id="lName" name="lName" class="form-control col"
                               value="${requestScope.editObj.getLanguageName()}" required>
                    </div>
                    <div class="input-group">
                        <label for="lCode" class="form-label col">Code:</label>
                        <input type="text" id="lCode" name="lCode" class="form-control col"
                               value="${requestScope.editObj.getCode()}" maxlength="3" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="language">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getLanguageId()}">
                    <button class="btn btn-danger text-center w-100">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'publication' && not empty requestScope.publication}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="publication">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getPublicationId()}">
                    <div class="input-group">
                        <label for="pName" class="form-label col">Publication name:</label>
                        <input type="text" id="pName" name="pName" class="form-control col"
                               value="${requestScope.editObj.getPublicationName()}" required>
                    </div>
                    <div class="input-group">
                        <label for="pDesc" class="form-label col">Description:</label>
                        <textarea name="pDesc" id="pDesc" cols="30" rows="10">
                                ${requestScope.editObj.getDescription()}
                        </textarea>
                    </div>
                    <div class="input-group">
                        <label for="pRating" class="form-label col">Publication rating:</label>
                        <input type="number" id="pRating" name="pRating" class="form-control col" maxlength="2" min="0.0" max="9.9" step="0.1"
                               value="${requestScope.editObj.getPublicationRating()}" required>
                    </div>
                    <button type="submit" class="btn btn-primary text-center w-100 p-2">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="publication">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getPublicationId()}">
                    <button class="btn btn-danger text-center w-100">Delete</button>
                </form>
            </c:when>
            <c:when test="${requestScope.entity == 'news' && not empty requestScope.editNews}">
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="news">
                    <input type="hidden" name="command" value="edit">
                    <input type="hidden" name="id" value="${requestScope.editObj.getNewsId()()}">
                    <div class="input-group">
                        <label for="nTitle" class="form-label col">News title:</label>
                        <input type="text" id="nTitle" name="nTitle" class="form-control col"
                               value="${requestScope.editObj.getPublicationName()}" required>
                    </div>
                    <div class="input-group">
                        <label for="nShort" class="form-label col">Short content:</label>
                        <textarea name="nShort" cols="30" rows="10" id="nShort">
                                ${requestScope.editObj.getShortContent()}
                        </textarea>
                    </div>
                    <div class="input-group">
                        <label for="textarea" class="form-label col">Content:</label>
                        <textarea name="nContent" cols="30" rows="10" id="textarea">
                                ${requestScope.editObj.getContent()}
                        </textarea>
                    </div>
                    <div class="input-group">
                        <label for="nPicUrl" class="form-label col">Picture URL:</label>
                        <input type="text" id="nPicUrl" name="nPicUrl" class="form-control col"
                               value="${requestScope.editObj.getPublicationName()}" required>
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
                    <button type="submit" class="btn btn-primary text-center w-100 p-2">Edit</button>
                </form>
                <form action="${pageContext.request.contextPath}/sprint2_admin" method="post">
                    <input type="hidden" name="entity" value="news">
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="id" value="${requestScope.editObj.getNewsId()}">
                    <button class="btn btn-danger text-center w-100">Delete</button>
                </form>
            </c:when>
        </c:choose>
    </div>
</main>
</body>
</html>
