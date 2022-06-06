<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: '#textarea'
    });
</script>


<c:if test="${empty sessionScope.current_user}">
    <div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/sprint2_login" method="post">
                        <input type="hidden" name="log" value="up">
                        <div class="input-group mb-3">
                            <label for="new_username" class="form-label col">Username:</label>
                            <input type="text" class="form-control col" name="username" id="new_username" required>
                        </div>
                        <div class="input-group mb-4">
                            <label for="new_password" class="form-label col">Password:</label>
                            <input type="password" class="form-control col" name="password" id="new_password" required>
                        </div>
                        <div class="input-group mb-3">
                            <label for="new_password_rep" class="form-label col">Repeat password:</label>
                            <input type="password" class="form-control col" name="repeat_password"
                                   id="new_password_rep" required>
                        </div>
                        <div class="input-group mb-3 justify-content-around">
                            <button type="submit" class="btn btn-primary col-5">Sign Up</button>
                            <button type="reset" class="btn btn-secondary col-5">Reset</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <span class="text-secondary">
                        Already have an account?
                        <a class="link-primary px-2 text-decoration-none fw-bold" style="cursor:pointer;"
                           data-bs-target="#signInModal" data-bs-toggle="modal">
                            Sign In
                        </a>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signInModalLabel">Sign In</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/sprint2_login" method="post">
                        <input type="hidden" name="log" value="in">
                        <div class="input-group mb-3">
                            <label for="username" class="form-label col">Username:</label>
                            <input type="text" class="form-control col" name="username" id="username" required>
                        </div>
                        <div class="input-group mb-4">
                            <label for="password" class="form-label col">Password:</label>
                            <input type="password" class="form-control col" name="password" id="password" required>
                        </div>
                        <div class="input-group mb-3 justify-content-around">
                            <button type="submit" class="btn btn-primary col-5">Sign In</button>
                            <button type="reset" class="btn btn-secondary col-5">Reset</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <span class="text-secondary">
                        Don't have an account?
                        <a class="link-primary px-2 text-decoration-none fw-bold" style="cursor:pointer;"
                           data-bs-target="#signUpModal" data-bs-toggle="modal">
                            Sign Up
                        </a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</c:if>

<header class="header bg-dark sticky-top border-bottom border-dark">
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <div class="container">
            <a href="${pageContext.request.contextPath}/sprint2?filter=none" class="navbar-brand">
                <img src="https://icons-for-free.com/download-icon-morning+news+newspaper+icon-1320136429130706490_512.png"
                     alt="" width="30" height="30"
                     class="d-inline-block align-text-top">
                World News
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExpand"
                    aria-controls="navbarExpand" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarExpand">
                <ul class="navbar-nav me-auto my-2 my-lg-0">
                    <c:choose>
                        <c:when test="${not empty requestScope.languages}">
                            <c:forEach var="lang" items="${requestScope.languages}">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/sprint2?filter=lang&lang=${lang.getCode()}"
                                       class="nav-link <c:if test="${not empty requestScope.filter_lang}">
                                                <c:if test="${requestScope.filter_lang == lang.getCode()}">
                                                    active fw-bold
                                                </c:if>
                                            </c:if>" style="text-transform: uppercase">
                                        ${lang.getLanguageName()}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2" class="nav-link">
                                    Error while loading languages. Click to try again
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <div class="align-self-end">
                    <c:choose>
                        <c:when test="${not empty sessionScope.current_user}">
                            <div class="d-flex align-items-center justify-content-between">
                                <form action="${pageContext.request.contextPath}/sprint2_login" method="post"
                                      class="align-items-center h-100">
                                    <input type="hidden" name="log" value="out">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        Log Out (${sessionScope.current_user.getUsername()})
                                        <i class="fa-solid fa-arrow-right-from-bracket"></i></button>
                                </form>
                                <c:if test="${sessionScope.current_user.getUserId() == 1}">
                                    <a href="${pageContext.request.contextPath}/sprint2_admin" class="text-decoration-none">
                                        Admin Panel
                                    </a>
                                </c:if>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-light fs-6" data-bs-toggle="modal"
                                    data-bs-target="#signInModal">
                                Sign In
                            </button>
                            <button type="button" class="btn btn-primary ms-2 fs-6" data-bs-toggle="modal"
                                    data-bs-target="#signUpModal">
                                Sign Up
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid bg-light">
        <nav class="navbar navbar-light navbar-expand-lg">
            <div class="container">
                <ul class="navbar-nav me-auto my-2 my-lg-0">
                    <c:choose>
                        <c:when test="${not empty requestScope.publications}">
                            <c:forEach var="publication" items="${requestScope.publications}">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/sprint2?filter=pub&pub=${publication.getPublicationName()}"
                                       class="nav-link <c:if test="${not empty requestScope.filter_pub}">
                                                <c:if test="${requestScope.filter_pub.getPublicationName() == publication.getPublicationName()}">
                                                    active fw-bold
                                                </c:if>
                                            </c:if>" style="text-transform: uppercase">
                                            ${publication.getPublicationName()}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2" class="nav-link">
                                    Error while loading publications. Click to try again
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>
    </div>
</header>