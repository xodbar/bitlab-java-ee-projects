<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: '#textarea',
        force_br_newlines : true,
        force_p_newlines : false,
        forced_root_block : ''
    });
</script>

<style>
    td:last-child, th:last-child {
        text-align: center;
    }
</style>

<header class="header bg-dark sticky-top border-bottom border-dark">
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <div class="container">
            <a href="${pageContext.request.contextPath}/sprint2" class="navbar-brand">
                <img src="https://icons-for-free.com/download-icon-morning+news+newspaper+icon-1320136429130706490_512.png"
                     alt="" width="30" height="30"
                     class="d-inline-block align-text-top">
                Admin WN
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExpand"
                    aria-controls="navbarExpand" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarExpand">
                <ul class="navbar-nav me-auto my-2 my-lg-0">
                    <c:choose>
                        <c:when test="${not empty sessionScope.current_user && sessionScope.current_user.getUserId() == 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2_admin?entity=users" class="nav-link">
                                    Users
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2_admin?entity=languages" class="nav-link">
                                    Languages
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2_admin?entity=publications" class="nav-link">
                                    Publications
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2_admin?entity=newsA" class="nav-link">
                                    News
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${pageContext.request.contextPath}/sprint2" class="nav-link">
                                    Access error. Click to get back to main page
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</header>