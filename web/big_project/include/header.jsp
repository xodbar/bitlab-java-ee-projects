<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<header class="header bg-dark w-100">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark pt-4 pb-3">
            <div class="container-fluid">
                <a class="navbar-brand col-2" href="${pageContext.request.contextPath}/freelancex">
                    <img src="${pageContext.request.contextPath}/big_project/media/navLogo.png"
                         class="w-100" alt="freelanceX logo" />
                </a>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarText"
                        aria-controls="navbarText"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 col-6">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/freelancex">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="cursor: pointer"
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser}">
                                    data-bs-target="#addPostModal"
                                    data-bs-toggle="modal" data-bs-dismiss="modal"
                                </c:when>
                                <c:otherwise>
                                    data-bs-target="#exampleModalToggle"
                                    data-bs-toggle="modal" data-bs-dismiss="modal"
                                </c:otherwise>
                            </c:choose>>
                               Add Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"></a>
                        </li>
                    </ul>
                    <form class="d-flex input-group m-0">
                        <input type="text" class="form-control" placeholder="Search by title"
                               aria-label="Search by title" aria-describedby="button" name="search">
                        <button class="btn btn-outline-light" type="submit" id="button">Go</button>
                    </form>
                    <div class="d-flex align-items-center justify-content-between col-3 ms-3" >
                        <div class="d-flex align-items-center justify-content-between col">
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser}">
                                        <div class="nav-item dropdown ms-5">
                                            <a class="nav-link dropdown-toggle text-light align-self-end"
                                               href="#" id="navbarDropdown"
                                               role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    ${sessionScope.currentUser.getUsername()}
                                                    <span class="ms-2">
                                                        <img src="${sessionScope.currentUser.getAvatarUrl()}"
                                                             class="rounded-circle"
                                                             alt="avatar" width="45px" height="45px">
                                                    </span>
                                            </a>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <li>
                                                    <form action="${pageContext.request.contextPath}/freelancex/profile"
                                                          method="get">
                                                        <button class="link dropdown-item">
                                                            Profile Details
                                                        </button>
                                                    </form>
                                                </li>
                                                <c:if test="${sessionScope.currentUser.getId() == 1}">
                                                    <a href="${pageContext.request.contextPath}/freelancex/admin"
                                                       class="dropdown-item">
                                                        Admin Panel
                                                    </a>
                                                </c:if>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li>
                                                    <form action="${pageContext.request.contextPath}/freelancex/login"
                                                        method="post">
                                                        <input type="hidden" name="command" value="out">
                                                        <button class="dropdown-item" href="#" role="button" type="submit">
                                                            Log Out
                                                        </button>
                                                    </form>
                                                </li>
                                            </ul>
                                        </div>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-outline-light col ms-3 text-center" data-bs-toggle="modal"
                                            href="#exampleModalToggle" role="button">
                                        Sign In
                                    </button>
                                    <button class="btn btn-light col ms-3 text-center"
                                            data-bs-target="#exampleModalToggle2"
                                            data-bs-toggle="modal" data-bs-dismiss="modal">
                                        Sign Up
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <nav class="navbar container navbar-expand-lg navbar-light bg-light">
            <button
                    class="navbar-toggler align-self-center"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarFields"
                    aria-controls="navbarFields"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-flex align-items-center justify-content-center" id="navbarFields">
                <ul class="navbar-nav m-auto col-11 d-flex align-items-center justify-content-between text-center fw-semibold fs-5">
                    <c:set var="fields" value="${requestScope.fields}"/>
                    <c:choose>
                        <c:when test="${not empty fields}">
                            <c:forEach var="field" items="${fields}">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/freelancex?command=filter&field=${field.getName()}"
                                       class="nav-link link-dark">
                                            ${field.getName()} (${field.getTotalOrdersNumber()})
                                    </a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a href="#" class="link-warning">An error was occurred while getting fields.
                                    Click to try again</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>
    </div>
</header>

<c:choose>
    <c:when test="${empty sessionScope.currentUser}">
    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel">Sign In</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/freelancex/login" method="get">
                        <div class="input-group mb-3">
                            <label for="username" class="form-label col-4">Username:</label>
                            <input type="text" id="username" name="username" class="form-control col-8" required>
                        </div>
                        <div class="input-group mb-3">
                            <label for="password" class="form-label col-4">Password:</label>
                            <input type="password" id="password" name="password" class="form-control col-8" required>
                        </div>
                        <button class="btn btn-outline-primary w-100" type="submit">Sign In</button>
                    </form>
                </div>
                <div class="modal-footer">
                    Don't have an account? <button class="btn btn-primary ms-2" data-bs-target="#exampleModalToggle2"
                                                   data-bs-toggle="modal" data-bs-dismiss="modal">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalToggleLabel2">Sign Up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/freelancex/login" method="post">
                        <input type="hidden" name="command" value="up">
                        <div class="input-group mb-3">
                            <label for="usernameL" class="form-label col-4">Username:</label>
                            <input type="text" id="usernameL" name="username" class="form-control col-8" required>
                        </div>
                        <div class="input-group mb-3">
                            <label for="passwordL" class="form-label col-4">Password:</label>
                            <input type="password" id="passwordL" name="password" class="form-control col-8" required>
                        </div>
                        <div class="input-group mb-3">
                            <label for="phone" class="form-label col-4">Phone:</label>
                            <input type="text" id="phone" name="phone" class="form-control col-8" required>
                        </div>
                        <button class="btn btn-primary w-100" type="submit">Sign Up</button>
                    </form>
                </div>
                <div class="modal-footer">
                    Already have an account? <button class="btn btn-outline-primary ms-2" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Sign In</button>
                </div>
            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
        <div class="modal fade modal-lg" id="addPostModal" aria-hidden="true" aria-labelledby="addPostModalLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPostModalLabel">Add Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/freelancex" method="post">
                            <div class="input-group mb-3">
                                <label for="title" class="form-label col-4">Title:</label>
                                <input type="text" id="title" name="title" class="form-control col-8" required>
                            </div>
                            <div class="input-group mb-3">
                                <label for="deadline" class="form-label col-4">Deadline:</label>
                                <input type="datetime-local" id="deadline" name="deadline" class="form-control col-8" required>
                            </div>
                            <div class="input-group mb-3">
                                <label for="payment" class="form-label col-4">Payment ($USD):</label>
                                <input type="number" id="payment" name="payment" class="form-control col-8" maxlength="6" required>
                            </div>
                            <div class="input-group mb-3">
                                <label for="field" class="form-label col-4">Field:</label>
                                <select name="field" id="field" required class="form-control">
                                    <c:forEach var="field" items="${fields}">
                                        <option value="${field.getName()}">${field.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="input-group d-block mb-3">
                                <label for="textareaContent" class="form-label col-4">Content:</label>
                                <textarea name="content" id="textareaContent" cols="30" rows="75"
                                          class="textarea form-control h-auto"></textarea>
                            </div>
                            <button class="btn btn-outline-primary w-100" type="submit">Add Order</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>