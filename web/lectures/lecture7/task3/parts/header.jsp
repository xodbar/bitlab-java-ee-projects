<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header text-light bg-dark">
  <div class="container">
    <nav class="nav navbar-expand-lg navbar-dark bg-dark">
      <a href="${pageContext.request.contextPath}/lec7task3" class="navbar-brand">Session Login Handler</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-target="#navbarItems"
              aria-controls="navbarItems" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarItems">
        <div class="navbar-nav">
          <a href="${pageContext.request.contextPath}/lec7task3" class="nav-link">Index</a>
          <a href="${pageContext.request.contextPath}/lec7task3?page=profile" class="nav-link"
             <c:if test="${empty sessionScope.current_user}">disabled="disabled"</c:if>>
            Profile
          </a>
        </div>
      </div>
    </nav>
  </div>
</header>