<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Card-Shop</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a href="${pageContext.request.contextPath}/lec7task2" class="nav-link">
                        Items
                    </a>
                    <a href="${pageContext.request.contextPath}/lec7task2?card=show" class="nav-link">
                        Card
                        <c:if test="${not empty sessionScope.card}">
                            <span class="text-success">(${sessionScope.card.getCard().size()})</span>
                        </c:if>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</header>